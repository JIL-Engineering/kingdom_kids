import 'package:test/test.dart';
import 'package:serverpod/serverpod.dart';
import 'package:kingdom_kids_server/src/generated/protocol.dart';
import 'package:kingdom_kids_server/src/business/child_profile_service.dart';

void main() {
  group('Tests de conformité - Verrou de Consentement Parental', () {
    late Session session;
    late UuidValue mockParentUuid;

    setUp(() async {
      // Initialisation d'une session de test Serverpod
      session = await Serverpod.instance!.createSession();
      mockParentUuid = UuidValue.fromString('11111111-2222-3333-4444-555555555555');

      // Nettoyage préalable de la table de test pour éviter les doublons
      await AppUser.db.deleteWhere(session, where: (t) => t.authUserId.equals(mockParentUuid));
    });

    tearDown(() async {
      await session.close();
    });

    test('🛑 Doit REFUSER la création d un enfant si le consentement parent est nul', () async {
      // 1. Création d'un parent SANS date de consentement (consentGivenAt = null)
      final parentSansConsentement = AppUser(
        authUserId: mockParentUuid,
        timezone: 'UTC',
        preferredLanguage: 'fr',
        createdAt: DateTime.now().toUtc(),
        consentGivenAt: null, // Verrou actif
      );
      await AppUser.db.insertRow(session, parentSansConsentement);

      // 2. Tentative de création d'un profil enfant (doit lever une StateError)
      expect(
        () async => await ChildProfileService.createChildProfile(
          session,
          mockParentUuid,
          'Mon Enfant Test',
          2020,
          'fr',
          'avatar_1',
        ),
        throwsA(isA<StateError>()),
      );
    });
  });
}
