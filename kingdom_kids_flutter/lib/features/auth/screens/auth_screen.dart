import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:serverpod_auth_idp_flutter/serverpod_auth_idp_flutter.dart';

import '../../../core/theme/app_colors.dart';
import '../../../main.dart';

/// Wraps Serverpod's own [SignInWidget] (handles the full email sign-up /
/// sign-in / verification-code flow) with the app's background and routes
/// to the consent step once authenticated.
class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cream,
      body: Center(
        child: SignInWidget(
          client: client,
          onAuthenticated: () => context.go('/consent'),
          onError: (error) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Authentication failed: $error')),
            );
          },
        ),
      ),
    );
  }
}
