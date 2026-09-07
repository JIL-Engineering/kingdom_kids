import 'package:flutter/material.dart';

import 'app_colors.dart';

/// Kingdom Kids gradients — extracted from the Stitch design export's literal
/// CSS (see `parent_login_screen/code.html` and `kingdom_kids_splash_screen/code.html`
/// under `kingdomkidsdesignmockupui/stitch_remix_of_kingdom_kids_discipleship_platform/`).
abstract final class AppGradients {
  /// Primary CTA button fill.
  /// Source: `bg-gradient-to-b from-brand-gold to-brand-amber`.
  static const LinearGradient primaryButton = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [AppColors.amber, AppColors.amberDeep],
  );

  /// Soft glow behind the logo/hero area on the login and splash screens.
  /// Source: `radial-gradient(circle at 50% 20%, rgba(254,243,199,0.8) 0%, rgba(253,251,247,0) 70%)`.
  /// The center/radius are an approximation of the CSS circle-at-50%-20% —
  /// Flutter's [RadialGradient] sizing model doesn't map 1:1 to CSS's, so
  /// nudge [radius] if the glow reads too tight or too spread at actual
  /// screen size.
  static const RadialGradient backgroundGlow = RadialGradient(
    center: Alignment(0.0, -0.6),
    radius: 0.8,
    colors: [Color(0xCCFEF3C7), Color(0x00FDFBF7)],
  );
}
