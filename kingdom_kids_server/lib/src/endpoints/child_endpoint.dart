import 'package:serverpod/serverpod.dart';
import '../generated/protocol.dart';
import '../business/child_profile_service.dart';

class ChildEndpoint extends Endpoint {
  /// Récupère l'UUID de l'utilisateur connecté ou lève une exception
  UuidValue _getAuthUserId(Session session) {
    final authInfo = session.authenticated;
    if (authInfo == null) {
      throw Exception('Non authentifié.');
    }
    return UuidValue.fromString(authInfo.userIdentifier);
  }

  /// Liste uniquement les enfants du parent connecté
  Future<List<ChildProfile>> listChildren(Session session) async {
    final authUserId = _getAuthUserId(session);

    // On récupère d'abord l'AppUser pour obtenir son ID numérique de base de données
    final parent = await AppUser.db.findFirstRow(
      session,
      where: (table) => table.authUserId.equals(authUserId),
    );
    if (parent == null) return [];

    // SÉCURITÉ : Remplacement de findRows par find
    return await ChildProfile.db.find(
      session,
      where: (table) => table.parentId.equals(parent.id!),
      orderBy: (table) => table.displayName,
    );
  }

  /// Crée un enfant via le service sécurisé
  Future<ChildProfile> createChild(
    Session session,
    String displayName,
    int birthYear,
    String preferredLanguage,
    String avatarId,
  ) async {
    final authUserId = _getAuthUserId(session);

    return ChildProfileService.createChildProfile(
      session,
      authUserId,
      displayName,
      birthYear,
      preferredLanguage,
      avatarId,
    );
  }

  Future<ChildProfile> updateChild(
    Session session,
    int childId,
    String displayName,
    int birthYear,
    String preferredLanguage,
    String avatarId,
  ) async {
    return ChildProfileService.updateChildProfile(
      session,
      _getAuthUserId(session),
      childId,
      displayName,
      birthYear,
      preferredLanguage,
      avatarId,
    );
  }
}
