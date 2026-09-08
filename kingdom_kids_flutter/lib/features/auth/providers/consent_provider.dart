import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'consent_provider.g.dart';

@Riverpod()
class ConsentNotifier extends _$ConsentNotifier {
  @override
  /// L'écran commence avec un bouton disponible.
  bool build() => false;

  /// Indique que l'enregistrement du consentement est en cours.
  void startSubmitting() {
    state = true;
  }

  /// Réactive l'écran après la fin ou l'échec de l'enregistrement.
  void stopSubmitting() {
    state = false;
  }
}

/// Provider local : il contrôle uniquement l'état visuel du bouton de consentement.
