import 'package:serverpod/serverpod.dart';
import '../generated/protocol.dart';

class ChildProfileService {
  /// Calcule la tranche d'âge selon l'année en cours (2026)
  static AgeBracket _calculateAgeBracket(int birthYear) {
    final currentYear = DateTime.now().year; // Sera 2026
    final age = currentYear - birthYear;

    if (age <= 2) return AgeBracket.toddler;
    if (age <= 5) return AgeBracket.preschool;
    if (age <= 8) return AgeBracket.early_elementary;
    return AgeBracket.preteen;
  }

  /// Crée un profil enfant sécurisé lié à son parent
  static Future<ChildProfile> createChildProfile(
    Session session,
    UuidValue parentAuthUserId,
    String displayName,
    int birthYear,
    String preferredLanguage,
    String avatarId,
  ) async {
    // 1. Validation de la langue (exigence Tâche 2 - Étape 3)
    final lang = preferredLanguage.trim().toLowerCase();
    if (lang != 'en' && lang != 'fr') {
      throw ArgumentError('La langue doit être "en" ou "fr".');
    }

    if (avatarId.trim().isEmpty) {
      throw ArgumentError('L\'identifiant de l\'avatar ne peut pas être vide.');
    }

    // 2. Vérification du verrou de consentement du parent (Exigence stricte de conformité §6)
    final parent = await AppUser.db.findFirstRow(
      session,
      where: (table) => table.authUserId.equals(parentAuthUserId),
    );

    if (parent == null || parent.consentGivenAt == null) {
      throw StateError(
        'Action Interdite : Le consentement parental n\'a pas encore été signé.',
      );
    }

    // 3. Déduction de la tranche d'âge automatisée (Tâche 2 - Étape 2)
    final ageBracket = _calculateAgeBracket(birthYear);

    // 4. Insertion en Base de données
    return await ChildProfile.db.insertRow(
      session,
      ChildProfile(
        parentId:
            parent.id!, // Lien direct vers la clé primaire de l'AppUser parent
        displayName: displayName.trim(),
        birthYear: birthYear,
        ageBracket: ageBracket,
        preferredLanguage: lang,
        avatarId: avatarId,
        pinProtected: false,
        createdAt: DateTime.now().toUtc(),
      ),
    );
  }

  static Future<ChildProfile> updateChildProfile(
    Session session,
    UuidValue parentAuthUserId,
    int childId,
    String displayName,
    int birthYear,
    String preferredLanguage,
    String avatarId,
  ) async {
    final lang = preferredLanguage.trim().toLowerCase();
    if (lang != 'en' && lang != 'fr') {
      throw ArgumentError('La langue doit être "en" ou "fr".');
    }

    final trimmedAvatarId = avatarId.trim();
    if (trimmedAvatarId.isEmpty) {
      throw ArgumentError('L\'identifiant de l\'avatar ne peut pas être vide.');
    }

    final parent = await AppUser.db.findFirstRow(
      session,
      where: (table) => table.authUserId.equals(parentAuthUserId),
    );
    if (parent == null || parent.consentGivenAt == null) {
      throw StateError(
        'Action interdite : le consentement parental est requis.',
      );
    }

    final child = await ChildProfile.db.findFirstRow(
      session,
      where: (table) =>
          table.id.equals(childId) & table.parentId.equals(parent.id!),
    );
    if (child == null) {
      throw StateError(
        'Action interdite : ce profil n\'appartient pas au parent.',
      );
    }

    child.displayName = displayName.trim();
    child.birthYear = birthYear;
    child.ageBracket = _calculateAgeBracket(birthYear);
    child.preferredLanguage = lang;
    child.avatarId = trimmedAvatarId;
    return ChildProfile.db.updateRow(session, child);
  }
}
