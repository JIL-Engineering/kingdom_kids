import 'package:flutter/material.dart';

/// Kingdom Kids color palette — extracted from the Stitch design export
/// (`kingdomkidsdesignmockupui/stitch_remix_of_kingdom_kids_discipleship_platform/`),
/// verified against the literal `tailwind.config` `brand.*` values shared by
/// the current-generation screens (parent_login_screen, family_sign_up_screen,
/// my_books_screen, read_together_mode, parental_gate_pin_entry) and cross-checked
/// against rendered pixel samples. Re-derive from that export, not by eye, if
/// these ever need re-verifying — screen-to-screen drift is real even within
/// the design source itself.
abstract final class AppColors {
  // ── Primary Brand ─────────────────────────────────────────────────────────
  /// Navy — text, borders, and UI chrome on the current-generation screens.
  /// (`brand.navy` / `primary-container` in the design source.)
  static const Color navy = Color(0xFF102A43);

  /// Deepest navy — solid dark fills (streak banner, older-screen CTA
  /// buttons). (`primary` in the design source's Living Storybook tokens.)
  static const Color navyDeep = Color(0xFF00152A);

  /// Amber / gold — accent, badge progress, highlights, gradient button top
  /// stop. (`brand.gold` in the design source.)
  static const Color amber = Color(0xFFF59E0B);
  static const Color amberLight = Color(0xFFFCBF1E);
  static const Color amberPale = Color(0xFFFFF3C4);

  /// Deeper amber — gradient button bottom stop. (`brand.amber` in the
  /// design source.) See [AppGradients.primaryButton].
  static const Color amberDeep = Color(0xFFD97706);

  // ── Backgrounds ───────────────────────────────────────────────────────────
  /// Warm cream — main app background. (`brand.warmCream` in the design
  /// source.)
  static const Color cream = Color(0xFFFDFBF7);
  static const Color creamDeep = Color(0xFFF5F0E8);

  /// Warm yellow — Daily Seed card background.
  static const Color seedCardBg = Color(0xFFFFF8DC);
  static const Color seedCardBorder = Color(0xFFF5C842);

  /// White — card surfaces.
  static const Color white = Color(0xFFFFFFFF);

  // ── Text ──────────────────────────────────────────────────────────────────
  static const Color textPrimary = Color(0xFF1A1A2E);
  static const Color textSecondary = Color(0xFF6B7280);
  static const Color textMuted = Color(0xFF9CA3AF);
  static const Color textOnDark = Color(0xFFFFFFFF);
  static const Color textAmber = amber;

  // ── Semantic ──────────────────────────────────────────────────────────────
  static const Color success = Color(0xFF10B981);
  static const Color error = Color(0xFFEF4444);

  // ── Borders / Dividers ────────────────────────────────────────────────────
  static const Color border = Color(0xFFE5E7EB);
  static const Color borderLight = Color(0xFFF3F4F6);

  // ── Avatar ring colors ────────────────────────────────────────────────────
  static const Color avatarRingActive = amber;
  static const Color avatarRingInactive = Color(0xFFE5E7EB);

  // ── Navigation ────────────────────────────────────────────────────────────
  static const Color navActive = amber;
  static const Color navInactive = Color(0xFF9CA3AF);
  static const Color navBackground = Color(0xFFFFFFFF);

  // ── Mode selector ─────────────────────────────────────────────────────────
  static const Color childModeBg = amber;
  static const Color parentModeBg = navy;
}
