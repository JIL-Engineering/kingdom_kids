import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/widgets/kingdom_button.dart';

/// Matches kingdomkidsdesignmockupui/images/screen10.png.
class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cream,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              const Spacer(),
              const Icon(
                Icons.castle_outlined,
                size: 48,
                color: AppColors.textPrimary,
              ),
              const SizedBox(height: 16),
              Text('Kingdom Kids', style: AppTextStyles.appName),
              const SizedBox(height: 8),
              Text(
                'Start Your Family Journey',
                textAlign: TextAlign.center,
                style: AppTextStyles.displayMedium,
              ),
              const SizedBox(height: 12),
              Text(
                'A safe, engaging space for Christian discipleship. Explore '
                'interactive stories, track spiritual milestones, and '
                'nurture a lifelong faith together as a family.',
                textAlign: TextAlign.center,
                style: AppTextStyles.bodyMedium,
              ),
              const Spacer(),
              KingdomButton(
                label: 'Create Parent Account',
                icon: const Icon(
                  Icons.arrow_forward,
                  size: 18,
                  color: AppColors.white,
                ),
                onPressed: () => context.go('/auth'),
              ),
              const SizedBox(height: 16),
              TextButton(
                onPressed: () => context.go('/auth'),
                child: Text.rich(
                  TextSpan(
                    text: 'Already on the journey? ',
                    style: AppTextStyles.bodyMedium,
                    children: [
                      TextSpan(
                        text: 'Sign in',
                        style: AppTextStyles.bodyMedium.copyWith(
                          color: AppColors.textPrimary,
                          fontWeight: FontWeight.w700,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}
