import 'dart:math';
import 'dart:typed_data';

import 'package:cryptography/cryptography.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scarlet_app/core/storage/secure_storage.dart';

/// Provider for TOTPService
final totpServiceProvider = Provider<TOTPService>((ref) {
  return TOTPService(ref.watch(secureStorageProvider));
});

/// TOTP session tracking provider.
/// Tracks whether TOTP has been verified in the current session.
/// Default true (doesn't block), set to false after SSI login when TOTP enabled.
final totpSessionVerifiedProvider = StateProvider<bool>((ref) => true);

/// Service for TOTP (Time-based One-Time Password) 2FA.
/// 
/// Implements RFC 6238 with HMAC-SHA1, 6 digits, 30-second period.
class TOTPService {
  final SecureStorageService _storage;
  static const _totpSecretKey = 'totp_secret';
  static const _totpEnabledKey = 'totp_enabled';

  static const int _period = 30;
  static const int _digits = 6;
  static const int _secretLength = 20; // bytes → 32 base32 chars

  TOTPService(this._storage);

  /// Generate a new random TOTP secret (base32-encoded).
  String generateSecret() {
    final random = Random.secure();
    final bytes = Uint8List(_secretLength);
    for (var i = 0; i < _secretLength; i++) {
      bytes[i] = random.nextInt(256);
    }
    return _base32Encode(bytes);
  }

  /// Get the OTPAuth URI for QR code generation.
  String getOtpAuthUri(String secret, String email, {String issuer = 'Scarlet'}) {
    final encodedIssuer = Uri.encodeComponent(issuer);
    final encodedAccount = Uri.encodeComponent(email);
    return 'otpauth://totp/$encodedIssuer:$encodedAccount'
        '?secret=$secret&issuer=$encodedIssuer'
        '&algorithm=SHA1&digits=$_digits&period=$_period';
  }

  /// Verify a TOTP code against the stored secret.
  /// Checks current window ±1 for clock drift tolerance.
  Future<bool> verifyCode(String secret, String code) async {
    try {
      final secretBytes = _base32Decode(secret);
      final now = DateTime.now().millisecondsSinceEpoch ~/ 1000;
      final counter = now ~/ _period;

      // Check current + adjacent windows
      for (var offset = -1; offset <= 1; offset++) {
        final expected = await _generateTOTP(secretBytes, counter + offset);
        if (expected == code) return true;
      }
      return false;
    } catch (_) {
      return false;
    }
  }

  /// Generate TOTP code for a given counter value.
  Future<String> _generateTOTP(Uint8List secret, int counter) async {
    // Build 8-byte counter buffer (big-endian)
    final counterBytes = Uint8List(8);
    var c = counter;
    for (var i = 7; i >= 0; i--) {
      counterBytes[i] = c & 0xff;
      c >>= 8;
    }

    // HMAC-SHA1
    final hmac = Hmac.sha1();
    final mac = await hmac.calculateMac(counterBytes, secretKey: SecretKey(secret));
    final hash = mac.bytes;

    // Dynamic truncation
    final offset = hash[hash.length - 1] & 0x0f;
    final binary = ((hash[offset] & 0x7f) << 24) |
        ((hash[offset + 1] & 0xff) << 16) |
        ((hash[offset + 2] & 0xff) << 8) |
        (hash[offset + 3] & 0xff);

    final otp = binary % pow(10, _digits).toInt();
    return otp.toString().padLeft(_digits, '0');
  }

  /// Store the TOTP secret.
  Future<void> saveSecret(String secret) async {
    await _storage.write(key: _totpSecretKey, value: secret);
  }

  /// Retrieve the stored TOTP secret.
  Future<String?> getSecret() async {
    return await _storage.read(key: _totpSecretKey);
  }

  /// Check if TOTP is enabled.
  Future<bool> isEnabled() async {
    final raw = await _storage.read(key: _totpEnabledKey);
    return raw == 'true';
  }

  /// Enable/disable TOTP.
  Future<void> setEnabled(bool enabled) async {
    await _storage.write(key: _totpEnabledKey, value: enabled.toString());
  }

  /// Clear TOTP data (disable 2FA).
  Future<void> clear() async {
    await _storage.delete(key: _totpSecretKey);
    await _storage.delete(key: _totpEnabledKey);
  }

  /// Base32 encoding (RFC 4648).
  String _base32Encode(Uint8List bytes) {
    const alphabet = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ234567';
    var result = '';
    var bits = 0;
    var value = 0;

    for (final byte in bytes) {
      value = (value << 8) | byte;
      bits += 8;
      while (bits >= 5) {
        result += alphabet[(value >> (bits - 5)) & 0x1f];
        bits -= 5;
      }
    }

    if (bits > 0) {
      result += alphabet[(value << (5 - bits)) & 0x1f];
    }

    return result;
  }

  /// Base32 decoding (RFC 4648).
  Uint8List _base32Decode(String encoded) {
    const alphabet = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ234567';
    final clean = encoded.toUpperCase().replaceAll('=', '');
    
    var bits = 0;
    var value = 0;
    final result = <int>[];

    for (final char in clean.codeUnits) {
      final idx = alphabet.indexOf(String.fromCharCode(char));
      if (idx < 0) continue;
      value = (value << 5) | idx;
      bits += 5;
      if (bits >= 8) {
        result.add((value >> (bits - 8)) & 0xff);
        bits -= 8;
      }
    }

    return Uint8List.fromList(result);
  }
}
