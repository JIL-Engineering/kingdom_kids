import 'package:serverpod/serverpod.dart';
import '../generated/protocol.dart';
import '../business/auth_service.dart';

class AuthEndpoint extends Endpoint {
  
  /// Étape 3 du sprint : Méthode completeProfile appelée juste après l'inscription
  Future<AppUser> completeProfile(
    Session session,
    String country,
    String timezone,
    String preferredLanguage,
    bool consentAccepted,
  ) async {
    // 1. Récupération de l'UUID de la session utilisateur d'authentification IDP
    final authInfo = session.authenticated;
    if (authInfo == null) {
      throw Exception('Non authentifié : impossible de compléter le profil.');
    }

    UuidValue authUserId;
    try {
      authUserId = UuidValue.fromString(authInfo.userIdentifier);
    } catch (e) {
      throw Exception('Format d\'identifiant utilisateur (UUID) invalide.');
    }

    // 2. Délégation de la logique et des validations au AuthService (Étape 4)
    return AuthService.createOrUpdateProfile(
      session,
      authUserId,
      country,
      timezone,
      preferredLanguage,
      consentAccepted,
    );
  }
}
