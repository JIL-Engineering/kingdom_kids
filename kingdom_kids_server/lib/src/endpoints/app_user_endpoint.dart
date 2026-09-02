import 'package:serverpod/serverpod.dart';
import '../generated/protocol.dart';
import '../business/auth_service.dart';

class AppUserEndpoint extends Endpoint {
  /// Toutes les méthodes de cet endpoint nécessitent une session
  /// authentifiée -- Serverpod refuse l'appel automatiquement sinon.
  @override
  bool get requireLogin => true;

  UuidValue _authUserId(Session session) {
    final identifier = session.authenticated!.userIdentifier;
    try {
      return UuidValue.fromString(identifier);
    } catch (e) {
      throw Exception('Format d\'identifiant utilisateur (UUID) invalide.');
    }
  }

  /// Profil de l'utilisateur connecté, ou null si pas encore complété
  /// (avant le premier consentement) -- permet au client de sauter
  /// l'onboarding/consentement pour un utilisateur qui revient.
  Future<AppUser?> getMyProfile(Session session) {
    return AuthService.getMyProfile(session, _authUserId(session));
  }

  /// Étape 3 du sprint : Méthode completeProfile appelée juste après l'inscription
  Future<AppUser> completeProfile(
    Session session,
    String country,
    String timezone,
    String preferredLanguage,
    bool consentAccepted,
  ) {
    return AuthService.createOrUpdateProfile(
      session,
      _authUserId(session),
      country,
      timezone,
      preferredLanguage,
      consentAccepted,
    );
  }

  /// Indique si un PIN parental a déjà été configuré.
  Future<bool> hasParentPin(Session session) {
    return AuthService.hasParentPin(session, _authUserId(session));
  }

  /// Définit ou change le PIN qui protège le Mode Parent.
  Future<void> setParentPin(Session session, String pin) {
    return AuthService.setParentPin(session, _authUserId(session), pin);
  }

  /// Vérifie le PIN parental. Lève une exception si aucun PIN n'a encore
  /// été configuré -- l'appelant doit alors proposer d'en créer un.
  Future<bool> verifyParentPin(Session session, String pin) {
    return AuthService.verifyParentPin(session, _authUserId(session), pin);
  }
}
