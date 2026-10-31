import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scarlet_app/features/auth/domain/auth_repository.dart';
import 'package:scarlet_app/features/auth/domain/user_entity.dart';
import 'package:scarlet_app/features/auth/domain/did_entity.dart';
import 'package:scarlet_app/core/network/dio_client.dart';
import 'package:scarlet_app/core/storage/secure_storage.dart';
import 'package:scarlet_app/features/auth/data/ed25519_service.dart';
/// Provider for the auth repository
final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepositoryImpl(
    ref.watch(dioProvider),
    ref.watch(secureStorageProvider),
    ref.watch(ed25519ServiceProvider),
  );
});

class AuthRepositoryImpl implements AuthRepository {
  final Dio _dio;
  final SecureStorageService _storage;
  final Ed25519Service _ed25519;

  AuthRepositoryImpl(this._dio, this._storage, this._ed25519);

  @override
  Future<User> login(String email, String password) async {
    try {
      final response = await _dio.post(
        '/api/v1/auth/login',
        data: {
          'email': email,
          'password': password,
        },
      );

      final data = response.data as Map<String, dynamic>;
      final token = data['token'] as String?;
      if (token == null || token.isEmpty) {
        throw Exception('No se recibió token de autenticación');
      }

      // Store the JWT
      await _storage.saveToken(token);

      // Parse user from response
      final userJson = data['user'] as Map<String, dynamic>? ?? data;
      final user = User.fromJson(userJson);

      // Store user ID for later use
      await _storage.saveUserId(user.id);

      return user;
    } on DioException catch (e) {
      if (e.response != null) {
        final msg = e.response?.data?['message'] ?? 'Error en el login';
        throw Exception(msg);
      }
      throw Exception('Error de conexión: ${e.message}');
    }
  }

  @override
  Future<void> logout() async {
    await _storage.clearSession();
    // Note: We do NOT clear the DID/private key — the identity persists across sessions.
    // Only the JWT session token and the cached profile are cleared.
  }

  @override
  Future<bool> isAuthenticated() async {
    final token = await _storage.getToken();
    return token != null && token.isNotEmpty;
  }

  @override
  Future<User> getCurrentUser() async {
    try {
      final response = await _dio.get('/api/v1/users/me');
      final data = response.data as Map<String, dynamic>;
      // API returns { user: { ... } }
      final userData = data['user'] as Map<String, dynamic>? ?? data;
      return User.fromJson(userData);
    } on DioException catch (e) {
      if (e.response?.statusCode == 401 || e.response?.statusCode == 403) {
        throw AuthUnauthorizedException(_extractErrorMessage(e));
      }
      if (e.response != null) {
        final msg = e.response?.data?['message'] ?? 'Error al obtener perfil';
        throw Exception(msg);
      }
      throw Exception('Error de conexión: ${e.message}');
    }
  }

  // --- SSI-PKI Methods ---

  @override
  Future<int> registerSSI({
    required String fullName,
    required String email,
    required String ci,
  }) async {
    final did = await _ed25519.generateDID();

    try {
      final response = await _dio.post(
        '/api/v1/auth/ssi/register',
        data: {
          'did': did.did,
          'full_name': fullName,
          'email': email,
          'public_key_hex': did.publicKeyHex,
          'ci': ci,
        },
      );

      final data = response.data;
      Map<String, dynamic> jsonData;
      if (data is Map<String, dynamic>) {
        jsonData = data;
      } else if (data is List && data.isNotEmpty && data.first is Map) {
        jsonData = data.first as Map<String, dynamic>;
      } else {
        jsonData = {};
      }
      
      final userId = jsonData['user_id'] as int?;
      if (userId == null) {
        throw Exception('No se recibió user_id del servidor');
      }

      await _storage.saveUserId(userId);
      await _storage.setAuthMethod('ssi');

      return userId;
    } on DioException catch (e) {
      if (e.response != null) {
        String msg = _extractErrorMessage(e);
        if (msg.contains('users_email_key') || msg.contains('duplicate key')) {
          msg = 'Este correo ya tiene una identidad registrada. Inicie sesión.';
        }
        throw Exception(msg);
      }
      throw Exception('Error de conexión: ${e.message}');
    }
  }

  @override
  Future<User> loginSSI() async {
    final did = await _ed25519.getStoredDID();
    if (did == null) {
      throw Exception('No hay identidad SSI registrada en este dispositivo');
    }

    try {
      final challengeResp = await _dio.post(
        '/api/v1/auth/ssi/challenge',
        data: {'did': did.did},
      );

      final challengeData = _parseResponse(challengeResp.data);
      final nonceHex = challengeData['challenge_nonce'] as String? ??
          challengeData['challengeNonce'] as String?;
      if (nonceHex == null || nonceHex.isEmpty) {
        throw Exception('No se recibió challenge nonce del servidor');
      }

      final signatureHex = await _ed25519.sign(nonceHex);

      final verifyResp = await _dio.post(
        '/api/v1/auth/ssi/verify',
        data: {
          'did': did.did,
          'challenge_nonce': nonceHex,
          'signature_hex': signatureHex,
        },
      );

      final verifyData = _parseResponse(verifyResp.data);
      final token = verifyData['token'] as String?;
      if (token == null || token.isEmpty) {
        throw Exception('No se recibió token de autenticación');
      }
      await _storage.saveToken(token);

      // Parse user from response
      final userJson = verifyData['user'] as Map<String, dynamic>? ?? verifyData;
      final user = User.fromJson(userJson);
      await _storage.saveUserId(user.id);
      await _storage.setAuthMethod('ssi');
      
      // Save role and team for RBAC filtering
      if (user.role != null) {
        await _storage.saveUserRole(user.role!);
      }
      if (user.teamId != null) {
        await _storage.saveTeamId(user.teamId!);
      }

      return user;
    } on DioException catch (e) {
      if (e.response != null) {
        throw Exception(_extractErrorMessage(e));
      }
      throw Exception('Error de conexión: ${e.message}');
    }
  }

  /// Check if a user exists by attempting challenge with local DID.
  /// Returns true if challenge succeeds, false if "user not found".
  @override
  Future<bool> checkUserExists() async {
    final did = await _ed25519.getStoredDID();
    if (did == null) return false;

    try {
      await _dio.post(
        '/api/v1/auth/ssi/challenge',
        data: {'did': did.did},
      );
      return true;
    } on DioException catch (e) {
      if (e.response != null) {
        final msg = _extractErrorMessage(e);
        if (msg.contains('user not found') || msg.contains('DID no encontrado')) {
          return false;
        }
      }
      rethrow;
    }
  }

  /// Extract error message from response body or gRPC headers.
  String _extractErrorMessage(DioException e) {
    String? msg = e.response?.data?['message'];
    if (msg == null || msg.isEmpty) {
      final grpcMessage = e.response?.headers['grpc-message']?.first;
      if (grpcMessage != null && grpcMessage.isNotEmpty) {
        msg = grpcMessage;
      } else {
        msg = 'Error del servidor';
      }
    }
    return msg;
  }

  /// Safely parse response data to Map.
  Map<String, dynamic> _parseResponse(dynamic data) {
    if (data is Map<String, dynamic>) return data;
    if (data is List && data.isNotEmpty && data.first is Map) {
      return data.first as Map<String, dynamic>;
    }
    return {};
  }

  @override
  Future<List<DID>> getDIDsByEmail(String email) async {
    try {
      final response = await _dio.post('/api/v1/auth/ssi/dids', data: {'email': email});
      final data = _parseResponse(response.data);
      final didsList = data['dids'] as List? ?? [];
      return didsList.map((d) => DID(
        did: d['did'] as String? ?? '',
        publicKeyHex: d['publicKeyHex'] as String? ?? '',
        userID: d['userId'] as int? ?? d['user_id'] as int?,
      )).toList();
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) {
        return [];
      }
      throw Exception(_extractErrorMessage(e));
    }
  }

  @override
  Future<DID> getDIDByEmail(String email) async {
    try {
      final response = await _dio.post('/api/v1/auth/ssi/dids', data: {'email': email});
      final data = _parseResponse(response.data);
      final didsList = data['dids'] as List? ?? [];
      if (didsList.isEmpty) {
        return DID(did: '', publicKeyHex: '');
      }
      final first = didsList.first;
      return DID(
        did: first['did'] as String? ?? '',
        publicKeyHex: first['publicKeyHex'] as String? ?? '',
        userID: first['userId'] as int? ?? first['user_id'] as int?,
      );
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) {
        return DID(did: '', publicKeyHex: '');
      }
      throw Exception(_extractErrorMessage(e));
    }
  }

  @override
  Future<void> replaceDID({required String email, required String newDID, required String newPublicKeyHex}) async {
    try {
      await _dio.post('/api/v1/auth/ssi/did/replace', data: {
        'email': email,
        'new_did': newDID,
        'new_public_key_hex': newPublicKeyHex,
      });
    } on DioException catch (e) {
      if (e.response != null) {
        throw Exception(_extractErrorMessage(e));
      }
      throw Exception('Error de conexión: ${e.message}');
    }
  }

  @override
  Future<void> addDID({required int userID, required String did, required String publicKeyHex, required String deviceName, String? totpCode}) async {
    try {
      // C3: registrar un dispositivo exige el código TOTP del authenticator,
      // validado en el servidor (secreto en vault.user_totp_secrets).
      await _dio.post(
        '/api/v1/auth/ssi/did/add',
        data: {
          'user_id': userID,
          'did': did,
          'public_key_hex': publicKeyHex,
          'device_name': deviceName,
        },
        options: totpCode == null
            ? null
            : Options(headers: {'X-TOTP-Code': totpCode}),
      );
    } on DioException catch (e) {
      if (e.response != null) {
        throw Exception(_extractErrorMessage(e));
      }
      throw Exception('Error de conexión: ${e.message}');
    }
  }

  @override
  Future<String> createTOTPSecret(int userID) async {
    final resp = await _dio.post('/api/v1/vault/totp', data: {
      'user_ref': {'user_id': '$userID'},
    });
    final data = _parseResponse(resp.data);
    return (data['secretBase32'] ?? data['secret_base32'] ?? '') as String;
  }
}
