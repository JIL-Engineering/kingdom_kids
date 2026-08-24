import '../generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class AuthEndpoint extends Endpoint {
  Future<AuthResponse> register(
    Session session,
    String email,
    String password,
    String country,
    String timezone,
    String preferredLanguage,
    bool consentAccepted,
  ) async {
    throw UnimplementedError('Sprint 1');
  }

  Future<AuthResponse> login(
    Session session,
    String email,
    String password,
  ) async {
    throw UnimplementedError('Sprint 1');
  }
  }