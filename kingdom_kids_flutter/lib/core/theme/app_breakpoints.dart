/// Responsive breakpoints for Kingdom Kids.
///
/// Based on Material 3 canonical layout guidance, adapted for phone/tablet
/// use cases relevant to a children's reading app.
abstract final class AppBreakpoints {
  /// < 600dp — phone portrait/landscape. Single-column, BottomNavigationBar.
  static const double compact = 600.0;

  /// 600–900dp — tablet portrait / small tablet landscape. 2-column grids,
  /// NavigationRail begins to appear.
  static const double medium = 900.0;

  /// > 900dp — tablet landscape / desktop. Sidebar + content, max-width
  /// constraints on reading content.
  // static const double expanded = 900.0; // anything above medium

  /// Maximum width for constrained reading/form content on large screens.
  static const double contentMaxWidth = 800.0;

  /// Maximum width for forms (sign-in, create profile, etc.)
  static const double formMaxWidth = 480.0;
}
