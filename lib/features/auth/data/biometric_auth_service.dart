import 'package:local_auth/local_auth.dart';
import 'package:local_auth_android/local_auth_android.dart';

class BiometricAuthService {
  final LocalAuthentication _localAuth = LocalAuthentication();

  Future<bool> canAuthenticate() async {
    final available = await _localAuth.getAvailableBiometrics();
    return available.isNotEmpty && await _localAuth.isDeviceSupported();
  }

  Future<bool> authenticate() async {
    return await _localAuth.authenticate(
      localizedReason: 'Desbloquea Scarlet',
      authMessages: const [
        AndroidAuthMessages(
          signInTitle: 'Autenticación biométrica',
          cancelButton: 'Cancelar',
        ),
      ],
      options: const AuthenticationOptions(
        biometricOnly: true,
        stickyAuth: true,
      ),
    );
  }
}
