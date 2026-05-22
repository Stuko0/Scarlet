import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scarlet_app/core/network/dio_client.dart';
import '../domain/asset_entity.dart';
import '../domain/inventory_repository.dart';

final inventoryRepositoryProvider = Provider<InventoryRepository>((ref) {
  return InventoryRepositoryImpl(
    dio: ref.watch(dioProvider),
  );
});

class InventoryRepositoryImpl implements InventoryRepository {
  final Dio _dio;

  InventoryRepositoryImpl({required Dio dio}) : _dio = dio;

  @override
  Future<List<Asset>> getAssets() async {
    try {
      final response = await _dio.get('/api/v1/inventory/assets');
      
      final data = response.data;
      List<dynamic> assetsList = [];
      
      if (data != null && data is Map && data.containsKey('assets')) {
        assetsList = data['assets'] as List<dynamic>;
      }

      return assetsList
          .map((json) => Asset.fromJson(json as Map<String, dynamic>))
          .toList();
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  @override
  Future<Asset> updateAssetStatus(int id, String status) async {
    try {
      final response = await _dio.patch(
        '/api/v1/inventory/assets/$id/status',
        data: {'status': status},
      );
      
      return Asset.fromJson(response.data as Map<String, dynamic>);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  Exception _handleError(DioException e) {
    if (e.response != null) {
      final msg = e.response?.data?['message'] ?? 'Error en el servicio de inventario';
      return Exception(msg);
    }
    return Exception('Error de conexión: ${e.message}');
  }
}
