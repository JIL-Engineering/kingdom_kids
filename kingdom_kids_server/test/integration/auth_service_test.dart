import 'package:test/test.dart';
import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_idp_server/core.dart';
import 'package:kingdom_kids_server/src/business/auth_service.dart';

import 'test_tools/serverpod_test_tools.dart';

Future<UuidValue> _createAuthUser(dynamic session) async {
  final authUser = await AuthUser.db.insertRow(
    session,
    AuthUser(scopeNames: {}),
  );
  return authUser.id!;
}

void main() {
  withServerpod('Tests unitaires - AuthService', (sessionBuilder, _) {
    final session = sessionBuilder.build();

    group('PIN parental', () {
      test(
        '🔒 verifyParentPin léve une erreur si aucun PIN n\'est configuré',
        () async {
          final authUserId = await _createAuthUser(session);
          await AuthService.createOrUpdateProfile(
            session,
            authUserId,
            '',
            'UTC',
            'en',
            true,
          );

          await expectLater(
            AuthService.verifyParentPin(session, authUserId, '1234'),
            throwsA(isA<StateError>()),
          );
        },
      );

      test(
        '🔒 setParentPin puis verifyParentPin avec le bon PIN renvoie true',
        () async {
          final authUserId = await _createAuthUser(session);
          await AuthService.createOrUpdateProfile(
            session,
            authUserId,
            '',
            'UTC',
            'en',
            true,
          );

          await AuthService.setParentPin(session, authUserId, '4321');
          final isCorrect = await AuthService.verifyParentPin(
            session,
            authUserId,
            '4321',
          );

          expect(isCorrect, isTrue);
        },
      );

      test(
        '🔒 verifyParentPin avec un mauvais PIN renvoie false',
        () async {
          final authUserId = await _createAuthUser(session);
          await AuthService.createOrUpdateProfile(
            session,
            authUserId,
            '',
            'UTC',
            'en',
            true,
          );

          await AuthService.setParentPin(session, authUserId, '4321');
          final isCorrect = await AuthService.verifyParentPin(
            session,
            authUserId,
            '0000',
          );

          expect(isCorrect, isFalse);
        },
      );

      test(
        '🔒 setParentPin rejette un PIN qui n\'est pas 4 à 6 chiffres',
        () async {
          final authUserId = await _createAuthUser(session);
          await AuthService.createOrUpdateProfile(
            session,
            authUserId,
            '',
            'UTC',
            'en',
            true,
          );

          await expectLater(
            AuthService.setParentPin(session, authUserId, '123'),
            throwsA(isA<ArgumentError>()),
          );
        },
      );
    });

    test(
      '📅 createOrUpdateProfile ne réécrit pas la date de consentement d\'origine',
      () async {
        final authUserId = await _createAuthUser(session);
        final first = await AuthService.createOrUpdateProfile(
          session,
          authUserId,
          '',
          'UTC',
          'en',
          true,
        );
        final originalConsentDate = first.consentGivenAt;

        await Future<void>.delayed(const Duration(milliseconds: 5));
        final second = await AuthService.createOrUpdateProfile(
          session,
          authUserId,
          'CM',
          'Africa/Douala',
          'fr',
          true,
        );

        expect(second.consentGivenAt, equals(originalConsentDate));
        expect(second.country, equals('CM'));
        expect(second.timezone, equals('Africa/Douala'));
      },
    );
  });
}
