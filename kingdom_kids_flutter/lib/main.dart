import 'package:kingdom_kids_client/kingdom_kids_client.dart';
import 'package:flutter/material.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';
import 'package:serverpod_auth_idp_flutter/serverpod_auth_idp_flutter.dart';

import 'core/routing/app_router.dart';
import 'core/theme/app_theme.dart';

/// Global client used to talk to the server from anywhere in the app.
late final Client client;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // When running on a physical device, set the server URL to your machine's
  // IP address, e.g. `flutter run --dart-define=SERVER_URL=https://api.example.com/`.
  // Otherwise it's read from assets/config.json, defaulting to localhost:8080.
  final serverUrl = await getServerUrl();

  client = Client(serverUrl)
    ..connectivityMonitor = FlutterConnectivityMonitor()
    ..authSessionManager = FlutterAuthSessionManager();

  client.auth.initialize();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Kingdom Kids',
      theme: AppTheme.light,
      routerConfig: appRouter,
    );
  }
}
