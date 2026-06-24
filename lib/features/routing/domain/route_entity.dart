import 'package:latlong2/latlong.dart';

class Route {
  final List<LatLng> points;
  final double distanceMeters;
  final double durationSeconds;

  const Route({
    required this.points,
    required this.distanceMeters,
    required this.durationSeconds,
  });
}
