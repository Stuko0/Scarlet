import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scarlet_app/features/team_safety/domain/team_member_status.dart';
import 'package:scarlet_app/features/team_safety/domain/team_safety_repository.dart';
import 'package:scarlet_app/features/team_safety/data/team_safety_repository_impl.dart';
import 'package:scarlet_app/features/team_safety/data/motion_detector.dart';

final teamSafetyControllerProvider =
    AsyncNotifierProvider<TeamSafetyController, List<TeamMemberStatus>>(
  TeamSafetyController.new,
);

final activeIncidentProvider = StateProvider<bool>((ref) => false);

class TeamSafetyController extends AsyncNotifier<List<TeamMemberStatus>> {
  StreamSubscription<List<TeamMemberStatus>>? _statusSub;

  @override
  Future<List<TeamMemberStatus>> build() async {
    return [];
  }

  Future<void> joinIncident(String teamId, String userId, String fullName) async {
    final repo = ref.read(teamSafetyRepositoryProvider);
    final motion = ref.read(motionDetectorProvider);

    await repo.advertise(teamId, userId, fullName);
    motion.start();

    _statusSub = repo.teamStatusStream.listen((statuses) {
      final ownStatus = TeamMemberStatus(
        userId: userId,
        fullName: fullName,
        lastUpdate: DateTime.now(),
        lastMovementAt: motion.lastMovementAt,
        status: motion.isStill ? MemberStatus.still : MemberStatus.active,
      );
      repo.sendStatus(ownStatus);
      state = AsyncValue.data(statuses);
    });

    ref.onDispose(() {
      _statusSub?.cancel();
      repo.disconnect();
      motion.stop();
      ref.read(activeIncidentProvider.notifier).state = false;
    });

    ref.read(activeIncidentProvider.notifier).state = true;
  }

  Future<void> leaveIncident() async {
    final repo = ref.read(teamSafetyRepositoryProvider);
    final motion = ref.read(motionDetectorProvider);

    await repo.disconnect();
    motion.stop();
    _statusSub?.cancel();

    state = const AsyncValue.data([]);
    ref.read(activeIncidentProvider.notifier).state = false;
  }
}
