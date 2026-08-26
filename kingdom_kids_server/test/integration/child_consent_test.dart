import 'package:test/test.dart';
import 'package:serverpod/serverpod.dart';
import 'package:kingdom_kids_server/src/generated/protocol.dart';
import 'package:kingdom_kids_server/src/business/child_profile_service.dart';

import 'test_tools/serverpod_test_tools.dart';

void main() {
  withServerpod('Tests de conformité - Verrou de Consentement Parental', (
    sessionBuilder,
    _,
  ) {
    final session = sessionBuilder.build();
    final mockParentUuid = UuidValue.fromString(
      '11111111-2222-3333-4444-555555555555',
    );

    test(
      '🛑 Doit REFUSER la création d un enfant si le consentement parent est nul',
      () async {
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
        await expectLater(
          ChildProfileService.createChildProfile(
            session,
            mockParentUuid,
            'Mon Enfant Test',
            2020,
            'fr',
            'avatar_1',
          ),
          throwsA(isA<StateError>()),
        );
      },
    );
  });
}
