class Asset {
  final int id;
  final int institutionId;
  final String callsign;
  final String category;
  final String status;
  final int? waterCapacityLiters;
  final int? fuelLevelPercent;
  final double? lastKnownLat;
  final double? lastKnownLng;

  const Asset({
    required this.id,
    required this.institutionId,
    required this.callsign,
    required this.category,
    required this.status,
    this.waterCapacityLiters,
    this.fuelLevelPercent,
    this.lastKnownLat,
    this.lastKnownLng,
  });

  factory Asset.fromJson(Map<String, dynamic> json) {
    return Asset(
      id: json['id'] as int? ?? 0,
      institutionId: json['institution_id'] as int? ?? 0,
      callsign: json['callsign'] as String? ?? '',
      category: json['category'] as String? ?? '',
      status: json['status'] as String? ?? '',
      waterCapacityLiters: json['water_capacity_liters'] as int?,
      fuelLevelPercent: json['fuel_level_percent'] as int?,
      lastKnownLat: _parseDouble(json['last_known_lat']),
      lastKnownLng: _parseDouble(json['last_known_lng']),
    );
  }

  static double? _parseDouble(dynamic value) {
    if (value == null) return null;
    if (value is double) return value;
    if (value is int) return value.toDouble();
    if (value is String) return double.tryParse(value);
    return null;
  }
}
