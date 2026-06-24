import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:scarlet_app/features/auth/domain/user_entity.dart';
import 'package:scarlet_app/features/auth/presentation/providers/auth_controller.dart';
import 'package:scarlet_app/features/team_safety/presentation/providers/team_safety_controller.dart';
import 'providers/teams_controller.dart';

class TeamsPage extends ConsumerWidget {
  const TeamsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final teamState = ref.watch(teamControllerProvider);
    final currentUser = ref.watch(authControllerProvider).valueOrNull;

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Mi Equipo',
          style: TextStyle(
            color: Color(0xFF2D2D2D),
            fontSize: 19,
            fontFamily: 'DM Sans',
            fontWeight: FontWeight.w600,
          ),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(color: const Color(0xFFE4E4E4), height: 1),
        ),
      ),
      body: teamState.when(
        loading: () => const Center(
          child: CircularProgressIndicator(color: Color(0xFFDF8946)),
        ),
        error: (e, _) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error_outline, size: 48, color: Colors.grey),
              const SizedBox(height: 12),
              Text('Error: $e', style: const TextStyle(color: Colors.grey)),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () =>
                    ref.read(teamControllerProvider.notifier).refresh(),
                child: const Text('Reintentar'),
              ),
            ],
          ),
        ),
        data: (team) {
          if (team == null) {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.groups_outlined,
                      size: 64, color: Color(0xFFBABABA)),
                  SizedBox(height: 16),
                  Text(
                    'No perteneces a ningún equipo',
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'DM Sans',
                      color: Color(0xFF656565),
                    ),
                  ),
                ],
              ),
            );
          }

          return RefreshIndicator(
            color: const Color(0xFFDF8946),
            onRefresh: () =>
                ref.read(teamControllerProvider.notifier).refresh(),
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                // Team header card
                _TeamHeaderCard(
                  teamName: team.team.name,
                  isActive: team.team.isActive,
                  memberCount: team.members.length,
                  onDutyCount: team.members
                      .where((m) => m.dutyStatus == 'on-duty')
                      .length,
                ),
                if (team.activeIncident != null && team.activeIncident!.active) ...[
                  const SizedBox(height: 12),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: const Color(0xFFE74C3C).withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: const Color(0xFFE74C3C).withValues(alpha: 0.3),
                      ),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.warning, color: Color(0xFFE74C3C), size: 24),
                        const SizedBox(width: 12),
                        const Expanded(
                          child: Text(
                            'Incidencia activa asignada',
                            style: TextStyle(
                              color: Color(0xFFE74C3C),
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              fontFamily: 'DM Sans',
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            final user = ref.read(authControllerProvider).valueOrNull;
                            if (user != null) {
                              ref.read(teamSafetyControllerProvider.notifier).joinIncident(
                                '${user.teamId ?? 0}',
                                '${user.id}',
                                user.fullName,
                              );
                              context.go('/team-safety');
                            }
                          },
                          child: const Text('Ver equipo'),
                        ),
                      ],
                    ),
                  ),
                ],
                const SizedBox(height: 20),

                // Section title
                Padding(
                  padding: const EdgeInsets.only(left: 4, bottom: 12),
                  child: Text(
                    'Miembros (${team.members.length})',
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'DM Sans',
                      color: Color(0xFF2D2D2D),
                    ),
                  ),
                ),

                // Member list
                ...team.members.map((member) => _MemberCard(
                      member: member,
                      isCurrentUser: member.id == currentUser?.id,
                    )),
              ],
            ),
          );
        },
      ),
    );
  }
}

/// Team info header with name, status, and quick stats
class _TeamHeaderCard extends StatelessWidget {
  final String teamName;
  final bool isActive;
  final int memberCount;
  final int onDutyCount;

  const _TeamHeaderCard({
    required this.teamName,
    required this.isActive,
    required this.memberCount,
    required this.onDutyCount,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFFDF8946), Color(0xFFC47030)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFDF8946).withAlpha(60),
            blurRadius: 16,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.shield_outlined, color: Colors.white, size: 28),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  teamName,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'DM Sans',
                  ),
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: isActive
                      ? Colors.white.withAlpha(40)
                      : Colors.red.withAlpha(40),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  isActive ? 'ACTIVO' : 'INACTIVO',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'DM Sans',
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              _StatChip(
                icon: Icons.people_outline,
                label: 'Miembros',
                value: '$memberCount',
              ),
              const SizedBox(width: 16),
              _StatChip(
                icon: Icons.radio_button_checked,
                label: 'En servicio',
                value: '$onDutyCount',
              ),
              const SizedBox(width: 16),
              _StatChip(
                icon: Icons.radio_button_off,
                label: 'Fuera',
                value: '${memberCount - onDutyCount}',
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _StatChip extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _StatChip({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Icon(icon, color: Colors.white70, size: 14),
            const SizedBox(width: 4),
            Text(
              value,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w700,
                fontFamily: 'DM Sans',
              ),
            ),
          ],
        ),
        const SizedBox(height: 2),
        Text(
          label,
          style: const TextStyle(
            color: Colors.white70,
            fontSize: 11,
            fontFamily: 'DM Sans',
          ),
        ),
      ],
    );
  }
}

/// Individual member card
class _MemberCard extends StatelessWidget {
  final User member;
  final bool isCurrentUser;

  const _MemberCard({required this.member, required this.isCurrentUser});

  Color get _roleColor {
    switch (member.role) {
      case 'COMMANDER':
        return const Color(0xFFDF8946);
      case 'SUPERADMIN':
      case 'INSTITUTION_ADMIN':
        return const Color(0xFF8E44AD);
      default:
        return const Color(0xFF3498DB);
    }
  }

  String get _roleLabel {
    switch (member.role) {
      case 'COMMANDER':
        return 'Comandante';
      case 'SUPERADMIN':
        return 'Super Admin';
      case 'INSTITUTION_ADMIN':
        return 'Admin';
      case 'MEMBER':
        return 'Miembro';
      case 'CIVILIAN':
        return 'Civil';
      default:
        return member.role ?? 'Miembro';
    }
  }

  @override
  Widget build(BuildContext context) {
    final isOnDuty = member.dutyStatus == 'on-duty';

    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: isCurrentUser
            ? Border.all(color: const Color(0xFFDF8946), width: 1.5)
            : null,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(8),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          // Top row: avatar, name, role, duty status
          Row(
            children: [
              // Avatar with duty status ring
              Stack(
                children: [
                  CircleAvatar(
                    radius: 24,
                    backgroundColor: _roleColor.withAlpha(30),
                    child: Text(
                      member.fullName.isNotEmpty
                          ? member.fullName[0].toUpperCase()
                          : '?',
                      style: TextStyle(
                        color: _roleColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'DM Sans',
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 14,
                      height: 14,
                      decoration: BoxDecoration(
                        color: isOnDuty
                            ? const Color(0xFF2ECC71)
                            : const Color(0xFFE74C3C),
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 2),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 14),

              // Name and role
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Flexible(
                          child: Text(
                            member.fullName,
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'DM Sans',
                              color: Color(0xFF2D2D2D),
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        if (isCurrentUser) ...[
                          const SizedBox(width: 6),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 6, vertical: 1),
                            decoration: BoxDecoration(
                              color: const Color(0xFFDF8946).withAlpha(20),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: const Text(
                              'TÚ',
                              style: TextStyle(
                                color: Color(0xFFDF8946),
                                fontSize: 9,
                                fontWeight: FontWeight.w800,
                                fontFamily: 'DM Sans',
                              ),
                            ),
                          ),
                        ],
                      ],
                    ),
                    const SizedBox(height: 2),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 2),
                          decoration: BoxDecoration(
                            color: _roleColor.withAlpha(20),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            _roleLabel,
                            style: TextStyle(
                              color: _roleColor,
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'DM Sans',
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          isOnDuty ? 'En servicio' : 'Fuera de servicio',
                          style: TextStyle(
                            color: isOnDuty
                                ? const Color(0xFF2ECC71)
                                : Colors.grey,
                            fontSize: 11,
                            fontFamily: 'DM Sans',
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

          const SizedBox(height: 12),
          Container(height: 1, color: const Color(0xFFF0F0F0)),
          const SizedBox(height: 10),

          // Bottom row: contact info and stats
          Row(
            children: [
              _InfoChip(Icons.bloodtype_outlined, member.bloodType ?? 'N/A'),
              const SizedBox(width: 16),
              _InfoChip(
                  Icons.badge_outlined, '${member.yearsExperience ?? 0} años'),
              const Spacer(),
              if (member.phone != null && member.phone!.isNotEmpty)
                _InfoChip(Icons.phone_outlined, member.phone!),
            ],
          ),
        ],
      ),
    );
  }
}

class _InfoChip extends StatelessWidget {
  final IconData icon;
  final String text;

  const _InfoChip(this.icon, this.text);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 14, color: const Color(0xFF999999)),
        const SizedBox(width: 4),
        Text(
          text,
          style: const TextStyle(
            fontSize: 12,
            color: Color(0xFF777777),
            fontFamily: 'DM Sans',
          ),
        ),
      ],
    );
  }
}
