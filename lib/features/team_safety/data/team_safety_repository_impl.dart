import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scarlet_app/features/team_safety/domain/team_member_status.dart';
import 'package:scarlet_app/features/team_safety/domain/team_safety_repository.dart';
import 'nearby_team_safety_datasource.dart';

final teamSafetyDataSourceProvider = Provider<NearbyTeamSafetyDataSource>((ref) {
  return NearbyTeamSafetyDataSource();
});

final teamSafetyRepositoryProvider = Provider<TeamSafetyRepository>((ref) {
  return TeamSafetyRepositoryImpl(
    dataSource: ref.watch(teamSafetyDataSourceProvider),
  );
});

class TeamSafetyRepositoryImpl implements TeamSafetyRepository {
  final NearbyTeamSafetyDataSource _dataSource;

  TeamSafetyRepositoryImpl({required NearbyTeamSafetyDataSource dataSource})
      : _dataSource = dataSource;

  @override
  Stream<List<TeamMemberStatus>> get teamStatusStream => _dataSource.statusStream;

  @override
  Future<void> advertise(String teamId, String userId, String fullName) async {
    await _dataSource.advertise(teamId, userId, fullName);
  }

  @override
  Future<void> sendStatus(TeamMemberStatus status) async {
    await _dataSource.sendStatus(status);
  }

  @override
  Future<void> disconnect() async {
    await _dataSource.disconnect();
  }
}
