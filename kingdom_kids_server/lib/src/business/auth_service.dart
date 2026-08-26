import 'package:serverpod/serverpod.dart';
import '../generated/protocol.dart';

class AuthService {
  /// Crée ou met à jour le profil AppUser en appliquant les règles métier du sprint
  static Future<AppUser> createOrUpdateProfile(
    Session session,
    UuidValue authUserId,
    String country,
    String timezone,
    String preferredLanguage,
    bool consentAccepted,
  ) async {
    // Étape 4 du sprint : Validation métier des langues acceptées ('en' ou 'fr')
    final lang = preferredLanguage.trim().toLowerCase();
    if (lang != 'en' && lang != 'fr') {
      throw ArgumentError('La langue préférée doit être "en" ou "fr".');
    }

    if (!consentAccepted) {
      throw ArgumentError(
        'Le consentement parental est requis pour finaliser le profil.',
      );
    }

    // Recherche si le profil existe déjà
    final existing = await AppUser.db.findFirstRow(
      session,
      where: (table) => table.authUserId.equals(authUserId),
    );

    final now = DateTime.now().toUtc();

    if (existing != null) {
      // Mise à jour
      existing.country = country;
      existing.timezone = timezone;
      existing.preferredLanguage = lang;
      existing.consentGivenAt =
          now; // Renseigné uniquement si consentAccepted est vrai
      return await AppUser.db.updateRow(session, existing);
    } else {
      // Étape 3 & 4 du sprint : Création de la ligne AppUser correspondante
      return await AppUser.db.insertRow(
        session,
        AppUser(
          authUserId: authUserId,
          country: country,
          timezone: timezone,
          preferredLanguage: lang,
          createdAt: now,
          consentGivenAt: now, // Exigence de conformité stricte de la spec
        ),
      );
    }
  }
}
