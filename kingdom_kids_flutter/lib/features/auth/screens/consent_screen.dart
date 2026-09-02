import 'package:go_router/go_router.dart';
import 'package:kingdom_kids_flutter/features/auth/screens/onboarding_screen.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const OnboardingScreen(),
      ),
    ],
  );
}