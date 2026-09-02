import 'package:flutter/material.dart';
import 'package:kingdom_kids_flutter/features/auth/screens/onboarding_screen.dart';

class GoRouter extends StatelessWidget {
  const GoRouter({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Kingdom Kids',
      home: OnboardingScreen(),
    );
  }
}