import 'package:kingdom_kids_client/kingdom_kids_client.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'child_form_provider.g.dart';

class ChildFormState {
  /// Regroupe toutes les valeurs saisies et l'état de sauvegarde du formulaire.
  const ChildFormState({
    required this.birthYear,
    required this.preferredLanguage,
    required this.avatarId,
    required this.isSubmitting,
  });

  final int? birthYear;
  final String preferredLanguage;
  final String avatarId;
  final bool isSubmitting;

  /// Crée une nouvelle copie en ne modifiant que les valeurs fournies.
  ChildFormState copyWith({
    int? birthYear,
    String? preferredLanguage,
    String? avatarId,
    bool? isSubmitting,
    bool clearBirthYear = false,
  }) {
    return ChildFormState(
      birthYear: clearBirthYear ? null : birthYear ?? this.birthYear,
      preferredLanguage: preferredLanguage ?? this.preferredLanguage,
      avatarId: avatarId ?? this.avatarId,
      isSubmitting: isSubmitting ?? this.isSubmitting,
    );
  }
}

@Riverpod()
class ChildFormNotifier extends _$ChildFormNotifier {
  @override
  /// Fournit l'état initial utilisé lors de la création d'un enfant.
  ChildFormState build() {
    return const ChildFormState(
      birthYear: null,
      preferredLanguage: 'en',
      avatarId: 'avatar_star',
      isSubmitting: false,
    );
  }

  /// Charge les valeurs existantes pour l'édition ou les valeurs par défaut.
  /// Initialise les valeurs d'édition ou les valeurs par défaut de création.
  void initialize(ChildProfile? existingChild) {
    state = ChildFormState(
      birthYear: existingChild?.birthYear,
      preferredLanguage: existingChild?.preferredLanguage ?? 'en',
      avatarId: existingChild?.avatarId ?? 'avatar_star',
      isSubmitting: false,
    );
  }

  /// Met à jour l'année choisie dans le formulaire.
  void setBirthYear(int? value) {
    state = state.copyWith(birthYear: value, clearBirthYear: value == null);
  }

  /// Met à jour la langue choisie pour le profil de l'enfant.
  void setPreferredLanguage(String value) {
    state = state.copyWith(preferredLanguage: value);
  }

  /// Met à jour l'identifiant de l'avatar sélectionné.
  void setAvatar(String value) {
    state = state.copyWith(avatarId: value);
  }

  /// Indique à l'interface qu'une sauvegarde est en cours ou terminée.
  void setSubmitting(bool value) {
    state = state.copyWith(isSubmitting: value);
  }
}

/// Provider temporaire : il est détruit quand le formulaire n'est plus utilisé.


