// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session_state.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Tracks the signed-in user's profile-completion state (has consent been
/// given?) so the router can decide onboarding vs. consent vs. profile
/// picker without hitting the network on every navigation check.
///
/// Fetches [AppUser] once per sign-in/sign-out transition and caches it;
/// [markProfileComplete] updates the cache directly after a successful
/// `completeProfile` call instead of re-fetching.

@ProviderFor(SessionNotifier)
final sessionProvider = SessionNotifierProvider._();

/// Tracks the signed-in user's profile-completion state (has consent been
/// given?) so the router can decide onboarding vs. consent vs. profile
/// picker without hitting the network on every navigation check.
///
/// Fetches [AppUser] once per sign-in/sign-out transition and caches it;
/// [markProfileComplete] updates the cache directly after a successful
/// `completeProfile` call instead of re-fetching.
final class SessionNotifierProvider
    extends $NotifierProvider<SessionNotifier, SessionData> {
  /// Tracks the signed-in user's profile-completion state (has consent been
  /// given?) so the router can decide onboarding vs. consent vs. profile
  /// picker without hitting the network on every navigation check.
  ///
  /// Fetches [AppUser] once per sign-in/sign-out transition and caches it;
  /// [markProfileComplete] updates the cache directly after a successful
  /// `completeProfile` call instead of re-fetching.
  SessionNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'sessionProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$sessionNotifierHash();

  @$internal
  @override
  SessionNotifier create() => SessionNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SessionData value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SessionData>(value),
    );
  }
}

String _$sessionNotifierHash() => r'5fb05304219a332b2bf24209c58789f1a1d30b97';

/// Tracks the signed-in user's profile-completion state (has consent been
/// given?) so the router can decide onboarding vs. consent vs. profile
/// picker without hitting the network on every navigation check.
///
/// Fetches [AppUser] once per sign-in/sign-out transition and caches it;
/// [markProfileComplete] updates the cache directly after a successful
/// `completeProfile` call instead of re-fetching.

abstract class _$SessionNotifier extends $Notifier<SessionData> {
  SessionData build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<SessionData, SessionData>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<SessionData, SessionData>,
              SessionData,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
