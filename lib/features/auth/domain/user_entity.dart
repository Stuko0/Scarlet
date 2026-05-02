/// Immutable User entity mapped from the `users` database table.
class User {
  final int id;
  final int? institutionId;
  final int? teamId;
  final String fullName;
  final String email;
  final String? phone;
  final String? bloodType;
  final String? role;
  final int? yearsExperience;
  final bool isActive;
  final String? dutyStatus;

  const User({
    required this.id,
    this.institutionId,
    this.teamId,
    required this.fullName,
    required this.email,
    this.phone,
    this.bloodType,
    this.role,
    this.yearsExperience,
    this.isActive = true,
    this.dutyStatus,
  });

  /// Factory from JSON response (login or user GET)
  /// Factory from JSON response — handles both camelCase (API) and snake_case
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: _parseInt(json['id'] ?? json['user_id'] ?? json['userId']),
      institutionId:
          _parseIntOrNull(json['institution_id'] ?? json['institutionId']),
      teamId: _parseIntOrNull(json['team_id'] ?? json['teamId']),
      fullName:
          json['full_name'] as String? ?? json['fullName'] as String? ?? '',
      email: json['email'] as String? ?? '',
      phone: json['phone'] as String?,
      bloodType: json['blood_type'] as String? ?? json['bloodType'] as String?,
      role: json['role'] as String?,
      yearsExperience:
          _parseIntOrNull(json['years_experience'] ?? json['yearsExperience']),
      isActive: json['is_active'] as bool? ?? json['isActive'] as bool? ?? true,
      dutyStatus:
          json['duty_status'] as String? ?? json['dutyStatus'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'institution_id': institutionId,
      'team_id': teamId,
      'full_name': fullName,
      'email': email,
      'phone': phone,
      'blood_type': bloodType,
      'role': role,
      'years_experience': yearsExperience,
      'is_active': isActive,
      'duty_status': dutyStatus,
    };
  }

  User copyWith({
    int? id,
    int? institutionId,
    int? teamId,
    String? fullName,
    String? email,
    String? phone,
    String? bloodType,
    String? role,
    int? yearsExperience,
    bool? isActive,
    String? dutyStatus,
  }) {
    return User(
      id: id ?? this.id,
      institutionId: institutionId ?? this.institutionId,
      teamId: teamId ?? this.teamId,
      fullName: fullName ?? this.fullName,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      bloodType: bloodType ?? this.bloodType,
      role: role ?? this.role,
      yearsExperience: yearsExperience ?? this.yearsExperience,
      isActive: isActive ?? this.isActive,
      dutyStatus: dutyStatus ?? this.dutyStatus,
    );
  }

  static int _parseInt(dynamic value) {
    if (value is int) return value;
    if (value is String) return int.parse(value);
    return 0;
  }

  static int? _parseIntOrNull(dynamic value) {
    if (value == null) return null;
    if (value is int) return value;
    if (value is String) return int.tryParse(value);
    return null;
  }
}
