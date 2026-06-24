import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

/// Provider for secure storage service
final secureStorageProvider = Provider<SecureStorageService>((ref) {
  return SecureStorageService();
});

/// Wrapper around FlutterSecureStorage for JWT token management
class SecureStorageService {
  static const _tokenKey = 'jwt_token';
  static const _userIdKey = 'user_id';

  final FlutterSecureStorage _storage = const FlutterSecureStorage(
    aOptions: AndroidOptions(encryptedSharedPreferences: true),
  );

  // --- Token ---

  Future<String?> getToken() async {
    return await _storage.read(key: _tokenKey);
  }

  Future<void> saveToken(String token) async {
    await _storage.write(key: _tokenKey, value: token);
  }

  Future<void> deleteToken() async {
    await _storage.delete(key: _tokenKey);
  }

  // --- User ID ---

  Future<int?> getUserId() async {
    final raw = await _storage.read(key: _userIdKey);
    return raw != null ? int.tryParse(raw) : null;
  }

  Future<void> saveUserId(int userId) async {
    await _storage.write(key: _userIdKey, value: userId.toString());
  }

  // --- Clear All ---

  Future<void> clearAll() async {
    await _storage.deleteAll();
  }

  // --- Biometric ---

  static const _biometricEnabledKey = 'biometric_enabled';

  Future<bool> isBiometricEnabled() async {
    final raw = await _storage.read(key: _biometricEnabledKey);
    return raw == 'true';
  }

  Future<void> setBiometricEnabled(bool enabled) async {
    await _storage.write(
      key: _biometricEnabledKey,
      value: enabled.toString(),
    );
  }
}
