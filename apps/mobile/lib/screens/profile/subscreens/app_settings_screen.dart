import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:hugeicons/hugeicons.dart';
import '../../../providers/theme_provider.dart';
import '../../../theme/staff_palette.dart';
import '../../../widgets/staff/staff_settings.dart';

class AppSettingsScreen extends StatefulWidget {
  const AppSettingsScreen({super.key});

  @override
  State<AppSettingsScreen> createState() => _AppSettingsScreenState();
}

class _AppSettingsScreenState extends State<AppSettingsScreen> {
  String _selectedLanguage = 'English';
  String _selectedCurrency = 'TZS (TSh)';

  @override
  void initState() {
    super.initState();
    _loadSettings();
  }

  Future<void> _loadSettings() async {
    final prefs = await SharedPreferences.getInstance();
    if (!mounted) return;
    setState(() {
      _selectedLanguage = prefs.getString('language') ?? 'English';
      _selectedCurrency = prefs.getString('currency') ?? 'TZS (TSh)';
    });
  }

  Future<void> _savePreference(String key, String value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
  }

  /// "TZS (TSh)" -> "TZS", "Dollar ($)" -> "Dollar"
  String _short(String v) => v.split(' ').first;

  void _showSelectionSheet(
      String title,
      List<String> options,
      String currentValue,
      ValueChanged<String> onSelected,
      ) {
    showStaffSheet<void>(
      context,
      title: title,
      builder: (sheetContext) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          for (final option in options)
            StaffSheetTile(
              icon: title.contains('Language') ? HugeIcons.strokeRoundedLanguageSquare : HugeIcons.strokeRoundedMoney02,
              label: option,
              selected: option == currentValue,
              onTap: () {
                onSelected(option);
                Navigator.pop(sheetContext);
              },
            ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return StaffSettingsScaffold(
      title: 'App Settings',
      onBack: () => Navigator.pop(context),
      children: [
        StaffGlassCard(
          title: 'Preferences',
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 6),
          child: Column(
            children: [
              const StaffDivider(),
              StaffSettingsTile(
                icon: HugeIcons.strokeRoundedLanguageSquare,
                title: 'Language',
                value: _selectedLanguage,
                onTap: () => _showSelectionSheet(
                  'Select Language',
                  ['English', 'Kiswahili'],
                  _selectedLanguage,
                      (val) {
                    setState(() => _selectedLanguage = val);
                    _savePreference('language', val);
                  },
                ),
              ),
              const StaffDivider(),
              StaffSettingsTile(
                icon: HugeIcons.strokeRoundedMoney02,
                title: 'Currency',
                value: _short(_selectedCurrency),
                onTap: () => _showSelectionSheet(
                  'Select Currency',
                  ['Dollar (\$)', 'TZS (TSh)'],
                  _selectedCurrency,
                      (val) {
                    setState(() => _selectedCurrency = val);
                    _savePreference('currency', val);
                  },
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        const _ThemesCard(),
      ],
    );
  }
}

// ── Themes ──────────────────────────────────────────────────────────────────

class _ThemePalette {
  final Color skyTop, skyBottom, farHills, nearHills, bridge;
  const _ThemePalette({
    required this.skyTop,
    required this.skyBottom,
    required this.farHills,
    required this.nearHills,
    required this.bridge,
  });
}

/// Train-on-bridge artwork shared by every theme card (same as the page header).
const _kThemeArt = 'assets/images/bg/station_header.png';

class _ThemeOption {
  final String title;
  final String subtitle;
  final MizigoThemeMode mode;

  /// Gradient behind the artwork (also the fallback painting's sky).
  final _ThemePalette palette;

  /// The theme's staff palette — the preview art uses its exact recolor, so
  /// the card matches what the header looks like after switching.
  final StaffPalette staff;

  const _ThemeOption({
    required this.title,
    required this.subtitle,
    required this.mode,
    required this.palette,
    required this.staff,
  });
}

const _themeOptions = <_ThemeOption>[
  _ThemeOption(
    title: 'TRC Default',
    subtitle: 'TRC-branded theme',
    mode: MizigoThemeMode.customLight,
    staff: StaffPalette.trc,
    palette: _ThemePalette(
      skyTop: Color(0xFFA14F2B),
      skyBottom: Color(0xFFB5381E),
      farHills: Color(0xFF9C3A22),
      nearHills: Color(0xFF7A2418),
      bridge: Color(0xFF5A1219),
    ),
  ),
  _ThemeOption(
    title: 'Mid-Night',
    subtitle: 'Best in low-light',
    mode: MizigoThemeMode.midnight,
    staff: StaffPalette.midnight,
    palette: _ThemePalette(
      skyTop: Color(0xFF3E3E3E),
      skyBottom: Color(0xFF2A2A2A),
      farHills: Color(0xFF353535),
      nearHills: Color(0xFF2A2A2A),
      bridge: Color(0xFF1F1F1F),
    ),
  ),
  _ThemeOption(
    title: 'Daylight',
    subtitle: 'bright for daytime',
    mode: MizigoThemeMode.light,
    staff: StaffPalette.daylight,
    palette: _ThemePalette(
      skyTop: Color(0xFFDADADA),
      skyBottom: Color(0xFFEDEDED),
      farHills: Color(0xFFE2E2E2),
      nearHills: Color(0xFFCFCFCF),
      bridge: Color(0xFFB0B0B0),
    ),
  ),
];

class _ThemesCard extends StatelessWidget {
  const _ThemesCard();

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();
    final currentMode = themeProvider.currentMode;
    const options = _themeOptions;

    return StaffGlassCard(
      title: 'Themes',
      child: LayoutBuilder(
        builder: (context, constraints) {
          final cardWidth = (constraints.maxWidth - 12) / 2;
          return Wrap(
            spacing: 12,
            runSpacing: 12,
            children: [
              for (final option in options)
                SizedBox(
                  width: cardWidth,
                  child: _ThemeCard(
                    option: option,
                    artHeight: cardWidth * 1.12,
                    isSelected: currentMode == option.mode,
                    onTap: () => themeProvider.setThemeMode(option.mode),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}

class _ThemeCard extends StatelessWidget {
  final _ThemeOption option;
  final double artHeight;
  final bool isSelected;
  final VoidCallback onTap;

  const _ThemeCard({
    required this.option,
    required this.artHeight,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          color: StaffPalette.of(context).fg(0.04),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected ? kStaffAccent : StaffPalette.of(context).fg(0.22),
            width: isSelected ? 1.5 : 1,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(19)),
              child: SizedBox(
                height: artHeight,
                width: double.infinity,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    _ThemeArt(option: option),
                    if (isSelected)
                      Positioned(
                        top: 10,
                        right: 10,
                        child: Container(
                          width: 30,
                          height: 30,
                          decoration: const BoxDecoration(
                            color: kStaffAccent,
                            shape: BoxShape.circle,
                          ),
                          child: const HugeIcon(icon: HugeIcons.strokeRoundedTick02, color: Color(0xFF7A2D22), size: 18),
                        ),
                      ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(14, 16, 14, 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    option.title,
                    style: GoogleFonts.outfit(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                      color: StaffPalette.of(context).fg(),
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    option.subtitle,
                    style: GoogleFonts.outfit(
                      fontSize: 14,
                      color: StaffPalette.of(context).fg(0.7),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// The train-bridge artwork, recolored exactly as that theme's header.
class _ThemeArt extends StatelessWidget {
  final _ThemeOption option;
  const _ThemeArt({required this.option});

  @override
  Widget build(BuildContext context) {
    final Widget image = Image.asset(
      _kThemeArt,
      fit: BoxFit.cover,
      alignment: Alignment.bottomCenter,
      errorBuilder: (_, _, _) => CustomPaint(painter: _ThemeArtPainter(option.palette)),
    );
    final tone = option.staff.artTone;
    return tone == null ? image : ColorFiltered(colorFilter: ColorFilter.matrix(tone), child: image);
  }
}

/// Simple stylised mountains + arched bridge, tinted by a palette (fallback).
/// Only used if the artwork asset fails to load.
class _ThemeArtPainter extends CustomPainter {
  final _ThemePalette p;
  const _ThemeArtPainter(this.p);

  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width, h = size.height;
    final rect = Offset.zero & size;

    // Sky
    canvas.drawRect(
      rect,
      Paint()
        ..shader = LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [p.skyTop, p.skyBottom],
        ).createShader(rect),
    );

    // Far mountains
    final far = Path()
      ..moveTo(0, h * .62)
      ..lineTo(w * .18, h * .50)
      ..lineTo(w * .34, h * .60)
      ..lineTo(w * .52, h * .38)
      ..lineTo(w * .70, h * .58)
      ..lineTo(w * .85, h * .48)
      ..lineTo(w, h * .60)
      ..lineTo(w, h)
      ..lineTo(0, h)
      ..close();
    canvas.drawPath(far, Paint()..color = p.farHills);

    // Rolling near hills
    final near = Path()
      ..moveTo(0, h * .60)
      ..quadraticBezierTo(w * .25, h * .50, w * .50, h * .62)
      ..quadraticBezierTo(w * .75, h * .74, w, h * .58)
      ..lineTo(w, h)
      ..lineTo(0, h)
      ..close();
    canvas.drawPath(near, Paint()..color = p.nearHills);

    // Bridge
    final deckY = h * .72;
    final archH = h * .17;
    final bridgePaint = Paint()..color = p.bridge;
    final archStroke = Paint()
      ..color = p.bridge
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    for (var i = 0; i < 3; i++) {
      final archRect = Rect.fromLTWH(w * .05 + i * w * .30, deckY - archH, w * .30, archH * 2);
      canvas.drawArc(archRect, math.pi, math.pi, false, archStroke);
    }
    canvas.drawRect(Rect.fromLTWH(w * .03, deckY - 1, w * .94, 4), bridgePaint);
    for (var i = 0; i < 4; i++) {
      canvas.drawRect(
        Rect.fromLTWH(w * .06 + i * w * .28, deckY, w * .07, h - deckY),
        bridgePaint,
      );
    }

    // Dark cliffs on the edges
    final cliffs = Path()
      ..moveTo(0, h * .66)
      ..lineTo(w * .07, h * .70)
      ..lineTo(w * .05, h)
      ..lineTo(0, h)
      ..close()
      ..moveTo(w, h * .60)
      ..lineTo(w * .93, h * .68)
      ..lineTo(w * .95, h)
      ..lineTo(w, h)
      ..close();
    canvas.drawPath(cliffs, bridgePaint);
  }

  @override
  bool shouldRepaint(covariant _ThemeArtPainter old) => old.p != p;
}
