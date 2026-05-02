import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Shell page with bottom navigation bar.
/// Wraps the GoRouter ShellRoute child.
class ShellPage extends StatelessWidget {
  final Widget child;

  const ShellPage({super.key, required this.child});

  int _currentIndex(BuildContext context) {
    final location = GoRouterState.of(context).matchedLocation;
    if (location.startsWith('/dashboard')) return 0;
    if (location.startsWith('/teams')) return 1;
    if (location.startsWith('/profile')) return 2;
    return 0;
  }

  @override
  Widget build(BuildContext context) {
    final index = _currentIndex(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: child,
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(color: Color(0xFFE4E4E4), width: 1),
          ),
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.white,
          elevation: 0,
          currentIndex: index,
          onTap: (i) {
            switch (i) {
              case 0:
                context.go('/dashboard');
                break;
              case 1:
                context.go('/teams');
                break;
              case 2:
                context.go('/profile');
                break;
            }
          },
          selectedItemColor: const Color(0xFFDF8946),
          showUnselectedLabels: true,
          enableFeedback: false,
          unselectedItemColor: const Color(0xFF6A6A6A),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.local_fire_department_outlined,
                  color: Color(0xFF6A6A6A), size: 24),
              label: 'Mapa',
              activeIcon: Icon(Icons.local_fire_department_outlined,
                  color: Color(0xFFDF8946), size: 24),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.groups, color: Color(0xFF6A6A6A), size: 24),
              label: 'Equipos',
              activeIcon:
                  Icon(Icons.groups, color: Color(0xFFDF8946), size: 24),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_pin_circle_outlined,
                  color: Color(0xFF6A6A6A), size: 24),
              label: 'Perfil',
              activeIcon: Icon(Icons.person_pin_circle_outlined,
                  color: Color(0xFFDF8946), size: 24),
            ),
          ],
        ),
      ),
    );
  }
}
