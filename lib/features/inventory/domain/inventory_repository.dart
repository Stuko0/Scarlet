import 'asset_entity.dart';

abstract class InventoryRepository {
  Future<List<Asset>> getAssets();
  Future<Asset> updateAssetStatus(int id, String status);
}
