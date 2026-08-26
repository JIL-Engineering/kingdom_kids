import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

/// The primary CTA button — dark navy pill with white text.
/// Matches the "Finish Setup ✓", "Resume Story", "Sign In" etc. buttons in mockups.
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

  @override
  Widget build(BuildContext context) {
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
        child: isLoading
            ? const SizedBox(
                width: 22,
                height: 22,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(AppColors.white),
                ),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (icon != null) ...[
                    icon!,
                    const SizedBox(width: 8),
                  ],
                  Text(
                    label,
                    style: AppTextStyles.buttonLarge.copyWith(
                      color: foregroundColor,
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}

enum KingdomButtonStyle { primary, outlined }
