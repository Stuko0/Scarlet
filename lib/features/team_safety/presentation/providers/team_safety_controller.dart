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
  Timer? _degradedTimer;

  String _userId = '';
  String _fullName = '';
  int _teamId = 0;
  bool _joined = false;
  bool _selfCheckPending = false;
  DateTime? _lastReportAt;
  Position? _lastPosition;

  static const _statusInterval = Duration(seconds: 2);
  static const _locationThrottle = Duration(seconds: 15);
  static const _stillThreshold = Duration(minutes: 5);
  static const _degradedInterval = Duration(seconds: 10);

  @override
  Future<List<TeamMemberStatus>> build() async {
    return [];
  }

  Future<void> joinIncident(String teamId, String userId, String fullName) async {
    if (_joined) return; // reentrada: ignorar joins duplicados
    final repo = ref.read(teamSafetyRepositoryProvider);
    final motion = ref.read(motionDetectorProvider);

    _teamId = int.tryParse(teamId) ?? 0;
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
      _lastP2pCount = statuses.length;
      state = AsyncValue.data(statuses);
    });

    // Timer propio: construye el estado actual (GPS + movimiento) y lo publica.
    _statusTimer = Timer.periodic(_statusInterval, (_) => _publishOwnStatus());

    // Modo degraded: si no hay peers P2P (BT apagado, cross-platform),
    // el estado del equipo se obtiene por polling al backend.
    _degradedTimer = Timer.periodic(_degradedInterval, (_) => _pollBackendStatus());

    ref.onDispose(_teardown);
    ref.read(activeIncidentProvider.notifier).state = true;
  }

  int _lastP2pCount = 0;
  bool _polling = false;
  DateTime? _lastPollAt;

  Future<void> _pollBackendStatus() async {
    if (!_joined || _polling) return;
    // Con pares P2P vivos (>=2: yo + alguien), el mesh es suficiente.
    if (_lastP2pCount >= 2) {
      _lastPollAt = null;
      return;
    }
    final userTeamId = _teamId;
    if (userTeamId <= 0) return;

    _polling = true;
    try {
      final remote = await ref
          .read(personnelRepositoryProvider)
          .getTeamSafetyStatus(userTeamId)
          .timeout(const Duration(seconds: 8));

      // Merge: estado propio local (fuente de verdad para mí) + remotos.
      final own = state.valueOrNull?.where((s) => s.userId == _userId).toList() ?? [];
      final merged = [
        ...own,
        ...remote
            .where((r) => r.userId.toString() != _userId)
            .map((r) => TeamMemberStatus(
                  userId: '${r.userId}',
                  fullName: 'Usuario ${r.userId}',
                  location: (r.latitude != null && r.longitude != null)
                      ? LatLng(r.latitude!, r.longitude!)
                      : null,
                  lastUpdate: DateTime.fromMillisecondsSinceEpoch(r.timestampMs),
                  status: MemberStatus.values.firstWhere(
                    (m) => m.name == r.status,
                    orElse: () => MemberStatus.active,
                  ),
                )),
      ];
      _lastPollAt = DateTime.now();
      if (!_joined) return;
      state = AsyncValue.data(merged);
    } catch (_) {
      // Sin red o sin backend: mantener último estado conocido.
    } finally {
      _polling = false;
    }
  }

  DateTime? get lastDegradedPollAt => _lastPollAt;

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
      _reportSafetyToBackend(status.status);
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
      // El danger también debe llegar al comando vía backend.
      _reportSafetyToBackend(MemberStatus.danger);
    } catch (_) {}
  }

  /// Push del estado de seguridad al backend (throttled por el mismo timer).
  DateTime? _lastSafetyReportAt;
  static const _safetyThrottle = Duration(seconds: 15);

  void _reportSafetyToBackend(MemberStatus status) {
    if (!_joined) return;
    final now = DateTime.now();
    if (_lastSafetyReportAt != null &&
        now.difference(_lastSafetyReportAt!) < _safetyThrottle &&
        status != MemberStatus.danger) {
      return; // danger siempre se reporta inmediato
    }
    _lastSafetyReportAt = now;

    final id = int.tryParse(_userId);
    if (id == null) return;
    try {
      ref.read(personnelRepositoryProvider).updateSafetyStatus(
            userId: id,
            status: status.name,
            latitude: _lastPosition?.latitude,
            longitude: _lastPosition?.longitude,
            timestampMs: now.millisecondsSinceEpoch,
          ).catchError((_) {});
    } catch (_) {}
  }

  void _teardown() {
    _statusSub?.cancel();
    _statusSub = null;
    _statusTimer?.cancel();
    _statusTimer = null;
    _degradedTimer?.cancel();
    _degradedTimer = null;
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
