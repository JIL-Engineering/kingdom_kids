import 'package:flutter/material.dart';

/// Kingdom Kids color palette — extracted from design mockups.
abstract final class AppColors {
  // ── Primary Brand ─────────────────────────────────────────────────────────
  /// Dark navy — used for CTA buttons, strong headings, streak banner bg.
  static const Color navy = Color(0xFF1A1F36);
  static const Color navyDeep = Color(0xFF12172B);

  /// Amber / gold — accent, badge progress, highlights, "STORY OF THE DAY" labels.
  static const Color amber = Color(0xFFF5A623);
  static const Color amberLight = Color(0xFFFCBF1E);
  static const Color amberPale = Color(0xFFFFF3C4);

  // ── Backgrounds ───────────────────────────────────────────────────────────
  /// Warm cream — main app background.
  static const Color cream = Color(0xFFFAF6EF);
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
  static const Color textAmber = Color(0xFFF5A623);

  // ── Semantic ──────────────────────────────────────────────────────────────
  static const Color success = Color(0xFF10B981);
  static const Color error = Color(0xFFEF4444);

  // ── Borders / Dividers ────────────────────────────────────────────────────
  static const Color border = Color(0xFFE5E7EB);
  static const Color borderLight = Color(0xFFF3F4F6);

  // ── Avatar ring colors ────────────────────────────────────────────────────
  static const Color avatarRingActive = Color(0xFFF5A623);
  static const Color avatarRingInactive = Color(0xFFE5E7EB);

  // ── Navigation ────────────────────────────────────────────────────────────
  static const Color navActive = Color(0xFFF5A623);
  static const Color navInactive = Color(0xFF9CA3AF);
  static const Color navBackground = Color(0xFFFFFFFF);

  // ── Mode selector ─────────────────────────────────────────────────────────
  static const Color childModeBg = Color(0xFFF5A623);
  static const Color parentModeBg = Color(0xFF1A1F36);
}
