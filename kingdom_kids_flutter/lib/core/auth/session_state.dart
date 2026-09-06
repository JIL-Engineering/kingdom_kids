import 'package:kingdom_kids_client/kingdom_kids_client.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:serverpod_auth_idp_flutter/serverpod_auth_idp_flutter.dart';

import '../../main.dart';

part 'session_state.g.dart';

/// Immutable snapshot of session state. Prefer deriving fields (like
/// [hasCompletedProfile]) here over recomputing them at call sites.
@immutable
class SessionData {
  const SessionData({
    required this.isAuthenticated,
    required this.isLoadingProfile,
    required this.profile,
    required this.isParentModeUnlocked,
  });

  final bool isAuthenticated;
  final bool isLoadingProfile;
  final AppUser? profile;

  /// Whether the parent has passed the PIN gate this session. Checked by
  /// app_router.dart to guard /settings -- reset on sign-out.
  final bool isParentModeUnlocked;

  bool get hasCompletedProfile => profile?.consentGivenAt != null;
}

/// Tracks the signed-in user's profile-completion state (has consent been
/// given?) so the router can decide onboarding vs. consent vs. profile
/// picker without hitting the network on every navigation check.
///
/// Fetches [AppUser] once per sign-in/sign-out transition and caches it;
/// [markProfileComplete] updates the cache directly after a successful
/// `completeProfile` call instead of re-fetching.
@Riverpod(keepAlive: true)
class SessionNotifier extends _$SessionNotifier {
  /// null until the first auth check completes; used only to detect a real
  /// sign-in/out transition below.
  bool? _lastIsAuthenticated;

  @override
  SessionData build() {
    client.auth.authInfoListenable.addListener(_onAuthChanged);
    ref.onDispose(() {
      client.auth.authInfoListenable.removeListener(_onAuthChanged);
    });
    // Kick off the initial check asynchronously -- build() itself must
    // return synchronously, so isLoadingProfile starts true until this
    // resolves, same as before the Riverpod migration.
    Future.microtask(_onAuthChanged);
    return const SessionData(
      isAuthenticated: false,
      isLoadingProfile: true,
      profile: null,
      isParentModeUnlocked: false,
    );
  }

  /// Called by PinGateScreen after a successful create/verify. This is the
  /// only way /settings becomes reachable.
  void unlockParentMode() {
    state = SessionData(
      isAuthenticated: state.isAuthenticated,
      isLoadingProfile: state.isLoadingProfile,
      profile: state.profile,
      isParentModeUnlocked: true,
    );
  }

  void markProfileComplete(AppUser profile) {
    state = SessionData(
      isAuthenticated: state.isAuthenticated,
      isLoadingProfile: state.isLoadingProfile,
      profile: profile,
      isParentModeUnlocked: state.isParentModeUnlocked,
    );
  }

  Future<void> _onAuthChanged() async {
    final authenticated = client.auth.isAuthenticated;

    // authInfoListenable also fires on silent background token refresh, not
    // just real sign-in/out -- without this guard, every refresh re-enters
    // the loading branch below and app_router.dart force-redirects to
    // /splash mid-navigation. Only react when the authenticated state
    // actually flips.
    if (_lastIsAuthenticated == authenticated) return;
    _lastIsAuthenticated = authenticated;

    if (!authenticated) {
      state = const SessionData(
        isAuthenticated: false,
        isLoadingProfile: false,
        profile: null,
        isParentModeUnlocked: false,
      );
      return;
    }

    state = SessionData(
      isAuthenticated: true,
      isLoadingProfile: true,
      profile: state.profile,
      isParentModeUnlocked: state.isParentModeUnlocked,
    );

    AppUser? profile;
    try {
      profile = await client.appUser.getMyProfile();
    } catch (_) {
      // Treated as "profile not loaded" -- the consent screen is a safe
      // fallback destination and completeProfile is idempotent.
      profile = null;
    }

    state = SessionData(
      isAuthenticated: true,
      isLoadingProfile: false,
      profile: profile,
      isParentModeUnlocked: state.isParentModeUnlocked,
    );
  }
}
