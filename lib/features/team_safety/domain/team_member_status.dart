import 'package:latlong2/latlong.dart';

enum MemberStatus { active, still, danger, ok }

class TeamMemberStatus {
  final String userId;
  final String fullName;
  final LatLng? location;
  final DateTime lastUpdate;
  final DateTime? lastMovementAt;
  final MemberStatus status;

  const TeamMemberStatus({
    required this.userId,
    required this.fullName,
    this.location,
    required this.lastUpdate,
    this.lastMovementAt,
    required this.status,
  });

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'fullName': fullName,
      'latitude': location?.latitude,
      'longitude': location?.longitude,
      'lastUpdate': lastUpdate.toIso8601String(),
      'lastMovementAt': lastMovementAt?.toIso8601String(),
      'status': status.name,
    };
  }

  factory TeamMemberStatus.fromJson(Map<String, dynamic> json) {
    return TeamMemberStatus(
      userId: json['userId'] as String,
      fullName: json['fullName'] as String,
      location: json['latitude'] != null && json['longitude'] != null
          ? LatLng(json['latitude'] as double, json['longitude'] as double)
          : null,
      lastUpdate: DateTime.parse(json['lastUpdate'] as String),
      lastMovementAt: json['lastMovementAt'] != null
          ? DateTime.parse(json['lastMovementAt'] as String)
          : null,
      status: MemberStatus.values.firstWhere(
        (s) => s.name == json['status'],
        orElse: () => MemberStatus.active,
      ),
    );
  }
}
