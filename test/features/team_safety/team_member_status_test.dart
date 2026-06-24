import 'package:flutter_test/flutter_test.dart';
import 'package:scarlet_app/features/team_safety/domain/team_member_status.dart';
import 'package:latlong2/latlong.dart';

void main() {
  group('TeamMemberStatus', () {
    test('fromJson reconstructs object correctly', () {
      final json = {
        'userId': '42',
        'fullName': 'Juan Perez',
        'latitude': -17.4,
        'longitude': -66.1,
        'lastUpdate': '2026-06-24T14:30:00.000Z',
        'lastMovementAt': '2026-06-24T14:25:00.000Z',
        'status': 'active',
      };

      final status = TeamMemberStatus.fromJson(json);

      expect(status.userId, '42');
      expect(status.fullName, 'Juan Perez');
      expect(status.location, LatLng(-17.4, -66.1));
      expect(status.status, MemberStatus.active);
    });

    test('fromJson handles null location', () {
      final json = {
        'userId': '42',
        'fullName': 'Juan Perez',
        'lastUpdate': '2026-06-24T14:30:00.000Z',
        'status': 'still',
      };

      final status = TeamMemberStatus.fromJson(json);

      expect(status.location, isNull);
      expect(status.status, MemberStatus.still);
    });

    test('toJson produces correct map', () {
      final status = TeamMemberStatus(
        userId: '42',
        fullName: 'Juan Perez',
        location: LatLng(-17.4, -66.1),
        lastUpdate: DateTime.utc(2026, 6, 24, 14, 30),
        status: MemberStatus.danger,
      );

      final json = status.toJson();

      expect(json['userId'], '42');
      expect(json['status'], 'danger');
      expect(json['latitude'], -17.4);
      expect(json['longitude'], -66.1);
    });
  });
}
