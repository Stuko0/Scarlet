abstract class PersonnelRepository {
  Future<void> updateDutyStatus(int userId, String status);
  Future<void> reportLocation({
    required int userId,
    required double latitude,
    required double longitude,
    required int timestampMs,
  });
  Future<void> updateSafetyStatus({
    required int userId,
    required String status,
    double? latitude,
    double? longitude,
    required int timestampMs,
  });
  Future<List<TeamSafetyStatus>> getTeamSafetyStatus(int teamId);
}

/// Estado de seguridad de un miembro del equipo (backend).
class TeamSafetyStatus {
  final int userId;
  final String status;
  final double? latitude;
  final double? longitude;
  final int timestampMs;

  const TeamSafetyStatus({
    required this.userId,
    required this.status,
    this.latitude,
    this.longitude,
    required this.timestampMs,
  });

  factory TeamSafetyStatus.fromJson(Map<String, dynamic> json) {
    return TeamSafetyStatus(
      userId: (json['user_id'] as num).toInt(),
      status: json['status'] as String,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      timestampMs: (json['timestamp_ms'] as num).toInt(),
    );
  }
}
