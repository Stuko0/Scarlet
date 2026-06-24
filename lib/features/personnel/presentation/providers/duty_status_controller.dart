import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scarlet_app/features/personnel/data/personnel_repository.dart';
import 'package:scarlet_app/core/storage/secure_storage.dart';
import 'package:scarlet_app/core/services/home_widget_service.dart';

final dutyStatusProvider = AsyncNotifierProvider<DutyStatusController, String>(
    () => DutyStatusController());

class DutyStatusController extends AsyncNotifier<String> {
  @override
  Future<String> build() async {
    return 'off-duty';
  }

  Future<void> toggle() async {
    final current = state.valueOrNull ?? 'off-duty';
    final newStatus = current == 'on-duty' ? 'off-duty' : 'on-duty';

    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final repo = ref.read(personnelRepositoryProvider);
      final storage = ref.read(secureStorageProvider);
      final userId = await storage.getUserId();
      if (userId == null) throw Exception('No user ID found');

      await repo.updateDutyStatus(userId, newStatus);

      final widgetService = ref.read(homeWidgetServiceProvider);
      await widgetService.updateDutyStatus(newStatus);

      return newStatus;
    });
  }

  Future<void> setStatus(String status) async {
    state = AsyncValue.data(status);
  }
}
