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

  bool get isAuthenticated => client.auth.isAuthenticated;
  bool get isLoadingProfile => _isLoadingProfile;
  bool get hasCompletedProfile => _profile?.consentGivenAt != null;
  AppUser? get profile => _profile;

  Future<void> _onAuthChanged() async {
    if (!isAuthenticated) {
      _profile = null;
      _isLoadingProfile = false;
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
