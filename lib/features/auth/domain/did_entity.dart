import 'dart:convert';
import 'dart:typed_data';

/// DID entity for SSI-PKI authentication.
/// 
/// Format: `did:key:<base64url(publicKeyRaw)>`
/// The private key NEVER leaves SecureStorage.
class DID {
  final String did;
  final String publicKeyHex;
  final int? userID;

  const DID({
    required this.did,
    required this.publicKeyHex,
    this.userID,
  });

  Map<String, dynamic> toJson() => {
        'did': did,
        'public_key_hex': publicKeyHex,
      };

  @override
  String toString() => 'DID(did: $did)';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DID && runtimeType == other.runtimeType && did == other.did;

  @override
  int get hashCode => did.hashCode;
}

/// Encode bytes to base64url (no padding).
String base64urlEncode(Uint8List bytes) {
  return base64Url.encode(bytes).replaceAll('=', '');
}

/// Decode hex string to bytes.
Uint8List hexToBytes(String hex) {
  final result = Uint8List(hex.length ~/ 2);
  for (var i = 0; i < hex.length; i += 2) {
    result[i ~/ 2] = int.parse(hex.substring(i, i + 2), radix: 16);
  }
  return result;
}

/// Encode bytes to hex string.
String bytesToHex(Uint8List bytes) {
  final sb = StringBuffer();
  for (var i = 0; i < bytes.length; i++) {
    sb.write(bytes[i].toRadixString(16).padLeft(2, '0'));
  }
  return sb.toString();
}
