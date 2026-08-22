import 'package:flutter_test/flutter_test.dart';

import 'package:kingdom_kids_flutter/main.dart';

void main() {
  testWidgets('MyApp builds and shows the app bar title', (tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Serverpod Example'), findsOneWidget);
  });
}
