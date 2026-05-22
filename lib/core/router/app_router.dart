import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:scarlet_app/features/auth/presentation/auth_controller.dart';
import 'package:scarlet_app/features/auth/presentation/login_page.dart';
import 'package:scarlet_app/features/shell/presentation/shell_page.dart';
import 'package:scarlet_app/features/incidents/presentation/map_page.dart';
import 'package:scarlet_app/features/personnel/presentation/profile_page.dart';
import 'package:scarlet_app/features/teams/presentation/teams_page.dart';
import 'package:scarlet_app/features/inventory/presentation/pages/inventory_page.dart';

/// GoRouter provider
final routerProvider = Provider<GoRouter>((ref) {
  final authState = ref.watch(authControllerProvider);

  return GoRouter(
    initialLocation: '/dashboard',
    debugLogDiagnostics: true,

    // Global redirect: if not authenticated, always go to /login
    redirect: (context, state) {
      final isLoggedIn = authState.valueOrNull != null;
      final isLoginRoute = state.matchedLocation == '/login';

      if (!isLoggedIn && !isLoginRoute) {
        return '/login';
      }
      if (isLoggedIn && isLoginRoute) {
        return '/dashboard';
      }
      return null;
    },

    routes: [
      // Login (outside the shell)
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginPage(),
      ),

      // Main app shell with bottom navigation
      ShellRoute(
        builder: (context, state, child) => ShellPage(child: child),
        routes: [
          GoRoute(
            path: '/dashboard',
            pageBuilder: (context, state) => const NoTransitionPage(
              child: MapPage(),
            ),
          ),
          GoRoute(
            path: '/teams',
            pageBuilder: (context, state) => const NoTransitionPage(
              child: TeamsPage(),
            ),
          ),
          GoRoute(
            path: '/profile',
            pageBuilder: (context, state) => const NoTransitionPage(
              child: ProfilePage(),
            ),
          ),
          GoRoute(
            path: '/inventory',
            pageBuilder: (context, state) => const NoTransitionPage(
              child: InventoryPage(),
            ),
          ),
        ],
      ),
    ],
  );
});
