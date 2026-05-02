import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scarlet_app/core/network/dio_client.dart';

/// Provider for personnel repository
final personnelRepositoryProvider = Provider<PersonnelRepository>((ref) {
  return PersonnelRepository(dio: ref.watch(dioProvider));
});

class PersonnelRepository {
  final Dio _dio;

  PersonnelRepository({required Dio dio}) : _dio = dio;

  /// Update duty status for a user
  Future<void> updateDutyStatus(int userId, String status) async {
    await _dio.patch(
      '/api/v1/users/$userId/status',
      data: {'duty_status': status},
    );
  }

  /// Report GPS location
  Future<void> reportLocation({
    required int userId,
    required double latitude,
    required double longitude,
    required int timestampMs,
  }) async {
    await _dio.post(
      '/api/v1/personnel/location',
      data: {
        'user_id': userId,
        'latitude': latitude,
        'longitude': longitude,
        'timestamp_ms': timestampMs,
      },
    );
  }

  /// Get team members
  Future<List<Map<String, dynamic>>> getTeamMembers(int teamId) async {
    final response = await _dio.get('/api/v1/teams/$teamId/users');
    final data = response.data;
    if (data is Map && data.containsKey('users')) {
      return List<Map<String, dynamic>>.from(data['users']);
    }
    return [];
  }

  /// Get team info
  Future<Map<String, dynamic>> getTeam(int teamId) async {
    final response = await _dio.get('/api/v1/teams/$teamId');
    return response.data as Map<String, dynamic>;
  }
}
