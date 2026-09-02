import 'package:flutter_test/flutter_test.dart';
import 'package:kingdom_kids_client/kingdom_kids_client.dart';
import 'package:serverpod_auth_idp_flutter/serverpod_auth_idp_flutter.dart';

import 'package:kingdom_kids_flutter/main.dart';

void main() {
  testWidgets('MyApp builds and shows the onboarding screen', (tester) async {
    // The widget test bypasses main(), so the global client used by
    // appRouter's auth-based redirect needs to be set up here instead.
    client = Client('http://localhost:8080/')
      ..authSessionManager = FlutterAuthSessionManager();

    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();

    expect(find.text('Kingdom Kids'), findsOneWidget);
  });
}
