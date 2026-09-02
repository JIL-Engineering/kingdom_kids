import 'package:bcrypt/bcrypt.dart';
import 'package:serverpod/serverpod.dart';
import '../generated/protocol.dart';

final _pinPattern = RegExp(r'^\d{4,6}$');

class AuthService {
  /// Renvoie le profil AppUser de l'utilisateur authentifié, ou null si le
  /// profil n'a pas encore été complété (avant le premier consentement).
  static Future<AppUser?> getMyProfile(
    Session session,
    UuidValue authUserId,
  ) {
    return AppUser.db.findFirstRow(
      session,
      where: (table) => table.authUserId.equals(authUserId),
    );
  }

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
      // Mise à jour : ne pas ré-écraser la date de consentement d'origine
      // si le consentement a déjà été donné auparavant.
      existing.country = country;
      existing.timezone = timezone;
      existing.preferredLanguage = lang;
      existing.consentGivenAt ??= now;
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

  /// Définit (ou change) le PIN parental. Stocke uniquement un hash bcrypt,
  /// jamais le PIN en clair.
  static Future<void> setParentPin(
    Session session,
    UuidValue authUserId,
    String pin,
  ) async {
    if (!_pinPattern.hasMatch(pin)) {
      throw ArgumentError('Le PIN doit comporter entre 4 et 6 chiffres.');
    }

    final user = await AppUser.db.findFirstRow(
      session,
      where: (table) => table.authUserId.equals(authUserId),
    );
    if (user == null) {
      throw StateError('Profil introuvable : complétez le profil d\'abord.');
    }

    user.parentPinHash = BCrypt.hashpw(pin, BCrypt.gensalt());
    await AppUser.db.updateRow(session, user);
  }

  /// Indique si un PIN parental a déjà été configuré, sans jamais exposer
  /// le hash lui-même (parentPinHash est scope=serverOnly sur le modèle).
  static Future<bool> hasParentPin(
    Session session,
    UuidValue authUserId,
  ) async {
    final user = await AppUser.db.findFirstRow(
      session,
      where: (table) => table.authUserId.equals(authUserId),
    );
    return user?.parentPinHash != null;
  }

  /// Vérifie le PIN parental fourni contre le hash stocké.
  ///
  /// Lève un [StateError] si aucun PIN n'a encore été défini, pour que
  /// l'appelant puisse distinguer « mauvais PIN » de « pas de PIN configuré »
  /// et rediriger vers l'écran de configuration au lieu d'afficher une
  /// simple erreur.
  static Future<bool> verifyParentPin(
    Session session,
    UuidValue authUserId,
    String pin,
  ) async {
    final user = await AppUser.db.findFirstRow(
      session,
      where: (table) => table.authUserId.equals(authUserId),
    );
    final hash = user?.parentPinHash;
    if (hash == null) {
      throw StateError('Aucun PIN parental n\'est configuré.');
    }

    return BCrypt.checkpw(pin, hash);
  }
}
