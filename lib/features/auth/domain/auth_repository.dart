import 'user_entity.dart';

/// Abstract contract for authentication operations
abstract class AuthRepository {
  /// Login with email/password. Returns the authenticated User.
  /// Throws on failure.
  Future<User> login(String email, String password);

  /// Logout — clears stored credentials
  Future<void> logout();

  /// Check if a valid token exists
  Future<bool> isAuthenticated();
}
