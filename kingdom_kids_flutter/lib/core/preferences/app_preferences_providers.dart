import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Gère la langue choisie dans l'application pendant la session en cours.
/// Cette préférence reste locale pour le moment : aucun appel backend n'est
/// effectué et la valeur revient à `en` au redémarrage de l'application.
class AppLanguageNotifier extends Notifier<String> {
  @override
  String build() => 'en';

  /// Met à jour la langue et notifie automatiquement les widgets abonnés.
  void setLanguage(String language) {
    state = language;
  }
}

/// Provider partagé de la langue actuelle de l'application.
final appLanguageProvider = NotifierProvider<AppLanguageNotifier, String>(
  AppLanguageNotifier.new,
);

/// Gère le mode clair/sombre pendant la session en cours.
/// La préférence est locale et n'est pas encore sauvegardée sur le backend.
class AppDarkModeNotifier extends Notifier<bool> {
  @override
  bool build() => false;

  /// Met à jour le thème choisi et reconstruit les widgets abonnés.
  void setDarkMode(bool enabled) {
    state = enabled;
  }
}

/// Provider partagé de l'état du mode sombre.
final appDarkModeProvider = NotifierProvider<AppDarkModeNotifier, bool>(
  AppDarkModeNotifier.new,
);
