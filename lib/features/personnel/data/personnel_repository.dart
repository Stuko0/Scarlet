import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scarlet_app/core/network/dio_client.dart';
import 'package:scarlet_app/features/personnel/domain/personnel_repository.dart';

final personnelRepositoryProvider = Provider<PersonnelRepository>((ref) {
  return PersonnelRepositoryImpl(dio: ref.watch(dioProvider));
});

class PersonnelRepositoryImpl implements PersonnelRepository {
  final Dio _dio;

  PersonnelRepositoryImpl({required this._dio});

  @override
  Future<void> updateDutyStatus(int userId, String status) async {
    await _dio.patch(
      '/api/v1/users/$userId/status',
      data: {'duty_status': status},
    );
  }

  @override
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

  @override
  Future<void> updateSafetyStatus({
    required int userId,
    required String status,
    double? latitude,
    double? longitude,
    required int timestampMs,
  }) async {
    await _dio.post(
      '/api/v1/personnel/safety-status',
      data: {
        'user_id': userId,
        'status': status,
        if (latitude != null) 'latitude': latitude,
        if (longitude != null) 'longitude': longitude,
        'timestamp_ms': timestampMs,
      },
    );
  }

  @override
  Future<List<TeamSafetyStatus>> getTeamSafetyStatus(int teamId) async {
    try {
      final response = await _dio.get('/api/v1/teams/$teamId/safety-status');
      final data = response.data;
      final list = (data is Map ? data['statuses'] : null) as List<dynamic>? ?? [];
      return list
          .map((e) => TeamSafetyStatus.fromJson(e as Map<String, dynamic>))
          .toList();
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) return [];
      rethrow;
    }
  }
}
