import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scarlet_app/features/auth/data/biometric_auth_service.dart';

final biometricAuthServiceProvider = Provider<BiometricAuthService>((ref) {
  return BiometricAuthService();
});
