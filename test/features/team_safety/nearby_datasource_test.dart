import 'package:flutter_test/flutter_test.dart';
import 'package:scarlet_app/features/team_safety/data/nearby_team_safety_datasource.dart';
import 'package:scarlet_app/features/team_safety/domain/team_member_status.dart';
import 'package:latlong2/latlong.dart';

/// Tests del datasource P2P sin depender del plugin nativo (Nearby es
/// singleton con method-channel; en tests solo ejercitamos la lógica pura
/// accesible: updateMyStatus, currentStatuses, eco propio vía JSON).
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('NearbyTeamSafetyDataSource lógica de estado', () {
    test('currentStatuses vacío al inicio', () {
      final ds = NearbyTeamSafetyDataSource();
      expect(ds.currentStatuses, isEmpty);
      expect(ds.isActive, isFalse);
    });

    test('updateMyStatus publica el estado propio en el stream', () async {
      final ds = NearbyTeamSafetyDataSource();
      final received = <List<TeamMemberStatus>>[];
      final sub = ds.statusStream.listen(received.add);

      ds.updateMyStatus(TeamMemberStatus(
        userId: 'u1',
        fullName: 'Uno',
        lastUpdate: DateTime.now(),
        status: MemberStatus.active,
      ));
      await Future<void>.delayed(Duration.zero);

      expect(received, isNotEmpty);
      expect(received.last.length, 1);
      expect(received.last.first.userId, 'u1');
      expect(ds.currentStatuses.first.userId, 'u1');
      await sub.cancel();
    });

    test('disconnect limpia el estado pero el stream sigue vivo (rejoin)', () async {
      final ds = NearbyTeamSafetyDataSource();
      ds.updateMyStatus(TeamMemberStatus(
        userId: 'u1',
        fullName: 'Uno',
        lastUpdate: DateTime.now(),
        status: MemberStatus.active,
      ));

      await ds.disconnect();
      expect(ds.currentStatuses, isEmpty);
      expect(ds.isActive, isFalse);

      // El stream NO debe estar cerrado: poder volver a escuchar.
      final received = <List<TeamMemberStatus>>[];
      final sub = ds.statusStream.listen(received.add);
      ds.updateMyStatus(TeamMemberStatus(
        userId: 'u1',
        fullName: 'Uno',
        lastUpdate: DateTime.now(),
        status: MemberStatus.ok,
      ));
      await Future<void>.delayed(Duration.zero);
      expect(received, isNotEmpty);
      expect(received.last.first.status, MemberStatus.ok);
      await sub.cancel();
    });

    test('roundtrip toJson/fromJson preserva ubicación y estado', () {
      final original = TeamMemberStatus(
        userId: 'u2',
        fullName: 'Dos',
        location: const LatLng(-17.413, -66.165),
        lastUpdate: DateTime.parse('2026-08-25T12:00:00.000'),
        lastMovementAt: DateTime.parse('2026-08-25T11:59:00.000'),
        status: MemberStatus.danger,
      );
      final json = original.toJson();
      final parsed = TeamMemberStatus.fromJson(json);

      expect(parsed.userId, 'u2');
      expect(parsed.fullName, 'Dos');
      expect(parsed.location?.latitude, -17.413);
      expect(parsed.location?.longitude, -66.165);
      expect(parsed.status, MemberStatus.danger);
    });
  });
}
