import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/widgets/kingdom_button.dart';
import '../../../main.dart';

const _avatarChoices = ['avatar_1', 'avatar_2', 'avatar_3', 'avatar_4'];

/// No avatar art pipeline exists yet (Sprint 2 content pipeline) -- avatars
/// are just numbered placeholder circles until real illustrations exist.
class AddChildScreen extends StatefulWidget {
  const AddChildScreen({super.key});

  @override
  State<AddChildScreen> createState() => _AddChildScreenState();
}

class _AddChildScreenState extends State<AddChildScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  int? _birthYear;
  String _preferredLanguage = 'en';
  String _avatarId = _avatarChoices.first;
  bool _isSubmitting = false;

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate() || _birthYear == null) return;

    setState(() => _isSubmitting = true);
    try {
      await client.child.createChild(
        _nameController.text.trim(),
        _birthYear!,
        _preferredLanguage,
        _avatarId,
      );
      if (mounted) Navigator.of(context).pop();
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Could not add child: $e')),
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
        title: Text('Add Child', style: AppTextStyles.headingMedium),
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
                children: [
                  for (final avatarId in _avatarChoices)
                    _AvatarChoice(
                      avatarId: avatarId,
                      selected: avatarId == _avatarId,
                      onTap: () => setState(() => _avatarId = avatarId),
                    ),
                ],
              ),
              const SizedBox(height: 32),
              KingdomButton(
                label: 'Add Child',
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
    final index = _avatarChoices.indexOf(avatarId) + 1;
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(28),
      child: Container(
        width: 56,
        height: 56,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.amberPale,
          border: Border.all(
            color: selected ? AppColors.avatarRingActive : Colors.transparent,
            width: 3,
          ),
        ),
        alignment: Alignment.center,
        child: Text('$index', style: AppTextStyles.headingMedium),
      ),
    );
  }
}
