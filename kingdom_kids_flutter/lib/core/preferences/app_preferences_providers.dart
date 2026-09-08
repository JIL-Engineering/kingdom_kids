import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_preferences_providers.g.dart';

/// Gère la langue choisie dans l'application pendant la session en cours.
/// Cette préférence reste locale pour le moment : aucun appel backend n'est
/// effectué et la valeur revient à `en` au redémarrage de l'application.
@Riverpod()
class AppLanguageNotifier extends _$AppLanguageNotifier {
  @override
  String build() => 'en';

  /// Met à jour la langue et notifie automatiquement les widgets abonnés.
  void setLanguage(String language) {
    state = language;
  }
}

/// Gère le mode clair/sombre pendant la session en cours.
/// La préférence est locale et n'est pas encore sauvegardée sur le backend.
@Riverpod()
class AppDarkModeNotifier extends _$AppDarkModeNotifier {
  @override
  bool build() => false;

  /// Met à jour le thème choisi et reconstruit les widgets abonnés.
  void setDarkMode(bool enabled) {
    state = enabled;
  }
}
