import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scarlet_app/features/auth/domain/user_entity.dart';
import 'package:scarlet_app/features/auth/presentation/auth_controller.dart';
import 'package:scarlet_app/features/teams/data/teams_repository.dart';

/// Team data state
class TeamState {
  final String teamName;
  final bool isActive;
  final List<User> members;

  const TeamState({
    required this.teamName,
    required this.isActive,
    required this.members,
  });
}

/// Provider that loads the current user's team
final teamControllerProvider =
    AsyncNotifierProvider<TeamController, TeamState?>(() => TeamController());

class TeamController extends AsyncNotifier<TeamState?> {
  @override
  Future<TeamState?> build() async {
    final user = ref.watch(authControllerProvider).valueOrNull;
    if (user == null || user.teamId == null) return null;
    return _loadTeam(user.teamId!);
  }

  Future<TeamState?> _loadTeam(int teamId) async {
    final repo = ref.read(teamsRepositoryProvider);

    // Fetch team info and members in parallel
    final results = await Future.wait([
      repo.getTeam(teamId),
      repo.getTeamMembers(teamId),
    ]);

    final teamData = results[0] as Map<String, dynamic>;
    final members = results[1] as List<User>;

    // Sort: commanders first, then by name
    members.sort((a, b) {
      final roleOrder = {'COMMANDER': 0, 'MEMBER': 1, 'CIVILIAN': 2};
      final aOrder = roleOrder[a.role] ?? 3;
      final bOrder = roleOrder[b.role] ?? 3;
      if (aOrder != bOrder) return aOrder.compareTo(bOrder);
      return a.fullName.compareTo(b.fullName);
    });

    return TeamState(
      teamName: teamData['name'] as String? ??
          teamData['teamName'] as String? ??
          'Equipo',
      isActive: teamData['is_active'] as bool? ??
          teamData['isActive'] as bool? ??
          true,
      members: members,
    );
  }

  Future<void> refresh() async {
    final user = ref.read(authControllerProvider).valueOrNull;
    if (user == null || user.teamId == null) return;
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _loadTeam(user.teamId!));
  }
}
