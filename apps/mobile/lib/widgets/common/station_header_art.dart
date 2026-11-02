import 'dart:ui' show ImageFilter;

import 'package:flutter/material.dart';
import '../../theme/staff_palette.dart';

/// Train-on-bridge sunset artwork used behind the top of staff screens
/// (login, Home, You, App Settings…). Place it first in a [Stack] so content
/// draws over it.
///
/// - [height] is measured below the status bar; the status-bar inset is added
///   so the art always runs edge-to-edge behind it.
/// - [blur] softens the art for screens whose header carries text-heavy UI
///   (e.g. You, App Settings). 0 = sharp, as on Home and login.
/// - [fade] blends the bottom of the art into [fadeColor] (default: the page
///   background) with an overlaid gradient, so there is no visible edge.
/// - Recolored for the selected theme (see [StaffPalette.artTone]) unless a
///   fixed [palette] is given, as the login screens do.
class StationHeaderArt extends StatelessWidget {
  const StationHeaderArt({
    super.key,
    this.height = defaultHeight,
    this.blur = 0,
    this.fade = true,
    this.fadeColor,
    this.fadeStart = 0.55,
    this.palette,
  });

  static const double defaultHeight = 290;
  static const String asset = 'assets/images/bg/station_header.png';

  final double height;
  final double blur;
  final bool fade;
  final Color? fadeColor;

  /// Where the fade begins, as a fraction of the height (0–1).
  final double fadeStart;
  final StaffPalette? palette;

  @override
  Widget build(BuildContext context) {
    final p = palette ?? StaffPalette.of(context);

    Widget art = Image.asset(
      asset,
      fit: BoxFit.cover,
      alignment: Alignment.bottomCenter,
      errorBuilder: (_, _, _) => const SizedBox.shrink(),
    );
    final tone = p.artTone;
    if (tone != null) art = ColorFiltered(colorFilter: ColorFilter.matrix(tone), child: art);

    if (blur > 0) {
      art = ClipRect(
        child: ImageFiltered(
          imageFilter: ImageFilter.blur(sigmaX: blur, sigmaY: blur, tileMode: TileMode.clamp),
          // Slight scale hides the soft edges the blur creates.
          child: Transform.scale(scale: 1.08, child: art),
        ),
      );
    }

    final bottom = fadeColor ?? p.background;
    return ExcludeSemantics(
      child: SizedBox(
        height: height + MediaQuery.of(context).padding.top,
        width: double.infinity,
        child: Stack(
          fit: StackFit.expand,
          children: [
            art,
            if (fade)
              // Painted over the art (rather than masking it) so the blend ends
              // on exactly the page color — no seam, blurred or not.
              DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [fadeStart, 1],
                    colors: [bottom.withValues(alpha: 0), bottom],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
