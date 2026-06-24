import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scarlet_app/features/personnel/presentation/providers/duty_status_controller.dart';
import 'package:scarlet_app/features/auth/presentation/providers/auth_controller.dart';
import 'package:scarlet_app/features/auth/data/biometric_auth_service.dart';
import 'package:scarlet_app/features/auth/data/biometric_auth_provider.dart';
import 'package:scarlet_app/core/storage/secure_storage.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authControllerProvider);
    final dutyState = ref.watch(dutyStatusProvider);
    final user = authState.valueOrNull;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Mi Perfil',
          style: TextStyle(
            color: Color(0xFF656565),
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
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          // Profile avatar
          const Center(
            child: CircleAvatar(
              radius: 50,
              backgroundColor: Color(0xFFDF8946),
              child: Icon(Icons.person, size: 50, color: Colors.white),
            ),
          ),
          const SizedBox(height: 16),

          // User name
          Center(
            child: Text(
              user?.fullName.isNotEmpty == true ? user!.fullName : 'Bombero',
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w700,
                fontFamily: 'DM Sans',
                color: Color(0xFF2D2D2D),
              ),
            ),
          ),
          const SizedBox(height: 4),

          // Role badge
          Center(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              decoration: BoxDecoration(
                color: const Color(0xFFDF8946).withAlpha(25),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                user?.role ?? 'MEMBER',
                style: const TextStyle(
                  color: Color(0xFFDF8946),
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                  fontFamily: 'DM Sans',
                ),
              ),
            ),
          ),
          const SizedBox(height: 32),

          // Duty Status Toggle
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: const Color(0xFFE4E4E4)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withAlpha(8),
                  blurRadius: 10,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              children: [
                const Text(
                  'Estado Operativo',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'DM Sans',
                    color: Color(0xFF656565),
                  ),
                ),
                const SizedBox(height: 12),
                dutyState.when(
                  data: (status) {
                    final isOnDuty = status == 'on-duty';
                    return GestureDetector(
                      onTap: () =>
                          ref.read(dutyStatusProvider.notifier).toggle(),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 12),
                        decoration: BoxDecoration(
                          color: isOnDuty
                              ? const Color(0xFF2ECC71)
                              : const Color(0xFFE74C3C),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              isOnDuty
                                  ? Icons.radio_button_checked
                                  : Icons.radio_button_off,
                              color: Colors.white,
                              size: 20,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              isOnDuty ? 'EN SERVICIO' : 'FUERA DE SERVICIO',
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 14,
                                fontFamily: 'DM Sans',
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  loading: () => const CircularProgressIndicator(),
                  error: (e, _) => Text('Error: $e'),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),

          // Info cards
          _buildInfoTile(Icons.email_outlined, 'Email', user?.email ?? ''),
          _buildInfoTile(
              Icons.phone_outlined, 'Teléfono', user?.phone ?? 'N/A'),
          _buildInfoTile(Icons.bloodtype_outlined, 'Tipo de Sangre',
              user?.bloodType ?? 'N/A'),
          _buildInfoTile(Icons.badge_outlined, 'Experiencia',
              '${user?.yearsExperience ?? 0} años'),

          const SizedBox(height: 24),

          _BiometricToggle(),

          const SizedBox(height: 32),

          // Logout button
          SizedBox(
            width: double.infinity,
            height: 48,
            child: OutlinedButton.icon(
              onPressed: () async {
                await ref.read(authControllerProvider.notifier).logout();
                // GoRouter redirect will handle navigation to /login
              },
              icon: const Icon(Icons.logout, color: Color(0xFFA20E0E)),
              label: const Text(
                'Cerrar sesión',
                style: TextStyle(
                  color: Color(0xFFA20E0E),
                  fontFamily: 'DM Sans',
                  fontWeight: FontWeight.w600,
                ),
              ),
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Color(0xFFA20E0E)),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoTile(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: const Color(0xFFE4E4E4)),
        ),
        child: Row(
          children: [
            Icon(icon, color: const Color(0xFFDF8946), size: 24),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: const TextStyle(
                    fontSize: 11,
                    color: Color(0xFF656565),
                    fontFamily: 'DM Sans',
                  ),
                ),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'DM Sans',
                    color: Color(0xFF2D2D2D),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _BiometricToggle extends ConsumerStatefulWidget {
  const _BiometricToggle();

  @override
  ConsumerState<_BiometricToggle> createState() => _BiometricToggleState();
}

class _BiometricToggleState extends ConsumerState<_BiometricToggle> {
  bool _isAvailable = false;
  bool _isEnabled = false;
  bool _loaded = false;

  @override
  void initState() {
    super.initState();
    _checkAvailability();
  }

  Future<void> _checkAvailability() async {
    final biometricService = ref.read(biometricAuthServiceProvider);
    final storage = ref.read(secureStorageProvider);

    final available = await biometricService.canAuthenticate();
    final enabled = await storage.isBiometricEnabled();

    if (mounted) {
      setState(() {
        _isAvailable = available;
        _isEnabled = enabled;
        _loaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!_loaded) return const SizedBox.shrink();

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE4E4E4)),
      ),
      child: Row(
        children: [
          const Icon(Icons.fingerprint, color: Color(0xFFDF8946), size: 24),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Desbloqueo biométrico',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'DM Sans',
                    color: Color(0xFF2D2D2D),
                  ),
                ),
                Text(
                  _isAvailable
                      ? 'Inicia sesión con tu huella o rostro'
                      : 'No disponible en este dispositivo',
                  style: TextStyle(
                    fontSize: 11,
                    color: _isAvailable
                        ? const Color(0xFF656565)
                        : Colors.grey.shade400,
                    fontFamily: 'DM Sans',
                  ),
                ),
              ],
            ),
          ),
          Switch(
            value: _isEnabled,
            activeColor: const Color(0xFFDF8946),
            onChanged: _isAvailable
                ? (value) async {
                    final storage = ref.read(secureStorageProvider);
                    await storage.setBiometricEnabled(value);
                    setState(() => _isEnabled = value);
                  }
                : null,
          ),
        ],
      ),
    );
  }
}
