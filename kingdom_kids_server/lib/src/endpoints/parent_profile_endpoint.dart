import 'package:serverpod/serverpod.dart';

import '../generated/protocol.dart';

class ParentProfileEndpoint extends Endpoint {
  Future<AppUser> completeParentProfile(Session session, String email) async {
    final authUserId = _requireAuthenticatedUserId(session);
    final existing = await AppUser.db.findFirstRow(
      session,
      where: (table) => table.authUserId.equals(authUserId),
    );
    if (existing != null) {
      return existing;
    }

    final normalizedEmail = email.trim().toLowerCase();
    if (normalizedEmail.isEmpty) {
      throw ArgumentError.value(email, 'email');
    }
    return AppUser.db.insertRow(
      session,
      AppUser(
        authUserId: authUserId,
        email: normalizedEmail,
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

  int _requireAuthenticatedUserId(Session session) {
    final authenticationInfo = session.authenticated;
    if (authenticationInfo == null) {
      throw StateError('Unauthorized: authentication required.');
    }
    final authUserId = int.tryParse(authenticationInfo.userIdentifier);
    if (authUserId == null) {
      throw StateError('Unauthorized: authenticated user ID is not numeric.');
    }
    return authUserId;
  }
}
