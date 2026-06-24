abstract class PersonnelRepository {
  Future<void> updateDutyStatus(int userId, String status);
  Future<void> reportLocation({
    required int userId,
    required double latitude,
    required double longitude,
    required int timestampMs,
  });
}
