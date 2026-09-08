import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'pin_flow_provider.g.dart';

enum PinFlowStep { create, verify }

class PinFlowState {
  /// Représente l'étape, le chargement et l'erreur visibles dans l'écran PIN.
  const PinFlowState({
    required this.step,
    required this.isSubmitting,
    this.errorText,
  });

  final PinFlowStep step;
  final bool isSubmitting;
  final String? errorText;

  /// Retourne un nouvel état en conservant les valeurs non modifiées.
  PinFlowState copyWith({
    PinFlowStep? step,
    bool? isSubmitting,
    String? errorText,
    bool clearError = false,
  }) {
    return PinFlowState(
      step: step ?? this.step,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      errorText: clearError ? null : errorText ?? this.errorText,
    );
  }
}

@Riverpod()
class PinFlowNotifier extends _$PinFlowNotifier {
  @override
  /// Définit la valeur par défaut avant l'initialisation de l'écran.
  PinFlowState build() {
    return const PinFlowState(
      step: PinFlowStep.verify,
      isSubmitting: false,
    );
  }

  /// Synchronise le provider avec l'étape calculée à l'ouverture de l'écran.
  /// Prépare l'étape initiale fournie par le contrôle de la route PIN.
  void initialize(PinFlowStep step) {
    state = PinFlowState(step: step, isSubmitting: false);
  }

  /// Affiche une erreur de validation ou de vérification.
  void showError(String message) {
    state = state.copyWith(errorText: message);
  }

  /// Efface l'erreur avant de lancer une nouvelle tentative.
  void clearError() {
    state = state.copyWith(clearError: true);
  }

  /// Active ou désactive l'indicateur de sauvegarde du bouton.
  void setSubmitting(bool value) {
    state = state.copyWith(isSubmitting: value);
  }

  /// Après validation de l'ancien PIN, l'écran passe à la création du nouveau.
  void startCreating() {
    state = state.copyWith(
      step: PinFlowStep.create,
      isSubmitting: false,
      clearError: true,
    );
  }
}

/// Provider temporaire du flux PIN, détruit après la fermeture de l'écran.
