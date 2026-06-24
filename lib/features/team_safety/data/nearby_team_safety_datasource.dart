import 'dart:async';
import 'dart:convert';
import 'package:nearby_connections/nearby_connections.dart';
import '../domain/team_member_status.dart';

class NearbyTeamSafetyDataSource {
  final Nearby _nearby = Nearby();
  final _statusController = StreamController<List<TeamMemberStatus>>.broadcast();
  final Map<String, TeamMemberStatus> _peers = {};
  String _myUserId = '';

  Stream<List<TeamMemberStatus>> get statusStream => _statusController.stream;

  Future<void> advertise(String teamId, String userId, String fullName) async {
    _myUserId = userId;
    final serviceId = 'scarlet-team-$teamId';

    await _nearby.stopAllEndpoints();

    await _nearby.startAdvertising(
      fullName,
      Strategy.P2P_CLUSTER,
      onConnectionInitiated: (String endpointId, ConnectionInfo info) {
        _nearby.acceptConnection(
          endpointId,
          onPayLoadRecieved: _onPayloadReceived,
        );
      },
      onConnectionResult: (String endpointId, Status status) {
        if (status == Status.CONNECTED) {
          _sendOwnStatus();
        }
      },
      onDisconnected: (String endpointId) {
        _peers.remove(endpointId);
        _emitStatuses();
      },
      serviceId: serviceId,
    );

    await _nearby.startDiscovery(
      fullName,
      Strategy.P2P_CLUSTER,
      onEndpointFound: (String endpointId, String endpointName, String sid) {
        _nearby.requestConnection(
          endpointName,
          endpointId,
          onConnectionInitiated: (String id, ConnectionInfo info) {
            _nearby.acceptConnection(
              id,
              onPayLoadRecieved: _onPayloadReceived,
            );
          },
          onConnectionResult: (String id, Status status) {
            if (status == Status.CONNECTED) {
              _sendOwnStatus();
            }
          },
          onDisconnected: (String id) {
            _peers.remove(id);
            _emitStatuses();
          },
        );
      },
      onEndpointLost: (String? endpointId) {
        _peers.remove(endpointId);
        _emitStatuses();
      },
      serviceId: serviceId,
    );
  }

  void _onPayloadReceived(String endpointId, Payload payload) {
    if (payload.type == PayloadType.BYTES && payload.bytes != null) {
      final jsonStr = utf8.decode(payload.bytes!);
      final json = jsonDecode(jsonStr) as Map<String, dynamic>;
      final status = TeamMemberStatus.fromJson(json);
      _peers[endpointId] = status;
      _emitStatuses();
    }
  }

  void _sendOwnStatus() {
    _statusController.add(_peers.values.toList());
  }

  void _emitStatuses() {
    _statusController.add(_peers.values.toList());
  }

  Future<void> sendStatus(TeamMemberStatus status) async {
    _peers[_myUserId] = status;
    _emitStatuses();
  }

  Future<void> disconnect() async {
    await _nearby.stopAllEndpoints();
    _peers.clear();
    _statusController.close();
  }
}
