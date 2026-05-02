class Fire {
  final String eventId;
  final double latitude;
  final double longitude;
  final String confidence;
  final double temperature;
  final double humidity;
  final double wind;
  final double frp;
  final double brightness;
  final String scan;
  final String track;
  final String satellite;
  final String acqDate;
  final String acqTime;
  final String daynight;

  const Fire({
    required this.eventId,
    required this.latitude,
    required this.longitude,
    required this.confidence,
    required this.temperature,
    required this.humidity,
    required this.wind,
    required this.frp,
    required this.brightness,
    required this.scan,
    required this.track,
    required this.satellite,
    required this.acqDate,
    required this.acqTime,
    required this.daynight,
  });

  factory Fire.fromJson(Map<String, dynamic> json) {
    return Fire(
      eventId: json['event_id'] as String? ?? '',
      latitude: _parseDouble(json['latitude']),
      longitude: _parseDouble(json['longitude']),
      confidence: json['confidence'] as String? ?? '',
      temperature: _parseDouble(json['temperature']),
      humidity: _parseDouble(json['humidity']),
      wind: _parseDouble(json['wind']),
      frp: _parseDouble(json['frp']),
      brightness: _parseDouble(json['brightness']),
      scan: json['scan'] as String? ?? '',
      track: json['track'] as String? ?? '',
      satellite: json['satellite'] as String? ?? '',
      acqDate: json['acq_date'] as String? ?? '',
      acqTime: json['acq_time'] as String? ?? '',
      daynight: json['daynight'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'event_id': eventId,
      'latitude': latitude,
      'longitude': longitude,
      'confidence': confidence,
      'temperature': temperature,
      'humidity': humidity,
      'wind': wind,
      'frp': frp,
      'brightness': brightness,
      'scan': scan,
      'track': track,
      'satellite': satellite,
      'acq_date': acqDate,
      'acq_time': acqTime,
      'daynight': daynight,
    };
  }

  static double _parseDouble(dynamic value) {
    if (value is double) return value;
    if (value is int) return value.toDouble();
    if (value is String) return double.tryParse(value) ?? 0.0;
    return 0.0;
  }
}
