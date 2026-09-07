import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';
import 'app_text_styles.dart';

/// Kingdom Kids full ThemeData — matches the warm, cream-background,
/// navy-CTA aesthetic from the design mockups.
///
/// Text styles reference [AppTextStyles] wherever an exact size/weight/color
/// match exists, instead of keeping a second independent copy of "which font
/// for which role" here — that duplication is exactly how this file drifted
/// onto the wrong font families (Nunito/DM Sans) even after [AppTextStyles]
/// itself was corrected to match the design source (Quicksand/Plus Jakarta
/// Sans). Where no exact match exists (different size, weight, or color —
/// e.g. `displayMedium` at 28px has no equivalent role), the font family is
/// still corrected in place, just not extracted into a shared getter.
///
/// Gradients (see [AppGradients]) can't be configured here — [ThemeData] and
/// [ButtonStyle] only accept a flat [Color] for backgrounds, never a
/// [Gradient]. Anything needing the gradient CTA treatment needs an actual
/// widget that paints it (e.g. a `GradientButton` in `core/widgets/`), not a
/// theme setting.
abstract final class AppTheme {
  static ThemeData get light {
    final base = ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme(
        brightness: Brightness.light,
        primary: AppColors.navy,
        onPrimary: AppColors.white,
        primaryContainer: AppColors.navyDeep,
        onPrimaryContainer: AppColors.white,
        secondary: AppColors.amber,
        onSecondary: AppColors.textPrimary,
        secondaryContainer: AppColors.amberPale,
        onSecondaryContainer: AppColors.textPrimary,
        tertiary: AppColors.success,
        onTertiary: AppColors.white,
        tertiaryContainer: const Color(0xFFD1FAE5),
        onTertiaryContainer: AppColors.textPrimary,
        error: AppColors.error,
        onError: AppColors.white,
        errorContainer: const Color(0xFFFEE2E2),
        onErrorContainer: AppColors.textPrimary,
        surface: AppColors.cream,
        onSurface: AppColors.textPrimary,
        surfaceContainerHighest: AppColors.creamDeep,
        onSurfaceVariant: AppColors.textSecondary,
        outline: AppColors.border,
        outlineVariant: AppColors.borderLight,
        shadow: AppColors.textPrimary,
        scrim: AppColors.textPrimary,
        inverseSurface: AppColors.navy,
        onInverseSurface: AppColors.white,
        inversePrimary: AppColors.amberLight,
      ),
      scaffoldBackgroundColor: AppColors.cream,
    );

    return base.copyWith(
      // Base font family fallback for any TextTheme role not explicitly
      // overridden below -- keeps stray Material text on Plus Jakarta Sans
      // (the design source's `font-sans` default) instead of Flutter's
      // system font.
      textTheme: GoogleFonts.plusJakartaSansTextTheme(base.textTheme).copyWith(
        // Roles with an exact size/weight/color match in AppTextStyles
        // reference it directly, so there's one source of truth instead of
        // two copies that can drift out of sync (as nunito/dmSans did here
        // before).
        displayLarge: AppTextStyles.displayLarge,
        headlineMedium: AppTextStyles.headingLarge,
        titleLarge: AppTextStyles.headingMedium,
        bodyLarge: AppTextStyles.bodyLarge,
        bodyMedium: AppTextStyles.bodyMedium,
        bodySmall: AppTextStyles.bodySmall,
        // No matching AppTextStyles role at these exact sizes -- corrected
        // to the right font family (Quicksand, per font-display) in place.
        displayMedium: GoogleFonts.quicksand(
          fontSize: 28,
          fontWeight: FontWeight.w800,
          color: AppColors.textPrimary,
        ),
        displaySmall: GoogleFonts.quicksand(
          fontSize: 24,
          fontWeight: FontWeight.w700,
          color: AppColors.textPrimary,
        ),
        headlineLarge: GoogleFonts.quicksand(
          fontSize: 22,
          fontWeight: FontWeight.w700,
          color: AppColors.textPrimary,
        ),
        headlineSmall: GoogleFonts.quicksand(
          fontSize: 18,
          fontWeight: FontWeight.w700,
          color: AppColors.textPrimary,
        ),
        labelLarge: GoogleFonts.plusJakartaSans(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: AppColors.textPrimary,
        ),
      ),

      // ── AppBar ─────────────────────────────────────────────────────────────
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.cream,
        foregroundColor: AppColors.textPrimary,
        elevation: 0,
        scrolledUnderElevation: 0,
        titleTextStyle: GoogleFonts.quicksand(
          fontSize: 18,
          fontWeight: FontWeight.w800,
          color: AppColors.textPrimary,
        ),
        iconTheme: const IconThemeData(color: AppColors.textPrimary),
      ),

      // ── Cards ──────────────────────────────────────────────────────────────
      cardTheme: CardThemeData(
        color: AppColors.white,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: const BorderSide(color: AppColors.borderLight),
        ),
        margin: EdgeInsets.zero,
      ),

      // ── Elevated Buttons (primary navy pill CTAs) ─────────────────────────
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.navy,
          foregroundColor: AppColors.white,
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          // buttonLarge is 16/w600/textOnDark -- matches this button's
          // white-on-navy foreground exactly, safe to reference directly.
          textStyle: AppTextStyles.buttonLarge,
          minimumSize: const Size(double.infinity, 54),
        ),
      ),

      // ── Outlined Buttons ──────────────────────────────────────────────────
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.textPrimary,
          side: const BorderSide(color: AppColors.border, width: 1.5),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          // Not AppTextStyles.buttonLarge here -- its color is hardcoded to
          // textOnDark (white), wrong for a bordered button on a light
          // background. No color, so it inherits foregroundColor above.
          textStyle: GoogleFonts.plusJakartaSans(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
          minimumSize: const Size(double.infinity, 54),
        ),
      ),

      // ── Text Buttons ──────────────────────────────────────────────────────
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColors.textPrimary,
          textStyle: GoogleFonts.plusJakartaSans(
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),

      // ── Input Decoration ──────────────────────────────────────────────────
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.white,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 14,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.border),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.border),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.navy, width: 1.5),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.error),
        ),
        hintStyle: GoogleFonts.plusJakartaSans(
          color: AppColors.textMuted,
          fontSize: 14,
        ),
        // bodyMedium is 14/w400/textSecondary -- exact match.
        labelStyle: AppTextStyles.bodyMedium,
      ),

      // ── Bottom Navigation Bar ─────────────────────────────────────────────
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: AppColors.white,
        selectedItemColor: AppColors.amber,
        unselectedItemColor: AppColors.navInactive,
        type: BottomNavigationBarType.fixed,
        elevation: 0,
        selectedLabelStyle: AppTextStyles.navLabelActive,
        unselectedLabelStyle: AppTextStyles.navLabel,
      ),

      // ── NavigationBar (M3) ────────────────────────────────────────────────
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: AppColors.white,
        indicatorColor: AppColors.amberPale,
        surfaceTintColor: Colors.transparent,
        iconTheme: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return const IconThemeData(color: AppColors.amber);
          }
          return const IconThemeData(color: AppColors.navInactive);
        }),
        labelTextStyle: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return AppTextStyles.navLabelActive;
          }
          return AppTextStyles.navLabel;
        }),
      ),

      // ── Progress Indicator ────────────────────────────────────────────────
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: AppColors.amber,
        linearTrackColor: AppColors.borderLight,
      ),

      // ── Chip ──────────────────────────────────────────────────────────────
      chipTheme: ChipThemeData(
        backgroundColor: AppColors.amberPale,
        // Not AppTextStyles.chipLabel -- that's the specific 11px/amber
        // "STORY OF THE DAY"-style badge style, a different role than a
        // generic Material Chip's label at 13px/textPrimary.
        labelStyle: GoogleFonts.plusJakartaSans(
          fontSize: 13,
          fontWeight: FontWeight.w600,
          color: AppColors.textPrimary,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        side: BorderSide.none,
      ),

      // ── Switch (for language toggle, auto-play) ───────────────────────────
      switchTheme: SwitchThemeData(
        thumbColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) return AppColors.white;
          return AppColors.navInactive;
        }),
        trackColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) return AppColors.amber;
          return AppColors.borderLight;
        }),
      ),

      // ── Divider ───────────────────────────────────────────────────────────
      dividerTheme: const DividerThemeData(
        color: AppColors.borderLight,
        space: 1,
        thickness: 1,
      ),

      // ── Icon ──────────────────────────────────────────────────────────────
      iconTheme: const IconThemeData(color: AppColors.textPrimary, size: 24),
    );
  }
}
