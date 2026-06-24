import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:home_widget/home_widget.dart';

final homeWidgetServiceProvider = Provider<HomeWidgetService>((ref) {
  return HomeWidgetService();
});

class HomeWidgetService {
  static const _androidWidgetName = 'ScarletHomeWidget';

  Future<void> init() async {
    await HomeWidget.setAppGroupId('com.example.scarlet_app');
  }

  Future<void> updateDutyStatus(String status) async {
    await HomeWidget.saveWidgetData('duty_status', status);
    await HomeWidget.updateWidget(
      androidName: _androidWidgetName,
    );
  }
}
