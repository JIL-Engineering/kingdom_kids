import 'package:serverpod/serverpod.dart';
import '../generated/protocol.dart';

class ParentProfileEndpoint extends Endpoint {
  
  Future<AppUser> completeParentProfile(Session session) async {
    // 1. Récupération de l'UUID (UuidValue) au lieu d'un int
    final authUserId = _requireAuthenticatedUserId(session);
    
    final existing = await AppUser.db.findFirstRow(
      session,
      where: (table) => table.authUserId.equals(authUserId),
    );
    
    if (existing != null) {
      return existing;
    }

    // 2. Création de l'utilisateur sans le paramètre 'email' s'il n'est plus dans le modèle
    return AppUser.db.insertRow(
      session,
      AppUser(
        authUserId: authUserId,
        timezone: 'UTC',
        preferredLanguage: 'en',
        createdAt: DateTime.now().toUtc(),
      ),
    );
  }

  Future<AppUser> giveConsent(Session session) async {
    final authUserId = _requireAuthenticatedUserId(session);
    final parent = await AppUser.db.findFirstRow(
      session,
      where: (table) => table.authUserId.equals(authUserId),
    );
    if (parent == null) {
      throw StateError('Parent profile not found.');
    }

    parent.consentGivenAt = DateTime.now().toUtc();
    return AppUser.db.updateRow(session, parent);
  }

  // 3. Fonction utilitaire mise à jour pour renvoyer un UuidValue conforme
  UuidValue _requireAuthenticatedUserId(Session session) {
    final authenticationInfo = session.authenticated;
    if (authenticationInfo == null) {
      throw StateError('Unauthorized: authentication required.');
    }
    
    try {
      // Conversion de l'identifiant texte en UuidValue conforme
      return UuidValue.fromString(authenticationInfo.userIdentifier);
    } catch (e) {
      throw StateError('Unauthorized: authenticated user ID is not a valid UUID.');
    }
  }
}
