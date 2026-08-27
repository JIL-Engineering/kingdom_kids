import 'package:flutter/material.dart';
import 'package:kingdom_kids_client/kingdom_kids_client.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/widgets/kingdom_button.dart';
import '../../../main.dart';

/// (icon, color) pairs used as placeholder avatars. No illustrated-character
/// art pipeline exists yet (Sprint 2 content pipeline) -- this is a
/// deliberately distinct icon set, not just numbered circles, so profiles
/// stay visually recognizable until real artwork replaces them.
const _avatarChoices = <String, (IconData, Color)>{
  'avatar_star': (Icons.star_rounded, Color(0xFFF5A623)),
  'avatar_sun': (Icons.wb_sunny_rounded, Color(0xFFFCBF1E)),
  'avatar_leaf': (Icons.eco_rounded, Color(0xFF10B981)),
  'avatar_moon': (Icons.nightlight_round, Color(0xFF6B7280)),
  'avatar_heart': (Icons.favorite_rounded, Color(0xFFEF4444)),
  'avatar_crown': (Icons.emoji_events_rounded, Color(0xFF1A1F36)),
};

/// Renders a child avatar (used here and from the profile picker) so both
/// places stay in sync as the placeholder set changes.
class ChildAvatarIcon extends StatelessWidget {
  const ChildAvatarIcon({super.key, required this.avatarId, this.size = 56});

  final String avatarId;
  final double size;

  @override
  Widget build(BuildContext context) {
    final (icon, color) =
        _avatarChoices[avatarId] ?? _avatarChoices.values.first;
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color.withValues(alpha: 0.18),
      ),
      alignment: Alignment.center,
      child: Icon(icon, color: color, size: size * 0.5),
    );
  }
}

/// Create or edit a child profile. Pass [existingChild] to edit; omit it to
/// create a new one. Matches kingdomkidsdesignmockupui/images/screen12.png's
/// "Add Child" flow.
class ChildFormScreen extends StatefulWidget {
  const ChildFormScreen({super.key, this.existingChild});

  final ChildProfile? existingChild;

  @override
  State<ChildFormScreen> createState() => _ChildFormScreenState();
}

class _ChildFormScreenState extends State<ChildFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  int? _birthYear;
  String _preferredLanguage = 'en';
  String _avatarId = _avatarChoices.keys.first;
  bool _isSubmitting = false;

  bool get _isEditing => widget.existingChild != null;

  @override
  void initState() {
    super.initState();
    final existing = widget.existingChild;
    if (existing != null) {
      _nameController.text = existing.displayName;
      _birthYear = existing.birthYear;
      _preferredLanguage = existing.preferredLanguage;
      _avatarId = existing.avatarId;
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate() || _birthYear == null) return;

    setState(() => _isSubmitting = true);
    try {
      if (_isEditing) {
        await client.child.updateChild(
          widget.existingChild!.id!,
          _nameController.text.trim(),
          _birthYear!,
          _preferredLanguage,
          _avatarId,
        );
      } else {
        await client.child.createChild(
          _nameController.text.trim(),
          _birthYear!,
          _preferredLanguage,
          _avatarId,
        );
      }
      if (mounted) Navigator.of(context).pop();
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              _isEditing
                  ? 'Could not save changes: $e'
                  : 'Could not add child: $e',
            ),
          ),
        );
      }
    } finally {
      if (mounted) setState(() => _isSubmitting = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentYear = DateTime.now().year;
    final birthYearChoices = [
      for (var year = currentYear; year >= currentYear - 12; year--) year,
    ];

    return Scaffold(
      backgroundColor: AppColors.cream,
      appBar: AppBar(
        backgroundColor: AppColors.cream,
        title: Text(
          _isEditing ? 'Edit Child' : 'Add Child',
          style: AppTextStyles.headingMedium,
        ),
      ),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: ListView(
            padding: const EdgeInsets.all(24),
            children: [
              Text('DISPLAY NAME', style: AppTextStyles.fieldLabel),
              const SizedBox(height: 8),
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(hintText: "Child's name"),
                validator: (value) => (value == null || value.trim().isEmpty)
                    ? 'Enter a name'
                    : null,
              ),
              const SizedBox(height: 20),
              Text('BIRTH YEAR', style: AppTextStyles.fieldLabel),
              const SizedBox(height: 8),
              DropdownButtonFormField<int>(
                initialValue: _birthYear,
                decoration: const InputDecoration(hintText: 'Select a year'),
                items: [
                  for (final year in birthYearChoices)
                    DropdownMenuItem(value: year, child: Text('$year')),
                ],
                onChanged: (value) => setState(() => _birthYear = value),
                validator: (value) => value == null ? 'Select a year' : null,
              ),
              const SizedBox(height: 20),
              Text('PREFERRED LANGUAGE', style: AppTextStyles.fieldLabel),
              const SizedBox(height: 8),
              SegmentedButton<String>(
                segments: const [
                  ButtonSegment(value: 'en', label: Text('EN')),
                  ButtonSegment(value: 'fr', label: Text('FR')),
                ],
                selected: {_preferredLanguage},
                onSelectionChanged: (selection) =>
                    setState(() => _preferredLanguage = selection.first),
              ),
              const SizedBox(height: 20),
              Text('AVATAR', style: AppTextStyles.fieldLabel),
              const SizedBox(height: 8),
              Wrap(
                spacing: 12,
                runSpacing: 12,
                children: [
                  for (final avatarId in _avatarChoices.keys)
                    _AvatarChoice(
                      avatarId: avatarId,
                      selected: avatarId == _avatarId,
                      onTap: () => setState(() => _avatarId = avatarId),
                    ),
                ],
              ),
              const SizedBox(height: 32),
              KingdomButton(
                label: _isEditing ? 'Save Changes' : 'Add Child',
                isLoading: _isSubmitting,
                onPressed: _submit,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _AvatarChoice extends StatelessWidget {
  const _AvatarChoice({
    required this.avatarId,
    required this.selected,
    required this.onTap,
  });

  final String avatarId;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(28),
      child: Container(
        padding: const EdgeInsets.all(3),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: selected ? AppColors.avatarRingActive : Colors.transparent,
            width: 3,
          ),
        ),
        child: ChildAvatarIcon(avatarId: avatarId),
      ),
    );
  }
}
