import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scarlet_app/core/network/dio_client.dart';
import 'package:scarlet_app/features/incidents/domain/fire_entity.dart';
import 'package:scarlet_app/features/incidents/domain/incidents_repository.dart';

final incidentsRepositoryProvider = Provider<IncidentsRepository>((ref) {
  return IncidentsRepositoryImpl(
    dio: ref.watch(dioProvider),
  );
});

class IncidentsRepositoryImpl implements IncidentsRepository {
  final Dio _dio;

  IncidentsRepositoryImpl({required Dio dio}) : _dio = dio;

  @override
  Future<List<Fire>> getActiveFires() async {
    try {
      final response = await _dio.get('/api/wildfire/v1/active');

      final data = response.data;
      
      List<dynamic> firesList = [];
      if (data != null) {
        if (data is Map && data.containsKey('fires')) {
          firesList = data['fires'] as List<dynamic>;
        } else if (data is List) {
          firesList = data;
        }
      }

      return firesList
          .map((json) => Fire.fromJson(json as Map<String, dynamic>))
          .toList();
    } on DioException catch (e) {
      if (e.response != null) {
        final msg = e.response?.data?['message'] ?? 'Error al obtener incendios activos';
        throw Exception(msg);
      }
      throw Exception('Error de conexión: ${e.message}');
    }
  }
}
