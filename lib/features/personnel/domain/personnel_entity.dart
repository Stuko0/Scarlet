class DutyStatusUpdate {
  final int userId;
  final String status;

  const DutyStatusUpdate({required this.userId, required this.status});
}

class LocationReport {
  final int userId;
  final double latitude;
  final double longitude;
  final int timestampMs;

  const LocationReport({
    required this.userId,
    required this.latitude,
    required this.longitude,
    required this.timestampMs,
  });
}
