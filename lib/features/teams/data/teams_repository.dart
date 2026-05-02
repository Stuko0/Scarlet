import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scarlet_app/core/network/dio_client.dart';
import 'package:scarlet_app/features/auth/domain/user_entity.dart';

/// Provider for teams repository
final teamsRepositoryProvider = Provider<TeamsRepository>((ref) {
  return TeamsRepository(dio: ref.watch(dioProvider));
});

class TeamsRepository {
  final Dio _dio;

  TeamsRepository({required Dio dio}) : _dio = dio;

  /// Get team info by ID
  Future<Map<String, dynamic>> getTeam(int teamId) async {
    final response = await _dio.get('/api/v1/teams/$teamId');
    return response.data as Map<String, dynamic>;
  }

  /// Get all members of a team
  Future<List<User>> getTeamMembers(int teamId) async {
    final response = await _dio.get('/api/v1/teams/$teamId/users');
    final data = response.data as Map<String, dynamic>;
    final usersJson = data['users'] as List<dynamic>? ?? [];
    return usersJson
        .map((u) => User.fromJson(u as Map<String, dynamic>))
        .toList();
  }
}
