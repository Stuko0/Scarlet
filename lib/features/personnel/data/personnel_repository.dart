import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scarlet_app/core/network/dio_client.dart';
import 'package:scarlet_app/features/personnel/domain/personnel_repository.dart';

final personnelRepositoryProvider = Provider<PersonnelRepository>((ref) {
  return PersonnelRepositoryImpl(dio: ref.watch(dioProvider));
});

class PersonnelRepositoryImpl implements PersonnelRepository {
  final Dio _dio;

  PersonnelRepositoryImpl({required Dio dio}) : _dio = dio;

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
}
