import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:sensors_plus/sensors_plus.dart';

final motionDetectorProvider = Provider<MotionDetector>((ref) {
  return MotionDetector();
});

class MotionDetector {
  DateTime? _lastMovementAt;
  StreamSubscription<Position>? _positionSub;
  StreamSubscription<AccelerometerEvent>? _accelSub;
  bool _isRunning = false;

  DateTime? get lastMovementAt => _lastMovementAt;

  bool get isStill {
    if (_lastMovementAt == null) return true;
    return DateTime.now().difference(_lastMovementAt!) > const Duration(minutes: 5);
  }

  void start() {
    if (_isRunning) return;
    _isRunning = true;
    _lastMovementAt = DateTime.now();

    _positionSub = Geolocator.getPositionStream(
      locationSettings: const LocationSettings(
        accuracy: LocationAccuracy.high,
        distanceFilter: 5,
      ),
    ).listen((_) {
      _lastMovementAt = DateTime.now();
    });

    _accelSub = accelerometerEventStream().listen((event) {
      final magnitude = event.x.abs() + event.y.abs() + event.z.abs();
      if (magnitude > 12.0) {
        _lastMovementAt = DateTime.now();
      }
    });
  }

  void stop() {
    _isRunning = false;
    _positionSub?.cancel();
    _accelSub?.cancel();
  }

  /// Marca actividad manual (respuesta del usuario al self-check),
  /// reiniciando la ventana de "quieto".
  void acknowledgeActivity() {
    _lastMovementAt = DateTime.now();
  }
}
