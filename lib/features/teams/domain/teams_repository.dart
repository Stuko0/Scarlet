import 'package:scarlet_app/features/auth/domain/user_entity.dart';
import 'team_entity.dart';

abstract class TeamsRepository {
  Future<Team> getTeam(int teamId);
  Future<List<User>> getTeamMembers(int teamId);
  Future<ActiveIncident?> getActiveIncident(int teamId);
}

class ActiveIncident {
  final bool active;
  final String? incidentId;

  const ActiveIncident({required this.active, this.incidentId});

  factory ActiveIncident.fromJson(Map<String, dynamic> json) {
    return ActiveIncident(
      active: json['active'] as bool? ?? false,
      incidentId: json['incident_id'] as String?,
    );
  }
}
