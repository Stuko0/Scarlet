import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scarlet_app/core/network/dio_client.dart';
import 'package:scarlet_app/features/auth/domain/user_entity.dart';
import 'package:scarlet_app/features/teams/domain/teams_repository.dart';
import 'package:scarlet_app/features/teams/domain/team_entity.dart';

final teamsRepositoryProvider = Provider<TeamsRepository>((ref) {
  return TeamsRepositoryImpl(dio: ref.watch(dioProvider));
});

class TeamsRepositoryImpl implements TeamsRepository {
  final Dio _dio;

  TeamsRepositoryImpl({required Dio dio}) : _dio = dio;

  @override
  Future<Team> getTeam(int teamId) async {
    final response = await _dio.get('/api/v1/teams/$teamId');
    return Team.fromJson(response.data as Map<String, dynamic>);
  }

  @override
  Future<List<User>> getTeamMembers(int teamId) async {
    final response = await _dio.get('/api/v1/teams/$teamId/users');
    final data = response.data as Map<String, dynamic>;
    final usersJson = data['users'] as List<dynamic>? ?? [];
    return usersJson
        .map((u) => User.fromJson(u as Map<String, dynamic>))
        .toList();
  }
}
