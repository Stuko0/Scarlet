import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:scarlet_app/features/personnel/data/personnel_repository.dart';
import 'package:scarlet_app/features/team_safety/domain/team_member_status.dart';
import 'package:scarlet_app/features/team_safety/data/team_safety_repository_impl.dart';
import 'package:scarlet_app/features/team_safety/data/motion_detector.dart';

final teamSafetyControllerProvider =
    AsyncNotifierProvider<TeamSafetyController, List<TeamMemberStatus>>(
  TeamSafetyController.new,
);

final activeIncidentProvider = StateProvider<bool>((ref) => false);

/// Se activa cuando el miembro estuvo quieto >5 min sin responder.
/// La página lo observa para abrir DangerSelfCheckModal una sola vez.
final selfCheckRequiredProvider = StateProvider<bool>((ref) => false);

class TeamSafetyController extends AsyncNotifier<List<TeamMemberStatus>> {
  StreamSubscription<List<TeamMemberStatus>>? _statusSub;
  Timer? _statusTimer;

  String _userId = '';
  String _fullName = '';
  bool _joined = false;
  bool _selfCheckPending = false;
  DateTime? _lastReportAt;
  Position? _lastPosition;

  static const _statusInterval = Duration(seconds: 2);
  static const _locationThrottle = Duration(seconds: 15);
  static const _stillThreshold = Duration(minutes: 5);

  @override
  Future<List<TeamMemberStatus>> build() async {
    return [];
  }

  Future<void> joinIncident(String teamId, String userId, String fullName) async {
    if (_joined) return; // reentrada: ignorar joins duplicados
    final repo = ref.read(teamSafetyRepositoryProvider);
    final motion = ref.read(motionDetectorProvider);

    _userId = userId;
    _fullName = fullName;
    _joined = true;
    _selfCheckPending = false;
    _lastMovementSeen = motion.lastMovementAt ?? DateTime.now();

    final ok = await repo.advertise(teamId, userId, fullName);
    if (!ok) {
      _joined = false;
      state = AsyncValue.error(
        Exception('No se pudieron obtener permisos de Bluetooth/Red cercana'),
        StackTrace.current,
      );
      ref.read(activeIncidentProvider.notifier).state = false;
      return;
    }
    motion.start();

    // Solo consume: los datos llegan por payload P2P, nunca dispara envíos.
    _statusSub = repo.teamStatusStream.listen((statuses) {
      if (!_joined) return;
      state = AsyncValue.data(statuses);
    });

    // Timer propio: construye el estado actual (GPS + movimiento) y lo publica.
    _statusTimer = Timer.periodic(_statusInterval, (_) => _publishOwnStatus());

    ref.onDispose(_teardown);
    ref.read(activeIncidentProvider.notifier).state = true;
  }

  DateTime? _lastMovementSeen;

  Future<void> _publishOwnStatus() async {
    if (!_joined) return;
    try {
      final repo = ref.read(teamSafetyRepositoryProvider);
      final motion = ref.read(motionDetectorProvider);

      if (motion.lastMovementAt != null) {
        _lastMovementSeen = motion.lastMovementAt!;
      }

      var position = _lastPosition;
      try {
        position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high,
          timeLimit: const Duration(seconds: 8),
        );
        _lastPosition = position;
      } catch (_) {
        // Sin fix GPS disponible: se usa la última conocida (puede ser null).
      }

      final stillFor = motion.isStill
          ? DateTime.now().difference(_lastMovementSeen ?? DateTime.now())
          : Duration.zero;

      final status = TeamMemberStatus(
        userId: _userId,
        fullName: _fullName,
        location: position != null ? LatLng(position.latitude, position.longitude) : null,
        lastUpdate: DateTime.now(),
        lastMovementAt: motion.lastMovementAt,
        status: stillFor > _stillThreshold && _selfCheckPending
            ? MemberStatus.danger
            : (motion.isStill ? MemberStatus.still : MemberStatus.active),
      );
      await repo.sendStatus(status);

      _maybeReportTelemetry(position);
      _maybeTriggerSelfCheck(stillFor);
    } catch (_) {
      // Un tick fallido no debe matar el loop.
    }
  }

  /// Telemetría GPS al backend: máximo cada [_locationThrottle] o si se movió.
  void _maybeReportTelemetry(Position? position) {
    if (position == null || _userId.isEmpty) return;
    final now = DateTime.now();
    final movedFar = _lastReportAt == null ||
        _lastPosition == null && true; // primer reporte
    if (_lastReportAt != null &&
        now.difference(_lastReportAt!) < _locationThrottle &&
        !movedFar) {
      return;
    }
    _lastReportAt = now;
    // Fire-and-forget: la sesión no depende del backend.
    try {
      final id = int.tryParse(_userId);
      if (id != null) {
        ref.read(personnelRepositoryProvider).reportLocation(
              userId: id,
              latitude: position.latitude,
              longitude: position.longitude,
              timestampMs: now.millisecondsSinceEpoch,
            ).catchError((_) {});
      }
    } catch (_) {}
  }

  /// Watchdog local: quieto >5 min → pedir self-check al usuario.
  void _maybeTriggerSelfCheck(Duration stillFor) {
    if (_selfCheckPending) return;
    if (stillFor > _stillThreshold) {
      _selfCheckPending = true;
      ref.read(selfCheckRequiredProvider.notifier).state = true;
    }
  }

  /// Respuesta del usuario al modal: ok resetea el episodio; timeout marca danger.
  void resolveSelfCheck({required bool isOk}) {
    final motion = ref.read(motionDetectorProvider);
    _selfCheckPending = false;
    ref.read(selfCheckRequiredProvider.notifier).state = false;
    if (isOk) {
      _lastMovementSeen = DateTime.now();
      motion.acknowledgeActivity();
    } else {
      _publishDangerNow();
    }
  }

  Future<void> _publishDangerNow() async {
    if (!_joined) return;
    try {
      final repo = ref.read(teamSafetyRepositoryProvider);
      await repo.sendStatus(TeamMemberStatus(
        userId: _userId,
        fullName: _fullName,
        location: _lastPosition != null
            ? LatLng(_lastPosition!.latitude, _lastPosition!.longitude)
            : null,
        lastUpdate: DateTime.now(),
        lastMovementAt: null,
        status: MemberStatus.danger,
      ));
    } catch (_) {}
  }

  void _teardown() {
    _statusSub?.cancel();
    _statusSub = null;
    _statusTimer?.cancel();
    _statusTimer = null;
  }

  Future<void> leaveIncident() async {
    final repo = ref.read(teamSafetyRepositoryProvider);
    final motion = ref.read(motionDetectorProvider);

    _teardown();
    await repo.disconnect();
    motion.stop();

    _joined = false;
    _selfCheckPending = false;
    _lastReportAt = null;
    _lastPosition = null;

    state = const AsyncValue.data([]);
    ref.read(selfCheckRequiredProvider.notifier).state = false;
    ref.read(activeIncidentProvider.notifier).state = false;
  }
}
