import 'user_entity.dart';
import 'did_entity.dart';

/// El backend rechazó el token (expirado o inválido): la sesión ya no sirve.
class AuthUnauthorizedException implements Exception {
  final String message;

  const AuthUnauthorizedException([this.message = 'Sesión no válida']);

  @override
  String toString() => message;
}

abstract class AuthRepository {
  Future<User> login(String email, String password);
  Future<void> logout();
  Future<bool> isAuthenticated();
  Future<User> getCurrentUser();
  
  // SSI-PKI methods
  Future<int> registerSSI({
    required String fullName,
    required String email,
    required String ci,
  });
  Future<User> loginSSI();
  Future<DID> getDIDByEmail(String email);
  Future<void> replaceDID({required String email, required String newDID, required String newPublicKeyHex});
  Future<List<DID>> getDIDsByEmail(String email);
  Future<void> addDID({required int userID, required String did, required String publicKeyHex, required String deviceName, String? totpCode});
  Future<bool> checkUserExists();
  /// Crea/recicla el secreto TOTP en el vault y devuelve el secreto (base32).
  Future<String> createTOTPSecret(int userID);
}
