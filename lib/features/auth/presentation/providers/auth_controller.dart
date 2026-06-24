import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scarlet_app/features/auth/domain/user_entity.dart';
import 'package:scarlet_app/features/auth/data/auth_repository_impl.dart';
import 'package:scarlet_app/features/auth/data/biometric_auth_service.dart';
import 'package:scarlet_app/features/auth/data/biometric_auth_provider.dart';
import 'package:scarlet_app/core/storage/secure_storage.dart';

final authControllerProvider =
    AsyncNotifierProvider<AuthController, User?>(() => AuthController());

class AuthController extends AsyncNotifier<User?> {
  @override
  Future<User?> build() async {
    final storage = ref.read(secureStorageProvider);
    final token = await storage.getToken();
    if (token == null || token.isEmpty) return null;

    final biometricEnabled = await storage.isBiometricEnabled();
    if (biometricEnabled) {
      final biometricService = ref.read(biometricAuthServiceProvider);
      final canAuth = await biometricService.canAuthenticate();
      if (canAuth) {
        final authenticated = await biometricService.authenticate();
        if (!authenticated) return null;
      }
    }

    final repo = ref.read(authRepositoryProvider);
    try {
      return await repo.getCurrentUser();
    } catch (_) {
      return null;
    }
  }

  Future<void> login(String email, String password) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final repo = ref.read(authRepositoryProvider);
      return await repo.login(email, password);
    });
  }

  Future<void> logout() async {
    final repo = ref.read(authRepositoryProvider);
    await repo.logout();
    state = const AsyncValue.data(null);
  }

  bool get isLoggedIn => state.valueOrNull != null;
}
