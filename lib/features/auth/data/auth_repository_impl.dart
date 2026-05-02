import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scarlet_app/features/auth/domain/auth_repository.dart';
import 'package:scarlet_app/features/auth/domain/user_entity.dart';
import 'package:scarlet_app/core/network/dio_client.dart';
import 'package:scarlet_app/core/storage/secure_storage.dart';

/// Provider for the auth repository
final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepositoryImpl(
    dio: ref.watch(dioProvider),
    storage: ref.watch(secureStorageProvider),
  );
});

class AuthRepositoryImpl implements AuthRepository {
  final Dio _dio;
  final SecureStorageService _storage;

  AuthRepositoryImpl({required Dio dio, required SecureStorageService storage})
      : _dio = dio,
        _storage = storage;

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
    await _storage.clearAll();
  }

  @override
  Future<bool> isAuthenticated() async {
    final token = await _storage.getToken();
    return token != null && token.isNotEmpty;
  }
}
