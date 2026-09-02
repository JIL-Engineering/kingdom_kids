import 'package:flutter/foundation.dart';
import 'package:kingdom_kids_client/kingdom_kids_client.dart';
import 'package:serverpod_auth_idp_flutter/serverpod_auth_idp_flutter.dart';

import '../../main.dart';

/// Tracks the signed-in user's profile-completion state (has consent been
/// given?) so the router can decide onboarding vs. consent vs. profile
/// picker without hitting the network on every navigation check.
///
/// Fetches [AppUser] once per sign-in/sign-out transition and caches it;
/// [markProfileComplete] updates the cache directly after a successful
/// `completeProfile` call instead of re-fetching.
class SessionState extends ChangeNotifier {
  SessionState() {
    client.auth.authInfoListenable.addListener(_onAuthChanged);
    _onAuthChanged();
  }

  bool _isLoadingProfile = true;
  AppUser? _profile;
  bool _isParentModeUnlocked = false;

  /// null until the first auth check completes; used only to detect a real
  /// sign-in/out transition below.
  bool? _lastIsAuthenticated;

  bool get isAuthenticated => client.auth.isAuthenticated;
  bool get isLoadingProfile => _isLoadingProfile;
  bool get hasCompletedProfile => _profile?.consentGivenAt != null;
  AppUser? get profile => _profile;

  /// Whether the parent has passed the PIN gate this session. Checked by
  /// app_router.dart to guard /settings -- reset on sign-out.
  bool get isParentModeUnlocked => _isParentModeUnlocked;

  /// Called by PinGateScreen after a successful create/verify. This is the
  /// only way /settings becomes reachable.
  void unlockParentMode() {
    _isParentModeUnlocked = true;
    notifyListeners();
  }

  Future<void> _onAuthChanged() async {
    final authenticated = isAuthenticated;

    // authInfoListenable also fires on silent background token refresh, not
    // just real sign-in/out -- without this guard, every refresh re-enters
    // the loading branch below and app_router.dart force-redirects to
    // /splash mid-navigation. Only react when the authenticated state
    // actually flips.
    if (_lastIsAuthenticated == authenticated) return;
    _lastIsAuthenticated = authenticated;

    if (!authenticated) {
      _profile = null;
      _isLoadingProfile = false;
      _isParentModeUnlocked = false;
      notifyListeners();
      return;
    }

    _isLoadingProfile = true;
    notifyListeners();
    try {
      _profile = await client.appUser.getMyProfile();
    } catch (_) {
      // Treated as "profile not loaded" -- the consent screen is a safe
      // fallback destination and completeProfile is idempotent.
      _profile = null;
    } finally {
      _isLoadingProfile = false;
      notifyListeners();
    }
  }

  void markProfileComplete(AppUser profile) {
    _profile = profile;
    notifyListeners();
  }
}

final sessionState = SessionState();
