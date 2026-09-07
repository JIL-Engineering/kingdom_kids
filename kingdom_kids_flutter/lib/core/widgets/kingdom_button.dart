import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_gradients.dart';
import '../theme/app_text_styles.dart';

/// The primary CTA button — dark navy pill, gradient pill, or outlined —
/// with white or dark text depending on style.
/// Matches the "Finish Setup ✓", "Resume Story" (navy), "Sign In to Family
/// Account" (gradient) etc. buttons in mockups.
class KingdomButton extends StatelessWidget {
  const KingdomButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.icon,
    this.isLoading = false,
    this.style = KingdomButtonStyle.primary,
  });

  final String label;
  final VoidCallback? onPressed;
  final Widget? icon;
  final bool isLoading;
  final KingdomButtonStyle style;

  bool get _isDisabled => isLoading || onPressed == null;

  Widget _buildChild(Color foregroundColor) {
    return isLoading
        ? SizedBox(
            width: 22,
            height: 22,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              valueColor: AlwaysStoppedAnimation<Color>(foregroundColor),
            ),
          )
        : Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (icon != null) ...[icon!, const SizedBox(width: 8)],
              Text(
                label,
                style: AppTextStyles.buttonLarge.copyWith(
                  color: foregroundColor,
                ),
              ),
            ],
          );
  }

  @override
  Widget build(BuildContext context) {
    // ElevatedButton's ButtonStyle only accepts a flat Color for its
    // background, never a Gradient (a Flutter/Material limitation, not
    // something ThemeData can be configured around) -- so the gradient style
    // is built from a decorated Container + InkWell instead of ElevatedButton.
    if (style == KingdomButtonStyle.gradient) {
      return Opacity(
        opacity: _isDisabled ? 0.5 : 1,
        child: SizedBox(
          width: double.infinity,
          height: 54,
          child: Material(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(14),
            child: Ink(
              decoration: BoxDecoration(
                gradient: AppGradients.primaryButton,
                borderRadius: BorderRadius.circular(14),
              ),
              child: InkWell(
                borderRadius: BorderRadius.circular(14),
                onTap: _isDisabled ? null : onPressed,
                child: Center(child: _buildChild(AppColors.white)),
              ),
            ),
          ),
        ),
      );
    }

    final isPrimary = style == KingdomButtonStyle.primary;
    final backgroundColor = isPrimary ? AppColors.navy : Colors.transparent;
    final foregroundColor = isPrimary ? AppColors.white : AppColors.textPrimary;
    final borderSide = isPrimary
        ? BorderSide.none
        : const BorderSide(color: AppColors.border, width: 1.5);

    return SizedBox(
      width: double.infinity,
      height: 54,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: foregroundColor,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
            side: borderSide,
          ),
          disabledBackgroundColor: AppColors.textMuted,
        ),
        child: _buildChild(foregroundColor),
      ),
    );
  }
}

enum KingdomButtonStyle { primary, outlined, gradient }
