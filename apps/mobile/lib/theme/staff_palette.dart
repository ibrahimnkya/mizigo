import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Colors for the redesigned staff screens (Home, You, App Settings, tab bar,
/// header art). Each app theme carries one; read it with [StaffPalette.of] so
/// screens rebuild when the user switches theme in App Settings.
@immutable
class StaffPalette extends ThemeExtension<StaffPalette> {
  const StaffPalette({
    required this.background,
    required this.foreground,
    required this.surfaceTint,
    required this.surfaceScale,
    required this.navBackground,
    required this.navBorder,
    this.artTone,
    required this.isDark,
    required this.splashBackground,
    required this.wordmark,
  });

  /// Page background.
  final Color background;

  /// Text and icons; use [fg] for the softer variants.
  final Color foreground;

  /// Base for translucent tiles/cards: white on dark themes, black on light.
  final Color surfaceTint;

  /// Light backgrounds need far less tint than dark ones for the same contrast.
  final double surfaceScale;

  final Color navBackground;
  final Color navBorder;

  /// Header art recolor (5x4 color matrix), or null for the original artwork.
  /// The art stays fully opaque so the bridge stays visible in every theme.
  final List<double>? artTone;

  /// Maps the artwork's luminance onto a gray ramp: its darkest part (the
  /// bridge, ~0.115) → [bridge] and its sky (~0.256) → [sky], both 0–1.
  static List<double> toneRamp({required double bridge, required double sky}) {
    const lumBridge = 0.115, lumSky = 0.256;
    final gain = (sky - bridge) / (lumSky - lumBridge);
    final offset = (bridge - gain * lumBridge) * 255;
    final r = 0.2126 * gain, g = 0.7152 * gain, b = 0.0722 * gain;
    return [
      r, g, b, 0, offset,
      r, g, b, 0, offset,
      r, g, b, 0, offset,
      0, 0, 0, 1, 0,
    ];
  }

  final bool isDark;

  /// Splash screen background (TRC keeps the brand maroon from the Figma).
  final Color splashBackground;

  /// MiziGO wordmark asset readable on [splashBackground].
  final String wordmark;

  /// Text/icon color at [alpha] (1 = full strength).
  Color fg([double alpha = 1]) => foreground.withValues(alpha: alpha);

  /// Tile/card fill. [alpha] is the strength on dark themes (Figma values:
  /// 0.15 tiles, 0.10 cards); light themes scale it down.
  Color surface(double alpha) => surfaceTint.withValues(alpha: alpha * surfaceScale);

  SystemUiOverlayStyle get overlayStyle => isDark ? SystemUiOverlayStyle.light : SystemUiOverlayStyle.dark;

  static StaffPalette of(BuildContext context) => Theme.of(context).extension<StaffPalette>() ?? trc;

  // const-evaluable copies of toneRamp(bridge: 0.08, sky: 0.30) and
  // toneRamp(bridge: 0.62, sky: 0.90).
  static const _midnightTone = <double>[
    0.3317, 1.1159, 0.1127, 0, -25.36,
    0.3317, 1.1159, 0.1127, 0, -25.36,
    0.3317, 1.1159, 0.1127, 0, -25.36,
    0, 0, 0, 1, 0,
  ];
  static const _daylightTone = <double>[
    0.4222, 1.4203, 0.1434, 0, 99.87,
    0.4222, 1.4203, 0.1434, 0, 99.87,
    0.4222, 1.4203, 0.1434, 0, 99.87,
    0, 0, 0, 1, 0,
  ];

  /// TRC Default — maroon (Figma "4 Home 1").
  static const trc = StaffPalette(
    background: Color(0xFF4F0A0C),
    foreground: Colors.white,
    surfaceTint: Colors.white,
    surfaceScale: 1,
    navBackground: Color(0xFF612224),
    navBorder: Color(0xFF651422),
    isDark: true,
    splashBackground: Color(0xFF5C0B19),
    wordmark: 'assets/images/logo_text.png',
  );

  /// Mid-Night — near-black for low light.
  static const midnight = StaffPalette(
    background: Color(0xFF161616),
    foreground: Color(0xFFF5F5F5),
    surfaceTint: Colors.white,
    surfaceScale: 0.8,
    navBackground: Color(0xFF222222),
    navBorder: Color(0xFF2E2E2E),
    // Near-black bridge against a charcoal sky.
    artTone: _midnightTone,
    isDark: true,
    splashBackground: Color(0xFF161616),
    wordmark: 'assets/images/logo_text.png',
  );

  /// Daylight — bright for outdoor use.
  static const daylight = StaffPalette(
    background: Color(0xFFF3F3F3),
    foreground: Color(0xFF1C1C1E),
    surfaceTint: Colors.black,
    surfaceScale: 0.4,
    navBackground: Colors.white,
    navBorder: Color(0xFFE2E2E2),
    // Mid-gray bridge against a pale sky; dark text stays readable on top.
    artTone: _daylightTone,
    isDark: false,
    splashBackground: Color(0xFFF3F3F3),
    wordmark: 'assets/images/logo_text_dark.png',
  );

  @override
  StaffPalette copyWith({
    Color? background,
    Color? foreground,
    Color? surfaceTint,
    double? surfaceScale,
    Color? navBackground,
    Color? navBorder,
    List<double>? artTone,
    bool? isDark,
    Color? splashBackground,
    String? wordmark,
  }) {
    return StaffPalette(
      background: background ?? this.background,
      foreground: foreground ?? this.foreground,
      surfaceTint: surfaceTint ?? this.surfaceTint,
      surfaceScale: surfaceScale ?? this.surfaceScale,
      navBackground: navBackground ?? this.navBackground,
      navBorder: navBorder ?? this.navBorder,
      artTone: artTone ?? this.artTone,
      isDark: isDark ?? this.isDark,
      splashBackground: splashBackground ?? this.splashBackground,
      wordmark: wordmark ?? this.wordmark,
    );
  }

  @override
  StaffPalette lerp(StaffPalette? other, double t) {
    if (other == null) return this;
    return StaffPalette(
      background: Color.lerp(background, other.background, t)!,
      foreground: Color.lerp(foreground, other.foreground, t)!,
      surfaceTint: Color.lerp(surfaceTint, other.surfaceTint, t)!,
      surfaceScale: surfaceScale + (other.surfaceScale - surfaceScale) * t,
      navBackground: Color.lerp(navBackground, other.navBackground, t)!,
      navBorder: Color.lerp(navBorder, other.navBorder, t)!,
      artTone: t < 0.5 ? artTone : other.artTone,
      isDark: t < 0.5 ? isDark : other.isDark,
      splashBackground: Color.lerp(splashBackground, other.splashBackground, t)!,
      wordmark: t < 0.5 ? wordmark : other.wordmark,
    );
  }
}
