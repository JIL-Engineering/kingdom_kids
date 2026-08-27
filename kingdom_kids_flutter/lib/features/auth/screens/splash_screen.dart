import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';

/// Shown briefly while the router determines whether a signed-in user has
/// already completed their profile (avoids a flash of onboarding/consent
/// before redirecting to the right place).
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.cream,
      body: Center(
        child: CircularProgressIndicator(color: AppColors.navy),
      ),
    );
  }
}
