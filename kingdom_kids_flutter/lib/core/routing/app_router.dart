import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:kingdom_kids_client/kingdom_kids_client.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../features/auth/screens/auth_screen.dart';
import '../../features/auth/screens/consent_screen.dart';
import '../../features/auth/screens/onboarding_screen.dart';
import '../../features/auth/screens/splash_screen.dart';
import '../../features/child_profile/screens/child_form_screen.dart';
import '../../features/child_profile/screens/profile_picker_screen.dart';
import '../../features/settings/screens/pin_gate_screen.dart';
import '../../features/settings/screens/settings_screen.dart';
import '../auth/session_state.dart';

part 'app_router.g.dart';

const _preAuthRoutes = {'/onboarding', '/auth'};

/// go_router's `refreshListenable` needs a plain [Listenable] -- Riverpod
/// doesn't replace that contract, it just gets bridged to it here via
/// [Ref.listen]. This is the standard way to drive go_router re-evaluation
/// from Riverpod state.
class _RouterRefreshNotifier extends ChangeNotifier {
  _RouterRefreshNotifier(Ref ref) {
    ref.listen(sessionProvider, (_, _) => notifyListeners());
  }
}

/// Sprint 1 routes: splash -> onboarding -> auth -> consent -> profile
/// picker, plus the Settings/PIN gate. Home/Library screens don't exist yet
/// (Sprint 3-4) so the main flow ends at the profile picker for now.
///
/// Redirect logic is driven by [sessionProvider], which caches
/// whether the signed-in user has completed their profile (given consent)
/// so this doesn't hit the network on every navigation:
/// - not authenticated -> onboarding/auth only
/// - authenticated, profile not loaded yet -> splash
/// - authenticated, no consent yet -> consent
/// - authenticated, consent given -> profile picker (skips onboarding/consent)
@Riverpod(keepAlive: true)
GoRouter goRouter(Ref ref) {
  final refreshNotifier = _RouterRefreshNotifier(ref);
  ref.onDispose(refreshNotifier.dispose);

  return GoRouter(
    initialLocation: '/splash',
    refreshListenable: refreshNotifier,
    redirect: (context, state) {
      final session = ref.read(sessionProvider);
      final loc = state.matchedLocation;

      if (!session.isAuthenticated) {
        return _preAuthRoutes.contains(loc) ? null : '/onboarding';
      }

      if (session.isLoadingProfile) {
        return loc == '/splash' ? null : '/splash';
      }

      if (!session.hasCompletedProfile) {
        return loc == '/consent' ? null : '/consent';
      }

      final shouldLeave =
          _preAuthRoutes.contains(loc) || loc == '/consent' || loc == '/splash';
      if (shouldLeave) return '/profiles';

      // /settings is parent-only. This is the actual enforcement -- reaching
      // it any other way than through a successful PinGateScreen (deep
      // link, restored navigation state, a future button that goes
      // straight there) must not bypass the PIN.
      if (loc == '/settings' && !session.isParentModeUnlocked) {
        return '/settings/pin-gate';
      }

      return null;
    },
    routes: [
      GoRoute(
        path: '/splash',
        builder: (context, state) => const SplashScreen(),
      ),
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
        builder: (context, state) => const ChildFormScreen(),
      ),
      GoRoute(
        path: '/profiles/edit',
        builder: (context, state) =>
            ChildFormScreen(existingChild: state.extra as ChildProfile),
      ),
      GoRoute(
        path: '/settings',
        builder: (context, state) => const SettingsScreen(),
      ),
      GoRoute(
        path: '/settings/pin-gate',
        builder: (context, state) => PinGateScreen(
          mode: state.uri.queryParameters['change'] == 'true'
              ? PinGateMode.change
              : PinGateMode.initial,
        ),
      ),
    ],
  );
}
