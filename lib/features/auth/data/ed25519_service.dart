import 'dart:convert';
import 'dart:typed_data';

import 'package:cryptography/cryptography.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scarlet_app/core/storage/secure_storage.dart';
import 'package:scarlet_app/features/auth/domain/did_entity.dart';

/// Provider for Ed25519Service
final ed25519ServiceProvider = Provider<Ed25519Service>((ref) {
  return Ed25519Service(ref.watch(secureStorageProvider));
});

/// Service for Ed25519 key generation, storage, and signing.
/// 
/// Handles the SSI-PKI cryptographic operations:
/// - Generate DID (keypair) with private key in SecureStorage
/// - Sign challenge nonces for authentication
/// - Retrieve stored DID for login
class Ed25519Service {
  final SecureStorageService _storage;
  static const _privateKeyKey = 'ssi_private_key';
  static const _didKey = 'ssi_did';

  Ed25519Service(this._storage);

  /// Generate a new Ed25519 keypair, store private key securely, return DID.
  /// 
  /// The private key is stored as base64url-encoded raw bytes.
  /// The DID is `did:key:<base64url(publicKeyRaw)>`.
  Future<DID> generateDID() async {
    final algorithm = Ed25519();
    final keyPair = await algorithm.newKeyPair();
    
    // Export keys as raw bytes
    final publicKey = await keyPair.extractPublicKey();
    final privateKey = await keyPair.extractPrivateKeyBytes();
    
    final publicKeyBytes = Uint8List.fromList(publicKey.bytes);
    final privateKeyBytes = Uint8List.fromList(privateKey);
    
    // Encode for storage/transmission
    final publicKeyHex = bytesToHex(publicKeyBytes);
    final publicKeyB64 = base64urlEncode(publicKeyBytes);
    final privateKeyB64 = base64urlEncode(privateKeyBytes);
    
    // Store private key in SecureStorage
    await _storage.write(key: _privateKeyKey, value: privateKeyB64);
    
    // Build DID
    final did = 'did:key:$publicKeyB64';
    
    // Store DID for later retrieval
    await _storage.write(key: _didKey, value: did);
    
    return DID(did: did, publicKeyHex: publicKeyHex);
  }

  /// Sign a nonce (hex-encoded) with the stored private key.
  /// Returns the signature as hex-encoded string.
  Future<String> sign(String nonceHex) async {
    final privateKeyB64 = await _storage.read(key: _privateKeyKey);
    if (privateKeyB64 == null) {
      throw Exception('No private key found. Generate DID first.');
    }
    
    // Decode private key from base64url
    final privateKeyBytes = base64Url.decode(
      privateKeyB64.padRight((privateKeyB64.length + 3) ~/ 4 * 4, '='),
    );
    
    // Reconstruct keypair for signing
    final algorithm = Ed25519();
    final keyPair = await algorithm.newKeyPairFromSeed(privateKeyBytes);
    
    // Decode nonce from hex to bytes - server hex-decodes before verification
    final nonceBytes = hexToBytes(nonceHex);
    
    // Sign the nonce bytes
    final signature = await algorithm.sign(nonceBytes, keyPair: keyPair);
    
    // Return signature as hex
    return bytesToHex(Uint8List.fromList(signature.bytes));
  }

  /// Retrieve the stored DID (if exists).
  Future<DID?> getStoredDID() async {
    final did = await _storage.read(key: _didKey);
    if (did == null) return null;
    
    // We need to reconstruct publicKeyHex from the DID
    // DID format: did:key:<base64url(pubkey)>
    if (!did.startsWith('did:key:')) return null;
    
    final pubKeyB64 = did.substring(8); // Remove 'did:key:'
    final pubKeyBytes = base64Url.decode(
      pubKeyB64.padRight((pubKeyB64.length + 3) ~/ 4 * 4, '='),
    );
    final publicKeyHex = bytesToHex(Uint8List.fromList(pubKeyBytes));
    
    return DID(did: did, publicKeyHex: publicKeyHex);
  }

  /// Check if a DID has been generated and stored.
  Future<bool> hasDID() async {
    final did = await _storage.read(key: _didKey);
    final privateKey = await _storage.read(key: _privateKeyKey);
    return did != null && privateKey != null;
  }

  /// Clear stored DID and private key (logout).
  Future<void> clearDID() async {
    await _storage.delete(key: _privateKeyKey);
    await _storage.delete(key: _didKey);
  }
}
