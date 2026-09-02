import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kingdom_kids_client/kingdom_kids_client.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../main.dart';
import 'child_form_screen.dart';

/// Matches kingdomkidsdesignmockupui/images/screen12.png ("Who is reading
/// today?"). Tap a child to edit their profile; the gear icon is the entry
/// point to the PIN-gated parent Settings.
class ProfilePickerScreen extends StatefulWidget {
  const ProfilePickerScreen({super.key});

  @override
  State<ProfilePickerScreen> createState() => _ProfilePickerScreenState();
}

class _ProfilePickerScreenState extends State<ProfilePickerScreen> {
  late Future<List<ChildProfile>> _childrenFuture;

  @override
  void initState() {
    super.initState();
    _childrenFuture = client.child.listChildren();
  }

  Future<void> _refresh() async {
    setState(() {
      _childrenFuture = client.child.listChildren();
    });
    await _childrenFuture;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cream,
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: _refresh,
          child: FutureBuilder<List<ChildProfile>>(
            future: _childrenFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasError) {
                return ListView(
                  padding: const EdgeInsets.all(24),
                  children: [
                    const SizedBox(height: 80),
                    Text(
                      'Could not load profiles: ${snapshot.error}',
                      textAlign: TextAlign.center,
                      style: AppTextStyles.bodyMedium,
                    ),
                  ],
                );
              }

              final children = snapshot.data ?? const <ChildProfile>[];

              return ListView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 16,
                ),
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                      icon: const Icon(Icons.settings_outlined),
                      color: AppColors.textSecondary,
                      onPressed: () => context.push('/settings/pin-gate'),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Who is reading today?',
                    textAlign: TextAlign.center,
                    style: AppTextStyles.displayMedium,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Select your profile to continue the adventure.',
                    textAlign: TextAlign.center,
                    style: AppTextStyles.bodyMedium,
                  ),
                  const SizedBox(height: 32),
                  Wrap(
                    alignment: WrapAlignment.center,
                    spacing: 24,
                    runSpacing: 24,
                    children: [
                      for (final child in children)
                        _ChildTile(
                          child: child,
                          onTap: () async {
                            await context.push(
                              '/profiles/edit',
                              extra: child,
                            );
                            if (mounted) _refresh();
                          },
                        ),
                      _AddChildTile(
                        onTap: () async {
                          await context.push('/profiles/add');
                          if (mounted) _refresh();
                        },
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class _ChildTile extends StatelessWidget {
  const _ChildTile({required this.child, required this.onTap});

  final ChildProfile child;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(48),
      child: SizedBox(
        width: 96,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(3),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                border: Border.fromBorderSide(
                  BorderSide(color: AppColors.avatarRingActive, width: 3),
                ),
              ),
              child: ChildAvatarIcon(avatarId: child.avatarId, size: 74),
            ),
            const SizedBox(height: 8),
            Text(
              child.displayName,
              style: AppTextStyles.headingSmall,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}

class _AddChildTile extends StatelessWidget {
  const _AddChildTile({required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 96,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(40),
        child: Column(
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.border, width: 2),
              ),
              alignment: Alignment.center,
              child: const Icon(
                Icons.add,
                color: AppColors.textSecondary,
                size: 28,
              ),
            ),
            const SizedBox(height: 8),
            Text('Add Child', style: AppTextStyles.headingSmall),
          ],
        ),
      ),
    );
  }
}
