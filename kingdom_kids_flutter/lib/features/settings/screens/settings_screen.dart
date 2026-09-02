import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:serverpod_auth_idp_flutter/serverpod_auth_idp_flutter.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../main.dart';

/// Matches kingdomkidsdesignmockupui/images/screen9.png. Only reachable
/// after PinGateScreen (see app_router.dart) -- this screen itself assumes
/// the parent is already verified.
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cream,
      appBar: AppBar(
        backgroundColor: AppColors.cream,
        title: Text('Settings', style: AppTextStyles.headingMedium),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            _SectionLabel('PARENTAL SECURITY'),
            _SettingsTile(
              icon: Icons.lock_outline,
              title: 'Manage Parental PIN',
              subtitle: 'Gate parent-only actions',
              onTap: () => context.push('/settings/pin-gate?change=true'),
            ),
            const SizedBox(height: 24),
            _SectionLabel('ACCOUNT'),
            _SettingsTile(
              icon: Icons.logout,
              title: 'Sign Out',
              onTap: () async {
                await client.auth.signOutDevice();
                if (context.mounted) context.go('/onboarding');
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _SectionLabel extends StatelessWidget {
  const _SectionLabel(this.label);

  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 4, bottom: 8),
      child: Text(label, style: AppTextStyles.fieldLabel),
    );
  }
}

class _SettingsTile extends StatelessWidget {
  const _SettingsTile({
    required this.icon,
    required this.title,
    this.subtitle,
    required this.onTap,
  });

  final IconData icon;
  final String title;
  final String? subtitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: ListTile(
        onTap: onTap,
        leading: CircleAvatar(
          backgroundColor: AppColors.creamDeep,
          child: Icon(icon, color: AppColors.textPrimary),
        ),
        title: Text(title, style: AppTextStyles.headingMedium),
        subtitle: subtitle != null
            ? Text(subtitle!, style: AppTextStyles.bodySmall)
            : null,
        trailing: const Icon(Icons.chevron_right, color: AppColors.textMuted),
      ),
    );
  }
}
