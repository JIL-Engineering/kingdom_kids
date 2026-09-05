import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:go_router/go_router.dart';

import '../../../core/auth/session_state.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/widgets/kingdom_button.dart';
import '../../../main.dart';

/// Matches kingdomkidsdesignmockupui/images/screen11.png.
///
/// Required before any child profile can be created (docs/03_technical_spec.md
/// §6) — consentAccepted must be explicitly true, not implied by signup.
class ConsentScreen extends ConsumerStatefulWidget {
  const ConsentScreen({super.key});

  @override
  ConsumerState<ConsentScreen> createState() => _ConsentScreenState();
}

class _ConsentScreenState extends ConsumerState<ConsentScreen> {
  bool _isSubmitting = false;

  Future<void> _acceptAndContinue() async {
    setState(() => _isSubmitting = true);
    try {
      final locale = Localizations.localeOf(context);
      final preferredLanguage = locale.languageCode == 'fr' ? 'fr' : 'en';
      // Real IANA identifier (e.g. "America/New_York"), required for the
      // spec's timezone-aware streak/daily-reset calculations to actually
      // work (docs/03_technical_spec.md) -- not just a display name.
      final timezone = await FlutterTimezone.getLocalTimezone();
      final country = locale.countryCode ?? '';

      final profile = await client.appUser.completeProfile(
        country,
        timezone,
        preferredLanguage,
        true,
      );
      ref.read(sessionProvider.notifier).markProfileComplete(profile);
      if (mounted) context.go('/profiles');
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Could not save consent: $e')),
        );
      }
    } finally {
      if (mounted) setState(() => _isSubmitting = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.creamDeep,
      appBar: AppBar(
        backgroundColor: AppColors.creamDeep,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.castle_outlined, size: 20),
            const SizedBox(width: 8),
            Text('Kingdom Kids', style: AppTextStyles.headingMedium),
          ],
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Icon(
                  Icons.shield_outlined,
                  size: 40,
                  color: AppColors.textPrimary,
                ),
                const SizedBox(height: 16),
                Text(
                  "Your Child's Privacy & Safety",
                  textAlign: TextAlign.center,
                  style: AppTextStyles.displayMedium,
                ),
                const SizedBox(height: 12),
                Text(
                  "We take your family's trust seriously. Here is what you "
                  'need to know before we begin.',
                  textAlign: TextAlign.center,
                  style: AppTextStyles.bodyMedium,
                ),
                const SizedBox(height: 24),
                const _ConsentPoint(
                  icon: Icons.storage_outlined,
                  iconBg: AppColors.amberPale,
                  title: 'What We Collect',
                  body:
                      'We only collect basic progress data, such as reading '
                      'milestones, completed books, and time spent in '
                      'stories.',
                ),
                const SizedBox(height: 20),
                const _ConsentPoint(
                  icon: Icons.auto_awesome_outlined,
                  iconBg: Color(0xFFDCE8FA),
                  title: 'Why We Collect It',
                  body:
                      "To personalize your child's journey, celebrate their "
                      'achievements, and suggest the next best adventure in '
                      'their Storybook.',
                ),
                const SizedBox(height: 20),
                const _ConsentPoint(
                  icon: Icons.block,
                  iconBg: Color(0xFFFBDADA),
                  title: 'Our Commitment',
                  body:
                      'We will never show ads to your child, and we will '
                      'never sell or share their data with third parties.',
                ),
                const SizedBox(height: 24),
                const Divider(color: AppColors.borderLight),
                const SizedBox(height: 16),
                KingdomButton(
                  label: 'I Consent and Continue',
                  isLoading: _isSubmitting,
                  onPressed: _acceptAndContinue,
                ),
                const SizedBox(height: 12),
                KingdomButton(
                  label: 'Read Full Privacy Policy',
                  style: KingdomButtonStyle.outlined,
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Privacy policy coming soon.'),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ConsentPoint extends StatelessWidget {
  const _ConsentPoint({
    required this.icon,
    required this.iconBg,
    required this.title,
    required this.body,
  });

  final IconData icon;
  final Color iconBg;
  final String title;
  final String body;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 20,
          backgroundColor: iconBg,
          child: Icon(icon, size: 20, color: AppColors.textPrimary),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: AppTextStyles.headingMedium),
              const SizedBox(height: 4),
              Text(body, style: AppTextStyles.bodyMedium),
            ],
          ),
        ),
      ],
    );
  }
}
