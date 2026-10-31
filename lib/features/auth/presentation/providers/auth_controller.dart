import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scarlet_app/features/auth/domain/user_entity.dart';
import 'package:scarlet_app/features/auth/domain/auth_repository.dart';
import 'package:scarlet_app/features/auth/data/auth_repository_impl.dart';
import 'package:scarlet_app/features/auth/data/biometric_auth_provider.dart';
import 'package:scarlet_app/features/auth/data/ed25519_service.dart';
import 'package:scarlet_app/features/auth/data/totp_service.dart';
import 'package:scarlet_app/core/storage/secure_storage.dart';

final authControllerProvider =
    AsyncNotifierProvider<AuthController, User?>(() => AuthController());

class AuthController extends AsyncNotifier<User?> {
  @override
  Future<User?> build() async {
    final storage = ref.read(secureStorageProvider);
    final token = await storage.getToken();
    if (token == null || token.isEmpty) return null;

    if (!await _biometricAllows(storage)) return null;

    return _loadProfile();
  }

  Future<bool> _biometricAllows(SecureStorageService storage) async {
    if (!await storage.isBiometricEnabled()) return true;
    final biometricService = ref.read(biometricAuthServiceProvider);
    if (!await biometricService.canAuthenticate()) return true;
    return biometricService.authenticate();
  }

  /// Trae el perfil real desde /api/v1/users/me y lo cachea.
  /// 401/403 => sesión inválida (borra token). Error de red => caché local.
  Future<User?> _loadProfile() async {
    final repo = ref.read(authRepositoryProvider);
    try {
      final user = await repo.getCurrentUser();
      await _cache(user);
      return user;
    } on AuthUnauthorizedException {
      await _clearSession();
      return null;
    } catch (_) {
      return _readCachedUser();
    }
  }

  /// Refresca el perfil del usuario autenticado (pull-to-refresh del perfil).
  Future<User?> refreshCurrentUser() async {
    final storage = ref.read(secureStorageProvider);
    final token = await storage.getToken();
    if (token == null || token.isEmpty) {
      state = const AsyncValue.data(null);
      return null;
    }

    state = const AsyncValue.loading();
    final user = await _loadProfile();
    state = AsyncValue.data(user);
    return user;
  }

  Future<void> _cache(User user) async {
    final storage = ref.read(secureStorageProvider);
    await storage.saveUserProfileJson(jsonEncode(user.toJson()));
    await storage.saveUserId(user.id);
    if (user.role != null && user.role!.isNotEmpty) {
      await storage.saveUserRole(user.role!);
    }
    if (user.teamId != null) {
      await storage.saveTeamId(user.teamId!);
    }
  }

  Future<User?> _readCachedUser() async {
    final raw = await ref.read(secureStorageProvider).getUserProfileJson();
    if (raw == null || raw.isEmpty) return null;
    try {
      return User.fromJson(jsonDecode(raw) as Map<String, dynamic>);
    } catch (_) {
      return null;
    }
  }

  Future<void> _clearSession() async {
    await ref.read(secureStorageProvider).clearSession();
  }

  Future<void> login(String email, String password) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final repo = ref.read(authRepositoryProvider);
      final user = await repo.login(email, password);
      await _cache(user);
      return await _hydrateOr(user);
    });
  }

  /// Login con SSI-PKI: el verify solo devuelve token/did/ci/role, así que el
  /// perfil completo se hidrata siempre con /api/v1/users/me.
  Future<bool> loginSSI() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final repo = ref.read(authRepositoryProvider);
      final partial = await repo.loginSSI();
      return _hydrateOr(partial);
    });
    return !state.hasError;
  }

  Future<User> _hydrateOr(User fallback) async {
    try {
      final full = await ref.read(authRepositoryProvider).getCurrentUser();
      await _cache(full);
      return full;
    } catch (_) {
      await _cache(fallback);
      return fallback;
    }
  }

  Future<void> loginWithEmail(String email, {String? totpCode}) async {
    state = const AsyncValue.loading();
    final repo = ref.read(authRepositoryProvider);
    final ed25519 = ref.read(ed25519ServiceProvider);

    final localDID = await ed25519.getStoredDID();
    if (localDID != null) {
      try {
        final user = await repo.loginSSI();
        state = AsyncValue.data(await _hydrateOr(user));
        return;
      } catch (_) {
        await ed25519.clearDID();
      }
    }

    final newDID = await ed25519.generateDID();
    final existingDIDs = await repo.getDIDsByEmail(email);
    if (existingDIDs.isEmpty) {
      throw Exception(
          'Email no registrado. Cree una identidad primero en auth.stuko.dev.');
    }

    final existingUserID = existingDIDs.first.userID;
    if (existingUserID == null) {
      throw Exception('Error: no se pudo obtener el ID de usuario.');
    }
    // C3: registrar un dispositivo nuevo exige el código del authenticator.
    if (totpCode == null || totpCode.trim().isEmpty) {
      state = const AsyncValue.data(null);
      throw const _NeedsTotpException();
    }
    await repo.addDID(
      userID: existingUserID,
      did: newDID.did,
      publicKeyHex: newDID.publicKeyHex,
      deviceName: 'mobile',
      totpCode: totpCode.trim(),
    );

    final user = await repo.loginSSI();
    state = AsyncValue.data(await _hydrateOr(user));
  }

  Future<void> registerSSI({
    required String fullName,
    required String email,
    required String ci,
  }) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final repo = ref.read(authRepositoryProvider);
      final userId = await repo.registerSSI(
        fullName: fullName,
        email: email,
        ci: ci,
      );
      return User(
        id: userId,
        fullName: fullName,
        email: email,
        ci: ci,
        role: 'MEMBER',
      );
    });
  }

  Future<bool> hasLocalDID() async {
    final ed25519 = ref.read(ed25519ServiceProvider);
    return await ed25519.hasDID();
  }

  Future<String?> getStoredDID() async {
    final ed25519 = ref.read(ed25519ServiceProvider);
    final did = await ed25519.getStoredDID();
    return did?.did;
  }

  void markTOTPVerified() {
    ref.read(totpSessionVerifiedProvider.notifier).state = true;
  }

  Future<bool> checkEmailExists(String email) async {
    final ed25519 = ref.read(ed25519ServiceProvider);
    final did = await ed25519.getStoredDID();

    if (did == null) return false;

    try {
      final repo = ref.read(authRepositoryProvider);
      return await repo.checkUserExists();
    } catch (e) {
      final msg = e.toString();
      if (msg.contains('user not found') || msg.contains('DID no encontrado')) {
        await ed25519.clearDID();
        return false;
      }
      rethrow;
    }
  }

  Future<bool> hasLocalTOTPSecret() async {
    final totpService = ref.read(totpServiceProvider);
    final secret = await totpService.getSecret();
    return secret != null && secret.isNotEmpty;
  }

  Future<bool> loginWithTOTP(String code) async {
    final totpService = ref.read(totpServiceProvider);
    final secret = await totpService.getSecret();
    if (secret == null) return false;
    final ok = await totpService.verifyCode(secret, code);
    if (ok) {
      // C3: sincroniza el secreto TOTP con el servidor (vault) para que el
      // registro de un dispositivo nuevo (addDID) pueda validarse en el backend.
      await _ensureServerTotpSecret();
    }
    return ok;
  }

  /// Auto-sync (opción A): adopta el secreto TOTP del servidor una vez el login
  /// local haya validado. Así app y vault comparten secreto y addDID (que exige
  /// TOTP server-side) puede verificar el código del authenticator.
  Future<void> _ensureServerTotpSecret() async {
    try {
      final uid = await ref.read(secureStorageProvider).getUserId();
      if (uid == null) return;
      final serverSecret =
          await ref.read(authRepositoryProvider).createTOTPSecret(uid);
      if (serverSecret.isNotEmpty) {
        await ref.read(totpServiceProvider).saveSecret(serverSecret);
      }
    } catch (_) {
      // Si el sync con el servidor falla, no bloqueamos el login local.
    }
  }

  Future<bool> verifyTOTP(String code) async {
    final totpService = ref.read(totpServiceProvider);
    final secret = await totpService.getSecret();
    if (secret == null) return false;
    return await totpService.verifyCode(secret, code);
  }

  Future<void> setupTOTP(String secret) async {
    final totpService = ref.read(totpServiceProvider);
    await totpService.saveSecret(secret);
    await totpService.setEnabled(true);
  }

  Future<void> disableTOTP() async {
    final totpService = ref.read(totpServiceProvider);
    await totpService.clear();
  }

  /// Mantiene sincronizado el usuario en memoria y la caché tras un cambio
  /// de estado operativo hecho por el feature de personnel.
  Future<void> applyDutyStatus(String status) async {
    final user = state.valueOrNull;
    if (user == null) return;
    final updated = user.copyWith(dutyStatus: status);
    state = AsyncValue.data(updated);
    await _cache(updated);
  }

  Future<void> enableBiometric() async {
    final storage = ref.read(secureStorageProvider);
    await storage.setBiometricEnabled(true);
  }

  Future<void> disableBiometric() async {
    final storage = ref.read(secureStorageProvider);
    await storage.setBiometricEnabled(false);
  }

  Future<bool> isBiometricEnabled() async {
    final storage = ref.read(secureStorageProvider);
    return await storage.isBiometricEnabled();
  }

  Future<void> logout() async {
    final repo = ref.read(authRepositoryProvider);
    await repo.logout();
    await _clearSession();
    ref.read(totpSessionVerifiedProvider.notifier).state = true;
    state = const AsyncValue.data(null);
  }

  bool get isLoggedIn => state.valueOrNull != null;
}

/// Señal interna: el login detectó un dispositivo nuevo y necesita el código
/// del authenticator (TOTP) para poder registrar la clave en el servidor.
class _NeedsTotpException implements Exception {
  const _NeedsTotpException();
  @override
  String toString() => 'NEEDS_TOTP';
}

/// true si el error indica que se requiere TOTP (dispositivo nuevo).
bool isNeedsTotpError(Object e) => e is _NeedsTotpException || e.toString().contains('NEEDS_TOTP');
