// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_preferences_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Gère la langue choisie dans l'application pendant la session en cours.
/// Cette préférence reste locale pour le moment : aucun appel backend n'est
/// effectué et la valeur revient à `en` au redémarrage de l'application.

@ProviderFor(AppLanguageNotifier)
final appLanguageProvider = AppLanguageNotifierProvider._();

/// Gère la langue choisie dans l'application pendant la session en cours.
/// Cette préférence reste locale pour le moment : aucun appel backend n'est
/// effectué et la valeur revient à `en` au redémarrage de l'application.
final class AppLanguageNotifierProvider
    extends $NotifierProvider<AppLanguageNotifier, String> {
  /// Gère la langue choisie dans l'application pendant la session en cours.
  /// Cette préférence reste locale pour le moment : aucun appel backend n'est
  /// effectué et la valeur revient à `en` au redémarrage de l'application.
  AppLanguageNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'appLanguageProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$appLanguageNotifierHash();

  @$internal
  @override
  AppLanguageNotifier create() => AppLanguageNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String>(value),
    );
  }
}

String _$appLanguageNotifierHash() =>
    r'f973e9b3a2373a33b5c6a0ea479861f169f61f5a';

/// Gère la langue choisie dans l'application pendant la session en cours.
/// Cette préférence reste locale pour le moment : aucun appel backend n'est
/// effectué et la valeur revient à `en` au redémarrage de l'application.

abstract class _$AppLanguageNotifier extends $Notifier<String> {
  String build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<String, String>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<String, String>,
              String,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

/// Gère le mode clair/sombre pendant la session en cours.
/// La préférence est locale et n'est pas encore sauvegardée sur le backend.

@ProviderFor(AppDarkModeNotifier)
final appDarkModeProvider = AppDarkModeNotifierProvider._();

/// Gère le mode clair/sombre pendant la session en cours.
/// La préférence est locale et n'est pas encore sauvegardée sur le backend.
final class AppDarkModeNotifierProvider
    extends $NotifierProvider<AppDarkModeNotifier, bool> {
  /// Gère le mode clair/sombre pendant la session en cours.
  /// La préférence est locale et n'est pas encore sauvegardée sur le backend.
  AppDarkModeNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'appDarkModeProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$appDarkModeNotifierHash();

  @$internal
  @override
  AppDarkModeNotifier create() => AppDarkModeNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$appDarkModeNotifierHash() =>
    r'6980de0da43a2411e2af8aa908dbbc6839e1deae';

/// Gère le mode clair/sombre pendant la session en cours.
/// La préférence est locale et n'est pas encore sauvegardée sur le backend.

abstract class _$AppDarkModeNotifier extends $Notifier<bool> {
  bool build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<bool, bool>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<bool, bool>,
              bool,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
