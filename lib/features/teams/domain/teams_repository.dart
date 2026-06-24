import 'package:scarlet_app/features/auth/domain/user_entity.dart';
import 'team_entity.dart';

abstract class TeamsRepository {
  Future<Team> getTeam(int teamId);
  Future<List<User>> getTeamMembers(int teamId);
}
