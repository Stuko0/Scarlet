import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';
import 'package:scarlet_app/features/routing/domain/route_entity.dart';
import 'package:scarlet_app/features/routing/data/route_repository_impl.dart';

final routeControllerProvider =
    AsyncNotifierProvider.family<RouteController, Route?, LatLng>(
  RouteController.new,
);

class RouteController extends FamilyAsyncNotifier<Route?, LatLng> {
  @override
  Future<Route?> build(LatLng arg) async {
    return null;
  }

  Future<void> calculateRoute(LatLng origin) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final repo = ref.read(routeRepositoryProvider);
      return await repo.getRoute(origin, arg);
    });
  }
}
