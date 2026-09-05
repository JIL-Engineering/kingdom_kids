// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_router.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
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

@ProviderFor(goRouter)
final goRouterProvider = GoRouterProvider._();

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

final class GoRouterProvider
    extends $FunctionalProvider<GoRouter, GoRouter, GoRouter>
    with $Provider<GoRouter> {
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
  GoRouterProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'goRouterProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$goRouterHash();

  @$internal
  @override
  $ProviderElement<GoRouter> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  GoRouter create(Ref ref) {
    return goRouter(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GoRouter value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GoRouter>(value),
    );
  }
}

String _$goRouterHash() => r'59476a9e9b60660e828689a32bb88609cf823cd3';
