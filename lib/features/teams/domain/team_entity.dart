class Team {
  final int id;
  final String name;
  final bool isActive;

  const Team({
    required this.id,
    required this.name,
    required this.isActive,
  });

  factory Team.fromJson(Map<String, dynamic> json) {
    return Team(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String? ?? '',
      isActive: json['is_active'] as bool? ?? true,
    );
  }
}
