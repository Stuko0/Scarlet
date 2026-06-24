import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scarlet_app/features/auth/domain/user_entity.dart';
import 'package:scarlet_app/features/auth/data/auth_repository_impl.dart';
import 'package:scarlet_app/core/storage/secure_storage.dart';

/// Auth state — holds the current user (null if not logged in)
final authControllerProvider =
    AsyncNotifierProvider<AuthController, User?>(() => AuthController());

class AuthController extends AsyncNotifier<User?> {
  @override
  Future<User?> build() async {
    // On app start, check if we have a valid token
    final storage = ref.read(secureStorageProvider);
    final token = await storage.getToken();
    if (token != null && token.isNotEmpty) {
      // We have a token — user is "logged in"
      final userId = await storage.getUserId();
      if (userId != null) {
        return User(id: userId, fullName: '', email: '');
      }
    }
    return null;
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
