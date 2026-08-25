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

  TeamSafetyRepositoryImpl({required this._dataSource});

  @override
  Stream<List<TeamMemberStatus>> get teamStatusStream => _dataSource.statusStream;

  @override
  Future<bool> advertise(String teamId, String userId, String fullName) async {
    return _dataSource.advertise(teamId, userId, fullName);
  }

  @override
  Future<void> sendStatus(TeamMemberStatus status) async {
    // Publica el estado propio: emisión local + broadcast P2P a los pares.
    // NO re-emite el stream (el controller solo consume), evita bucles.
    _dataSource.updateMyStatus(status);
  }

  @override
  Future<void> disconnect() async {
    await _dataSource.disconnect();
  }
}
