import 'user_entity.dart';

abstract class AuthRepository {
  Future<User> login(String email, String password);
  Future<void> logout();
  Future<bool> isAuthenticated();
  Future<User> getCurrentUser();
}
