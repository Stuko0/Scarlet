import 'team_member_status.dart';

abstract class TeamSafetyRepository {
  Stream<List<TeamMemberStatus>> get teamStatusStream;
  Future<void> advertise(String teamId, String userId, String fullName);
  Future<void> sendStatus(TeamMemberStatus status);
  Future<void> disconnect();
}
