import 'dart:async';
import 'package:flutter/services.dart';
import 'package:audioplayers/audioplayers.dart';

class TeamAlarm {
  static final TeamAlarm _instance = TeamAlarm._();
  factory TeamAlarm() => _instance;
  TeamAlarm._();

  final AudioPlayer _player = AudioPlayer();
  Timer? _vibrationTimer;
  bool _isActive = false;

  void start() {
    if (_isActive) return;
    _isActive = true;

    _vibrationTimer = Timer.periodic(const Duration(milliseconds: 800), (_) {
      HapticFeedback.heavyImpact();
    });

    _player.play(AssetSource('audio/alarm.mp3'));
  }

  void stop() {
    _isActive = false;
    _vibrationTimer?.cancel();
    _player.stop();
  }
}
