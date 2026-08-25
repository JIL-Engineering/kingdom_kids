import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

/// Kingdom Kids text styles — matched to the design mockups.
///
/// Font roles:
/// - **Nunito** (ExtraBold/Bold) — app name, screen headings, section titles
/// - **Playfair Display** (Italic) — scripture verse quotes
/// - **DM Sans** (Regular/SemiBold) — body text, subtitles, labels, buttons
abstract final class AppTextStyles {
  // ── App Name / Display ────────────────────────────────────────────────────
  /// "Kingdom Kids" in nav bar / splash — large, bold Nunito
  static TextStyle get appName => GoogleFonts.nunito(
        fontSize: 22,
        fontWeight: FontWeight.w800,
        color: AppColors.textPrimary,
        letterSpacing: -0.5,
      );

  // ── Screen Headings ───────────────────────────────────────────────────────
  /// e.g. "Create a Profile", "My Journey" — hero headings
  static TextStyle get displayLarge => GoogleFonts.nunito(
        fontSize: 32,
        fontWeight: FontWeight.w800,
        color: AppColors.textPrimary,
        height: 1.1,
        letterSpacing: -0.5,
      );

  /// e.g. "David & The Giant", "Good morning, Samuel!" — card/section hero
  static TextStyle get displayMedium => GoogleFonts.nunito(
        fontSize: 24,
        fontWeight: FontWeight.w800,
        color: AppColors.textPrimary,
        height: 1.2,
      );

  // ── Section Headings ──────────────────────────────────────────────────────
  /// e.g. "Tales for You", "Badge Shelf", "Recent Activity"
  static TextStyle get headingLarge => GoogleFonts.nunito(
        fontSize: 20,
        fontWeight: FontWeight.w700,
        color: AppColors.textPrimary,
      );

  /// e.g. card headings, list item titles
  static TextStyle get headingMedium => GoogleFonts.nunito(
        fontSize: 16,
        fontWeight: FontWeight.w700,
        color: AppColors.textPrimary,
      );

  static TextStyle get headingSmall => GoogleFonts.nunito(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: AppColors.textPrimary,
      );

  // ── Scripture / Verse ─────────────────────────────────────────────────────
  /// Scripture quotations — Playfair Display Italic, large
  static TextStyle get verseText => GoogleFonts.playfairDisplay(
        fontSize: 22,
        fontWeight: FontWeight.w500,
        fontStyle: FontStyle.italic,
        color: AppColors.textPrimary,
        height: 1.4,
      );

  /// Verse reference — "Psalm 119:105"
  static TextStyle get verseReference => GoogleFonts.dmSans(
        fontSize: 13,
        fontWeight: FontWeight.w600,
        color: AppColors.textSecondary,
        letterSpacing: 0.3,
      );

  // ── Body Text ─────────────────────────────────────────────────────────────
  static TextStyle get bodyLarge => GoogleFonts.dmSans(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: AppColors.textPrimary,
        height: 1.5,
      );

  static TextStyle get bodyMedium => GoogleFonts.dmSans(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: AppColors.textSecondary,
        height: 1.5,
      );

  static TextStyle get bodySmall => GoogleFonts.dmSans(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: AppColors.textMuted,
        height: 1.4,
      );

  // ── Labels ────────────────────────────────────────────────────────────────
  /// e.g. "STORY OF THE DAY", "DAILY SEED" — uppercase amber labels
  static TextStyle get chipLabel => GoogleFonts.dmSans(
        fontSize: 11,
        fontWeight: FontWeight.w700,
        color: AppColors.amber,
        letterSpacing: 1.2,
      );

  /// Form field labels — "DISPLAY NAME", "BIRTH YEAR"
  static TextStyle get fieldLabel => GoogleFonts.dmSans(
        fontSize: 12,
        fontWeight: FontWeight.w700,
        color: AppColors.textPrimary,
        letterSpacing: 0.8,
      );

  // ── Buttons ───────────────────────────────────────────────────────────────
  static TextStyle get buttonLarge => GoogleFonts.dmSans(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: AppColors.textOnDark,
        letterSpacing: 0.2,
      );

  static TextStyle get buttonMedium => GoogleFonts.dmSans(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: AppColors.textOnDark,
      );

  // ── Navigation ────────────────────────────────────────────────────────────
  static TextStyle get navLabel => GoogleFonts.dmSans(
        fontSize: 11,
        fontWeight: FontWeight.w500,
        color: AppColors.navInactive,
      );

  static TextStyle get navLabelActive => GoogleFonts.dmSans(
        fontSize: 11,
        fontWeight: FontWeight.w700,
        color: AppColors.navActive,
      );

  // ── Streak / Stats ────────────────────────────────────────────────────────
  /// e.g. "7 Days" in streak banner
  static TextStyle get streakNumber => GoogleFonts.nunito(
        fontSize: 36,
        fontWeight: FontWeight.w800,
        color: AppColors.textOnDark,
      );

  static TextStyle get streakLabel => GoogleFonts.dmSans(
        fontSize: 13,
        fontWeight: FontWeight.w500,
        color: AppColors.textOnDark,
        letterSpacing: 0.5,
      );

  // ── Stats / Numbers ───────────────────────────────────────────────────────
  static TextStyle get statNumber => GoogleFonts.nunito(
        fontSize: 28,
        fontWeight: FontWeight.w800,
        color: AppColors.textPrimary,
      );
}
