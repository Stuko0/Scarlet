import 'package:latlong2/latlong.dart';
import 'route_entity.dart';

abstract class RouteRepository {
  Future<Route> getRoute(LatLng from, LatLng to);
  Future<void> ensureInitialTiles(LatLng location);
}
