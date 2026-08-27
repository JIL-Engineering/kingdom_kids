import 'package:go_router/go_router.dart';
import 'package:serverpod_auth_idp_flutter/serverpod_auth_idp_flutter.dart';

import '../../features/auth/screens/auth_screen.dart';
import '../../features/auth/screens/consent_screen.dart';
import '../../features/auth/screens/onboarding_screen.dart';
import '../../features/child_profile/screens/add_child_screen.dart';
import '../../features/child_profile/screens/profile_picker_screen.dart';
import '../../main.dart';

const _preAuthRoutes = {'/onboarding', '/auth'};

/// Sprint 1 routes only: onboarding -> auth -> consent -> profile picker.
/// Home/Library screens don't exist yet (Sprint 3-4) so the flow ends at the
/// profile picker for now.
///
/// There's no "is my profile already complete" check yet (no such endpoint
/// exists), so a signed-in user always lands on the profile picker directly,
/// skipping onboarding/auth but not re-prompting for consent either -- a
/// known simplification, see docs/08_sprint1_assignments.md.
final appRouter = GoRouter(
  initialLocation: '/onboarding',
  refreshListenable: client.auth.authInfoListenable,
  redirect: (context, state) {
    final isAuthenticated = client.auth.isAuthenticated;
    final isOnPreAuthRoute = _preAuthRoutes.contains(state.matchedLocation);

    if (!isAuthenticated && !isOnPreAuthRoute) return '/onboarding';
    if (isAuthenticated && isOnPreAuthRoute) return '/profiles';
    return null;
  },
  routes: [
    GoRoute(
      path: '/onboarding',
      builder: (context, state) => const OnboardingScreen(),
    ),
    GoRoute(
      path: '/auth',
      builder: (context, state) => const AuthScreen(),
    ),
    GoRoute(
      path: '/consent',
      builder: (context, state) => const ConsentScreen(),
    ),
    GoRoute(
      path: '/profiles',
      builder: (context, state) => const ProfilePickerScreen(),
    ),
    GoRoute(
      path: '/profiles/add',
      builder: (context, state) => const AddChildScreen(),
    ),
  ],
);
