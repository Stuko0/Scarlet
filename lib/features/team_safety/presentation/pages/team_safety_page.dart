import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scarlet_app/features/auth/presentation/providers/auth_controller.dart';
import 'package:scarlet_app/features/team_safety/domain/team_member_status.dart';
import 'package:scarlet_app/features/team_safety/presentation/providers/team_safety_controller.dart';
import 'package:scarlet_app/features/team_safety/presentation/widgets/danger_self_check_modal.dart';
import 'package:scarlet_app/features/team_safety/presentation/widgets/team_alarm.dart';

class TeamSafetyPage extends ConsumerWidget {
  const TeamSafetyPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final statusesAsync = ref.watch(teamSafetyControllerProvider);
    final isActive = ref.watch(activeIncidentProvider);

    // Watchdog UI: cuando el controller marca quieto >5 min sin responder,
    // abre el self-check una sola vez por episodio.
    ref.listen<bool>(selfCheckRequiredProvider, (previous, required) {
      if (!required || previous == true) return;
      _showSelfCheck(context, ref);
    });

    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        title: const Text(
          'ESTADO DEL EQUIPO',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w800,
            letterSpacing: 1.2,
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color(0xFF1E1E1E),
        elevation: 0,
        actions: [
          if (isActive)
            TextButton.icon(
              icon: const Icon(Icons.exit_to_app, color: Colors.red),
              label: const Text('Salir', style: TextStyle(color: Colors.red)),
              onPressed: () {
                TeamAlarm().stop();
                ref.read(teamSafetyControllerProvider.notifier).leaveIncident();
                if (context.mounted) Navigator.pop(context);
              },
            ),
        ],
      ),
      body: statusesAsync.when(
        loading: () => const Center(
          child: CircularProgressIndicator(color: Color(0xFFDF8946)),
        ),
        error: (e, _) => Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.error_outline, size: 48, color: Colors.grey),
              const SizedBox(height: 12),
              Text(
                'Error: $e',
                style: const TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ),
        data: (statuses) {
          if (statuses.isEmpty) {
            return const Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.groups_outlined, size: 64, color: Colors.grey),
                  SizedBox(height: 16),
                  Text(
                    'Esperando miembros del equipo...',
                    style: TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                ],
              ),
            );
          }

          return ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: statuses.length,
            separatorBuilder: (_, __) => const SizedBox(height: 12),
            itemBuilder: (context, index) => _MemberStatusCard(
              status: statuses[index],
            ),
          );
        },
      ),
    );
  }

  Future<void> _showSelfCheck(BuildContext context, WidgetRef ref) async {
    final user = ref.read(authControllerProvider).valueOrNull;
    final name = user?.fullName ?? 'Bombero';

    // Alarma local mientras el modal está abierto.
    TeamAlarm().start();

    MemberStatus? result;
    if (context.mounted) {
      result = await showDialog<MemberStatus>(
        context: context,
        barrierDismissible: false,
        builder: (_) => DangerSelfCheckModal(firefighterName: name),
      );
    }
    TeamAlarm().stop();

    // null = timeout del modal (30s) → PELIGRO. ok = usuario respondió.
    ref
        .read(teamSafetyControllerProvider.notifier)
        .resolveSelfCheck(isOk: result == MemberStatus.ok);
  }
}

class _MemberStatusCard extends StatelessWidget {
  final TeamMemberStatus status;

  const _MemberStatusCard({required this.status});

  Color _statusColor() {
    switch (status.status) {
      case MemberStatus.active:
        return const Color(0xFF2ECC71);
      case MemberStatus.still:
        return const Color(0xFFF39C12);
      case MemberStatus.danger:
        return const Color(0xFFE74C3C);
      case MemberStatus.ok:
        return const Color(0xFF2ECC71);
    }
  }

  String _statusLabel() {
    switch (status.status) {
      case MemberStatus.active:
        return 'Activo';
      case MemberStatus.still:
        return 'Quieto';
      case MemberStatus.danger:
        return 'PELIGRO';
      case MemberStatus.ok:
        return 'Bien';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E1E),
        borderRadius: BorderRadius.circular(14),
        border: status.status == MemberStatus.danger
            ? Border.all(color: const Color(0xFFE74C3C), width: 2)
            : null,
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 22,
            backgroundColor: _statusColor().withValues(alpha: 0.2),
            child: Text(
              status.fullName.isNotEmpty
                  ? status.fullName[0].toUpperCase()
                  : '?',
              style: TextStyle(
                color: _statusColor(),
                fontWeight: FontWeight.w700,
                fontSize: 18,
              ),
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  status.fullName,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: _statusColor(),
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      _statusLabel(),
                      style: TextStyle(
                        color: _statusColor(),
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
