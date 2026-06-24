import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scarlet_app/features/auth/domain/user_entity.dart';
import 'package:scarlet_app/features/auth/presentation/providers/auth_controller.dart';
import 'package:scarlet_app/features/teams/data/teams_repository.dart';
import 'package:scarlet_app/features/teams/domain/team_entity.dart';

class TeamState {
  final Team team;
  final List<User> members;

  const TeamState({
    required this.team,
    required this.members,
  });
}

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

    final results = await Future.wait([
      repo.getTeam(teamId),
      repo.getTeamMembers(teamId),
    ]);

    final team = results[0] as Team;
    final members = results[1] as List<User>;

    members.sort((a, b) {
      final roleOrder = {'COMMANDER': 0, 'MEMBER': 1, 'CIVILIAN': 2};
      final aOrder = roleOrder[a.role] ?? 3;
      final bOrder = roleOrder[b.role] ?? 3;
      if (aOrder != bOrder) return aOrder.compareTo(bOrder);
      return a.fullName.compareTo(b.fullName);
    });

    return TeamState(team: team, members: members);
  }

  Future<void> refresh() async {
    final user = ref.read(authControllerProvider).valueOrNull;
    if (user == null || user.teamId == null) return;
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _loadTeam(user.teamId!));
  }
}
