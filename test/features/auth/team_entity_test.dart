import 'package:flutter_test/flutter_test.dart';
import 'package:scarlet_app/features/teams/domain/team_entity.dart';
import 'package:scarlet_app/features/teams/domain/teams_repository.dart';
import 'package:scarlet_app/features/auth/domain/user_entity.dart';

void main() {
  group('Team', () {
    test('fromJson constructs correctly', () {
      final json = {
        'id': 5,
        'name': 'Brigada Cobija',
        'is_active': true,
      };

      final team = Team.fromJson(json);

      expect(team.id, 5);
      expect(team.name, 'Brigada Cobija');
      expect(team.isActive, true);
    });

    test('fromJson defaults is_active to true when missing', () {
      final json = {
        'id': 3,
        'name': 'Brigada La Paz',
      };

      final team = Team.fromJson(json);

      expect(team.isActive, true);
    });
  });

  group('ActiveIncident', () {
    test('fromJson active=true with incident_id', () {
      final json = {
        'active': true,
        'incident_id': 'VIIRS_001',
      };

      final incident = ActiveIncident.fromJson(json);

      expect(incident.active, true);
      expect(incident.incidentId, 'VIIRS_001');
    });

    test('fromJson active=false', () {
      final json = {'active': false};

      final incident = ActiveIncident.fromJson(json);

      expect(incident.active, false);
      expect(incident.incidentId, isNull);
    });
  });
}
