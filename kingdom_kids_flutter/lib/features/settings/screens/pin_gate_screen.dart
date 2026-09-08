import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/auth/session_state.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/widgets/kingdom_button.dart';
import '../../../main.dart';

/// How the gate reached the screen, and what should happen when the PIN
/// step(s) succeed.
enum PinGateMode {
  /// Entry point for /settings: create a PIN on first visit, otherwise
  /// verify the existing one. On success, replaces the route with /settings.
  initial,

  /// "Change PIN" from within Settings: always verify the current PIN
  /// first, then immediately prompt for a new one. On success, pops back
  /// to Settings (already unlocked).
  change,
}

/// The PIN itself is never stored or compared on the device -- every check
/// is a server call to AppUserEndpoint (bcrypt hash, see auth_service.dart).
class PinGateScreen extends StatefulWidget {
  const PinGateScreen({super.key, required this.mode});

  final PinGateMode mode;

  @override
  State<PinGateScreen> createState() => _PinGateScreenState();
}

class _PinGateScreenState extends State<PinGateScreen> {
  late Future<_PinStep> _initialStepFuture;

  @override
  void initState() {
    super.initState();
    _loadInitialStep();
  }

  void _loadInitialStep() {
    _initialStepFuture = widget.mode == PinGateMode.change
        ? Future.value(_PinStep.verify)
        : client.appUser.hasParentPin().then(
            (hasPin) => hasPin ? _PinStep.verify : _PinStep.create,
          );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cream,
      appBar: AppBar(backgroundColor: AppColors.cream),
      body: SafeArea(
        child: FutureBuilder<_PinStep>(
          future: _initialStepFuture,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Could not check your PIN status. '
                        'Check your connection and try again.',
                        textAlign: TextAlign.center,
                        style: AppTextStyles.bodyMedium,
                      ),
                      const SizedBox(height: 16),
                      KingdomButton(
                        label: 'Retry',
                        onPressed: () => setState(_loadInitialStep),
                      ),
                    ],
                  ),
                ),
              );
            }
            if (!snapshot.hasData) {
              return const Center(child: CircularProgressIndicator());
            }
            return _PinFlow(gateMode: widget.mode, initialStep: snapshot.data!);
          },
        ),
      ),
    );
  }
}

enum _PinStep { create, verify }

/// Handles the create/verify form and, for [PinGateMode.change], the
/// verify -> create transition, without navigating away in between.
class _PinFlow extends ConsumerStatefulWidget {
  const _PinFlow({required this.gateMode, required this.initialStep});

  final PinGateMode gateMode;
  final _PinStep initialStep;

  @override
  ConsumerState<_PinFlow> createState() => _PinFlowState();
}

class _PinFlowState extends ConsumerState<_PinFlow> {
  late _PinStep _step = widget.initialStep;
  final _pinController = TextEditingController();
  final _confirmController = TextEditingController();
  bool _isSubmitting = false;
  String? _errorText;

  @override
  void dispose() {
    _pinController.dispose();
    _confirmController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    final pin = _pinController.text.trim();
    if (!RegExp(r'^\d{4,6}$').hasMatch(pin)) {
      setState(() => _errorText = 'Enter a 4 to 6 digit PIN.');
      return;
    }
    if (_step == _PinStep.create && pin != _confirmController.text.trim()) {
      setState(() => _errorText = 'PINs do not match.');
      return;
    }

    setState(() {
      _isSubmitting = true;
      _errorText = null;
    });
    try {
      if (_step == _PinStep.verify) {
        final isCorrect = await client.appUser.verifyParentPin(pin);
        if (!isCorrect) {
          setState(() {
            _errorText = 'Incorrect PIN.';
            _isSubmitting = false;
          });
          return;
        }
        if (widget.gateMode == PinGateMode.change) {
          // Verified the old PIN -- now prompt for the new one.
          _pinController.clear();
          setState(() {
            _step = _PinStep.create;
            _isSubmitting = false;
          });
          return;
        }
      } else {
        await client.appUser.setParentPin(pin);
      }

      if (!mounted) return;
      if (widget.gateMode == PinGateMode.change) {
        Navigator.of(context).pop();
      } else {
        ref.read(sessionProvider.notifier).unlockParentMode();
        context.pushReplacement('/settings');
      }
    } catch (e) {
      setState(() => _errorText = 'Something went wrong: $e');
    } finally {
      if (mounted) setState(() => _isSubmitting = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isCreate = _step == _PinStep.create;
    final isChangingPin =
        widget.gateMode == PinGateMode.change && _step == _PinStep.create;

    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.lock_outline,
            size: 40,
            color: AppColors.textPrimary,
          ),
          const SizedBox(height: 16),
          Text(
            isChangingPin
                ? 'Choose a New PIN'
                : (isCreate ? 'Create a Parental PIN' : 'Enter Parental PIN'),
            textAlign: TextAlign.center,
            style: AppTextStyles.displayMedium,
          ),
          const SizedBox(height: 8),
          Text(
            isCreate
                ? 'This PIN will be required to access parent-only settings.'
                : 'Enter your PIN to access parent-only settings.',
            textAlign: TextAlign.center,
            style: AppTextStyles.bodyMedium,
          ),
          const SizedBox(height: 24),
          TextField(
            key: ValueKey(_step),
            controller: _pinController,
            keyboardType: TextInputType.number,
            obscureText: true,
            maxLength: 6,
            textAlign: TextAlign.center,
            style: AppTextStyles.displayMedium,
            decoration: const InputDecoration(counterText: ''),
          ),
          if (isCreate) ...[
            const SizedBox(height: 12),
            TextField(
              controller: _confirmController,
              keyboardType: TextInputType.number,
              obscureText: true,
              maxLength: 6,
              textAlign: TextAlign.center,
              style: AppTextStyles.displayMedium,
              decoration: const InputDecoration(
                hintText: 'Confirm PIN',
                counterText: '',
              ),
            ),
          ],
          if (_errorText != null) ...[
            const SizedBox(height: 12),
            Text(
              _errorText!,
              style: AppTextStyles.bodyMedium.copyWith(color: AppColors.error),
            ),
          ],
          const SizedBox(height: 24),
          KingdomButton(
            label: isCreate ? 'Create PIN' : 'Unlock',
            isLoading: _isSubmitting,
            onPressed: _submit,
          ),
        ],
      ),
    );
  }
}
