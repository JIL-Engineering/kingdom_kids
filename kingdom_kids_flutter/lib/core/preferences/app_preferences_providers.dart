import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppLanguageNotifier extends Notifier<String> {
  @override
  String build() => 'en';

  void setLanguage(String language) {
    state = language;
  }
}

final appLanguageProvider = NotifierProvider<AppLanguageNotifier, String>(
  AppLanguageNotifier.new,
);

class AppDarkModeNotifier extends Notifier<bool> {
  @override
  bool build() => false;

  void setDarkMode(bool enabled) {
    state = enabled;
  }
}

final appDarkModeProvider = NotifierProvider<AppDarkModeNotifier, bool>(
  AppDarkModeNotifier.new,
);
