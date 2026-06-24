import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/asset_entity.dart';
import '../../data/inventory_repository_impl.dart';

final inventoryListProvider = FutureProvider.autoDispose<List<Asset>>((ref) async {
  final repo = ref.watch(inventoryRepositoryProvider);
  return repo.getAssets();
});

class InventoryController extends StateNotifier<AsyncValue<void>> {
  final Ref _ref;

  InventoryController(this._ref) : super(const AsyncValue.data(null));

  Future<void> updateStatus(int id, String status) async {
    state = const AsyncValue.loading();
    try {
      final repo = _ref.read(inventoryRepositoryProvider);
      await repo.updateAssetStatus(id, status);
      
      // Refresh list
      _ref.invalidate(inventoryListProvider);
      state = const AsyncValue.data(null);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}

final inventoryControllerProvider = StateNotifierProvider<InventoryController, AsyncValue<void>>((ref) {
  return InventoryController(ref);
});
