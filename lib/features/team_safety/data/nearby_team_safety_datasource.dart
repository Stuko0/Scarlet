import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:nearby_connections/nearby_connections.dart';
import 'package:permission_handler/permission_handler.dart';
import '../domain/team_member_status.dart';

/// DataSource P2P basado en Google Nearby Connections.
///
/// Cada dispositivo transmite su propio estado por broadcast cada
/// [_broadcastInterval] a todos los endpoints conectados, y recibe los
/// estados remotos por payload BYTES. La emisión local (statusStream) es la
/// unión del estado propio + estados remotos; recibir datos NUNCA dispara
/// envíos (evita bucles).
class NearbyTeamSafetyDataSource {
  final Nearby _nearby = Nearby();
  final _statusController = StreamController<List<TeamMemberStatus>>.broadcast();

  /// Estados remotos indexados por userId (dedupe discovery/advertising).
  final Map<String, TeamMemberStatus> _peers = {};

  /// endpointId -> userId, para limpiar el peer correcto al desconectar.
  final Map<String, String> _endpointUser = {};
  final Set<String> _connectedEndpoints = {};

  TeamMemberStatus? _myStatus;
  String _myUserId = '';
  Timer? _broadcastTimer;
  bool _advertising = false;

  static const _broadcastInterval = Duration(seconds: 2);

  /// Edad máxima de un estado remoto antes de considerarlo offline.
  static const _peerTimeout = Duration(seconds: 30);

  Stream<List<TeamMemberStatus>> get statusStream => _statusController.stream;

  List<TeamMemberStatus> get currentStatuses => [
        if (_myStatus != null) _myStatus!,
        ..._peers.values,
      ];

  bool get isActive => _advertising || _connectedEndpoints.isNotEmpty;

  /// Pide permisos runtime necesarios para Nearby (Android 12+).
  Future<bool> _ensurePermissions() async {
    final permissions = [
      Permission.locationWhenInUse,
      Permission.bluetoothScan,
      Permission.bluetoothAdvertise,
      Permission.bluetoothConnect,
      Permission.nearbyWifiDevices,
    ];
    for (final permission in permissions) {
      if (await permission.isGranted) continue;
      final status = await permission.request();
      if (!status.isGranted) return false;
    }
    return true;
  }

  Future<bool> advertise(String teamId, String userId, String fullName) async {
    if (_advertising) return true;
    _myUserId = userId;
    final serviceId = 'scarlet-team-$teamId';

    if (!await _ensurePermissions()) return false;

    await _nearby.stopAllEndpoints();
    _peers.clear();
    _connectedEndpoints.clear();

    final advertOk = await _nearby.startAdvertising(
      fullName,
      Strategy.P2P_CLUSTER,
      onConnectionInitiated: _onConnectionInitiated,
      onConnectionResult: _onConnectionResult,
      onDisconnected: _onDisconnected,
      serviceId: serviceId,
    );
    if (!advertOk) return false;

    final discoveryOk = await _nearby.startDiscovery(
      fullName,
      Strategy.P2P_CLUSTER,
      onEndpointFound: (endpointId, endpointName, sid) {
        _nearby.requestConnection(
          fullName,
          endpointId,
          onConnectionInitiated: _onConnectionInitiated,
          onConnectionResult: _onConnectionResult,
          onDisconnected: _onDisconnected,
        );
      },
      onEndpointLost: (endpointId) {
        // El par sigue alcanzable hasta que llegue onDisconnected real.
        debugPrint('[team-safety] endpoint lost: $endpointId');
      },
      serviceId: serviceId,
    );
    if (!discoveryOk) {
      await _nearby.stopAdvertising();
      return false;
    }

    _advertising = true;
    _broadcastTimer?.cancel();
    _broadcastTimer = Timer.periodic(_broadcastInterval, (_) => _tick());
    return true;
  }

  void _onConnectionInitiated(String endpointId, ConnectionInfo info) {
    _connectedEndpoints.add(endpointId);
    _nearby.acceptConnection(
      endpointId,
      onPayLoadRecieved: _onPayloadReceived,
    );
    // Snapshot inmediato apenas se abre el canal.
    _sendMyStatusTo(endpointId);
  }

  void _onConnectionResult(String endpointId, Status status) {
    if (status != Status.CONNECTED) {
      _onDisconnected(endpointId);
    }
  }

  void _onDisconnected(String endpointId) {
    _connectedEndpoints.remove(endpointId);
    final userId = _endpointUser.remove(endpointId);
    if (userId != null) {
      _peers.remove(userId);
    }
    _emit();
  }

  void _onPayloadReceived(String endpointId, Payload payload) {
    if (payload.type != PayloadType.BYTES || payload.bytes == null) return;
    try {
      final json = jsonDecode(utf8.decode(payload.bytes!)) as Map<String, dynamic>;
      final status = TeamMemberStatus.fromJson(json);
      if (status.userId == _myUserId) return; // eco propio
      _peers[status.userId] = status;
      _endpointUser[endpointId] = status.userId;
      _emit();
    } catch (_) {
      // Payload corrupto: ignorar.
    }
  }

  void updateMyStatus(TeamMemberStatus status) {
    _myStatus = status;
    _emit();
  }

  void _tick() {
    _purgeStalePeers();
    _broadcastMyStatus();
  }

  void _purgeStalePeers() {
    final now = DateTime.now();
    _peers.removeWhere((_, s) => now.difference(s.lastUpdate) > _peerTimeout);
  }

  void _broadcastMyStatus() {
    if (_myStatus == null || _connectedEndpoints.isEmpty) return;
    for (final endpointId in _connectedEndpoints.toList()) {
      _sendMyStatusTo(endpointId);
    }
  }

  Future<void> _sendMyStatusTo(String endpointId) async {
    if (_myStatus == null) return;
    try {
      final bytes = Uint8List.fromList(utf8.encode(jsonEncode(_myStatus!.toJson())));
      await _nearby.sendBytesPayload(endpointId, bytes);
    } catch (_) {
      // Endpoint caído a mitad del envío: onDisconnected lo limpiará.
    }
  }

  void _emit() {
    if (!_statusController.isClosed) {
      _statusController.add(currentStatuses);
    }
  }

  Future<void> disconnect() async {
    _broadcastTimer?.cancel();
    _broadcastTimer = null;
    _advertising = false;
    _myStatus = null;
    _peers.clear();
    _endpointUser.clear();
    _connectedEndpoints.clear();
    try {
      await _nearby.stopAllEndpoints();
      await _nearby.stopDiscovery();
      await _nearby.stopAdvertising();
    } catch (_) {}
    _emit();
  }
}
