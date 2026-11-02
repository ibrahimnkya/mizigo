import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'staff_palette.dart';

class AppTheme {
  static ThemeData activeTheme = light;

  static Color get primary => activeTheme.colorScheme.primary;
  static Color get accent => activeTheme.colorScheme.secondary;
  static Color get accentLight => activeTheme.colorScheme.secondary.withValues(alpha: 0.1);
  static const Color success = Color(0xFF10B981);
  static const Color warning = Color(0xFFF59E0B);
  static const Color danger = Color(0xFFEF4444);
  static Color get surface => activeTheme.cardTheme.color ?? activeTheme.colorScheme.surface;
  static Color get background => activeTheme.scaffoldBackgroundColor;
  static Color get border => activeTheme.colorScheme.outline;
  static Color get textPrimary => activeTheme.textTheme.bodyLarge?.color ?? const Color(0xFF0F172A);
  static Color get textSecondary => activeTheme.textTheme.bodyMedium?.color ?? const Color(0xFF64748B);
  static Color get textMuted => activeTheme.textTheme.bodySmall?.color ?? const Color(0xFF94A3B8);

  // New Safari Parcel Inspired Constants
  static const Color cBlackMain = Color(0xFF0F172A);
  static Color get cPrimary => activeTheme.colorScheme.primary;
  static Color get cHintTextColor => activeTheme.textTheme.bodySmall?.color ?? const Color(0xFF64748B);
  static const Color cTextWhite = Colors.white;
  static const Color cBlack = Color(0xFF000000);
  static const Color cDividerColor = Color(0x33FFFFFF);
  
  static const Color cParcelReceived = Color(0xFF10B981);
  static const Color cParcelDelivered = Color(0xFF3B82F6);
  static const Color cParcelDispatched = Color(0xFFF59E0B);
  static const Color cParcelOffloaded = Color(0xFF6366F1);

  // MiziGO brand palette
  static const Color tecMaroon = Color(0xFF5C0B19);
  static const Color tecMaroonLight = Color(0xFF7A1A2A);
  static const Color tecOrange = Color(0xFFF78A1F);
  static const Color tecMaroonDeep = Color(0xFF4F0A0C); // staff app page background

  // Global tokens shared across all themes
  static const double radiusXs = 6;
  static const double radiusSm = 10;
  static const double radiusMd = 12;
  static const double radiusLg = 16;
  static const double radiusXl = 24;
  static const double radiusFull = 999;
  static const double buttonHeight = 52;
  static const double inputPaddingH = 16;
  static const double inputPaddingV = 14;

  static TextTheme _buildTextTheme({
    required Color textPrimary,
    required Color textSecondary,
    required Color textMuted,
    required Color displayColor,
  }) {
    return TextTheme(
      displayLarge: GoogleFonts.inter(fontSize: 57, fontWeight: FontWeight.w400, color: displayColor),
      displayMedium: GoogleFonts.inter(fontSize: 45, fontWeight: FontWeight.w400, color: displayColor),
      displaySmall: GoogleFonts.inter(fontSize: 36, fontWeight: FontWeight.w400, color: displayColor),
      headlineLarge: GoogleFonts.inter(fontSize: 32, fontWeight: FontWeight.w800, color: displayColor),
      headlineMedium: GoogleFonts.inter(fontSize: 28, fontWeight: FontWeight.w800, color: displayColor),
      headlineSmall: GoogleFonts.inter(fontSize: 24, fontWeight: FontWeight.w800, color: displayColor),
      titleLarge: GoogleFonts.inter(fontSize: 22, fontWeight: FontWeight.w700, color: textPrimary),
      titleMedium: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w600, color: textPrimary),
      titleSmall: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w600, color: textSecondary),
      bodyLarge: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w400, color: textPrimary),
      bodyMedium: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w400, color: textSecondary),
      bodySmall: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w400, color: textMuted),
      labelLarge: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w600, color: textPrimary),
      labelMedium: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w600, color: textSecondary),
      labelSmall: GoogleFonts.inter(fontSize: 11, fontWeight: FontWeight.w600, color: textMuted),
    );
  }

  // ── Themes: every screen follows the selected staff palette ────────────────
  //
  // TRC Default and Mid-Night are dark themes, Daylight is light. Anything that
  // reads Theme.of(context) or the AppTheme getters above (text colors,
  // surfaces, inputs, buttons, sheets, dialogs…) switches with the theme.

  static ThemeData get light => fromPalette(StaffPalette.daylight, primary: tecMaroon);
  static ThemeData get customLight => fromPalette(StaffPalette.trc, primary: tecOrange);
  static ThemeData get midnight => fromPalette(StaffPalette.midnight, primary: tecOrange);

  /// Full ThemeData derived from a [StaffPalette].
  static ThemeData fromPalette(StaffPalette p, {required Color primary, Color secondary = tecOrange}) {
    final bg = p.background;
    final fg = p.foreground;
    Color blend(double alpha) => Color.alphaBlend(p.surfaceTint.withValues(alpha: alpha * p.surfaceScale), bg);
    Color text(double alpha) => Color.alphaBlend(fg.withValues(alpha: alpha), bg);
    final card = p.isDark ? blend(0.10) : Colors.white;
    final raised = p.navBackground;
    final outline = p.isDark ? blend(0.22) : const Color(0xFFE2E2E2);
    final onPrimary = Colors.white;
    final brightness = p.isDark ? Brightness.dark : Brightness.light;

    OutlineInputBorder border(Color c, [double w = 1]) => OutlineInputBorder(
          borderRadius: BorderRadius.circular(radiusMd),
          borderSide: BorderSide(color: c, width: w),
        );

    final scheme = ColorScheme(
      brightness: brightness,
      primary: primary,
      onPrimary: onPrimary,
      secondary: secondary,
      onSecondary: Colors.white,
      error: const Color(0xFFF87171),
      onError: Colors.white,
      surface: card,
      onSurface: fg,
      onSurfaceVariant: text(0.7),
      outline: outline,
      outlineVariant: outline,
      surfaceContainerHighest: raised,
      surfaceContainerHigh: raised,
      surfaceContainer: raised,
      surfaceContainerLow: card,
      surfaceContainerLowest: bg,
      inverseSurface: fg,
      onInverseSurface: bg,
    );

    final textTheme = _buildTextTheme(
      textPrimary: fg,
      textSecondary: text(0.7),
      textMuted: text(0.5),
      displayColor: fg,
    );

    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      extensions: [p],
      colorScheme: scheme,
      scaffoldBackgroundColor: bg,
      canvasColor: bg,
      cardColor: card,
      dividerColor: outline,
      disabledColor: text(0.35),
      hintColor: text(0.5),
      iconTheme: IconThemeData(color: fg),
      primaryIconTheme: IconThemeData(color: fg),
      textTheme: textTheme,
      primaryTextTheme: textTheme,
      appBarTheme: AppBarTheme(
        backgroundColor: bg,
        foregroundColor: fg,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: false,
        titleTextStyle: GoogleFonts.outfit(fontSize: 20, fontWeight: FontWeight.w700, color: fg),
        iconTheme: IconThemeData(color: fg),
        actionsIconTheme: IconThemeData(color: fg),
        systemOverlayStyle: p.isDark ? SystemUiOverlayStyle.light : SystemUiOverlayStyle.dark,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primary,
          foregroundColor: onPrimary,
          disabledBackgroundColor: primary.withValues(alpha: 0.35),
          disabledForegroundColor: onPrimary.withValues(alpha: 0.7),
          minimumSize: const Size.fromHeight(buttonHeight),
          elevation: 0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radiusSm)),
          textStyle: GoogleFonts.outfit(fontWeight: FontWeight.w600, fontSize: 16),
        ),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: primary,
          foregroundColor: onPrimary,
          minimumSize: const Size.fromHeight(buttonHeight),
          elevation: 0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radiusSm)),
          textStyle: GoogleFonts.outfit(fontWeight: FontWeight.w600, fontSize: 16),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: fg,
          minimumSize: const Size.fromHeight(buttonHeight),
          side: BorderSide(color: text(0.4), width: 1.2),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radiusSm)),
          textStyle: GoogleFonts.outfit(fontWeight: FontWeight.w600, fontSize: 16),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: secondary,
          textStyle: GoogleFonts.outfit(fontWeight: FontWeight.w600),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: p.isDark ? blend(0.06) : Colors.white,
        labelStyle: GoogleFonts.outfit(color: text(0.7)),
        floatingLabelStyle: GoogleFonts.outfit(color: secondary),
        hintStyle: GoogleFonts.outfit(color: text(0.45), fontSize: 15),
        prefixIconColor: text(0.75),
        suffixIconColor: text(0.75),
        border: border(outline),
        enabledBorder: border(outline),
        focusedBorder: border(secondary, 1.5),
        errorBorder: border(const Color(0xFFF87171)),
        focusedErrorBorder: border(const Color(0xFFF87171), 1.5),
        contentPadding: const EdgeInsets.symmetric(horizontal: inputPaddingH, vertical: inputPaddingV),
      ),
      cardTheme: CardThemeData(
        color: card,
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radiusLg),
          side: p.isDark ? BorderSide.none : BorderSide(color: outline),
        ),
        margin: EdgeInsets.zero,
      ),
      listTileTheme: ListTileThemeData(
        iconColor: fg,
        textColor: fg,
        tileColor: Colors.transparent,
      ),
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: raised,
        modalBackgroundColor: raised,
        surfaceTintColor: Colors.transparent,
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(32))),
      ),
      dialogTheme: DialogThemeData(
        backgroundColor: raised,
        surfaceTintColor: Colors.transparent,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        titleTextStyle: GoogleFonts.outfit(fontSize: 20, fontWeight: FontWeight.w700, color: fg),
        contentTextStyle: GoogleFonts.outfit(fontSize: 15, color: text(0.8)),
      ),
      popupMenuTheme: PopupMenuThemeData(
        color: raised,
        surfaceTintColor: Colors.transparent,
        textStyle: GoogleFonts.outfit(color: fg),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
      dropdownMenuTheme: DropdownMenuThemeData(
        textStyle: GoogleFonts.outfit(color: fg),
        menuStyle: MenuStyle(backgroundColor: WidgetStatePropertyAll(raised)),
      ),
      snackBarTheme: SnackBarThemeData(
        backgroundColor: raised,
        contentTextStyle: GoogleFonts.outfit(color: fg),
        behavior: SnackBarBehavior.floating,
      ),
      tabBarTheme: TabBarThemeData(
        labelColor: fg,
        unselectedLabelColor: text(0.55),
        indicatorColor: secondary,
        dividerColor: Colors.transparent,
        labelStyle: GoogleFonts.outfit(fontWeight: FontWeight.w600),
      ),
      chipTheme: ChipThemeData(
        backgroundColor: blend(0.08),
        selectedColor: secondary.withValues(alpha: 0.2),
        labelStyle: GoogleFonts.outfit(color: fg),
        side: BorderSide(color: outline),
      ),
      progressIndicatorTheme: ProgressIndicatorThemeData(color: secondary),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: secondary,
        foregroundColor: Colors.white,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: p.navBackground,
        selectedItemColor: fg,
        unselectedItemColor: text(0.5),
        type: BottomNavigationBarType.fixed,
        elevation: 0,
      ),
      switchTheme: SwitchThemeData(
        thumbColor: WidgetStateProperty.resolveWith((s) => s.contains(WidgetState.selected) ? Colors.white : text(0.8)),
        trackColor: WidgetStateProperty.resolveWith(
            (s) => s.contains(WidgetState.selected) ? secondary : blend(0.15)),
        trackOutlineColor: const WidgetStatePropertyAll(Colors.transparent),
      ),
      checkboxTheme: CheckboxThemeData(
        fillColor: WidgetStateProperty.resolveWith((s) => s.contains(WidgetState.selected) ? secondary : null),
        checkColor: const WidgetStatePropertyAll(Colors.white),
        side: BorderSide(color: text(0.5), width: 1.5),
      ),
      radioTheme: RadioThemeData(
        fillColor: WidgetStateProperty.resolveWith((s) => s.contains(WidgetState.selected) ? secondary : text(0.5)),
      ),
    );
  }

  /// Builds a theme structurally identical to [light] but with the brand
  /// (primary/secondary) colors swapped for an organization's whitelabel
  /// colors, applied at runtime once branding loads after login.
  static ThemeData buildDynamic({required Color primary, Color? secondary}) {
    final accent = secondary ?? primary;
    return ThemeData(
      useMaterial3: true,
      extensions: const [StaffPalette.trc],
      brightness: Brightness.light,
      colorScheme: ColorScheme.light(
        primary: primary,
        secondary: accent,
        surface: const Color(0xFFFFFFFF),
        error: const Color(0xFFEF4444),
        outline: const Color(0xFFE2E8F0),
      ),
      scaffoldBackgroundColor: const Color(0xFFF8FAFC),
      dividerColor: const Color(0xFFE2E8F0),
      iconTheme: const IconThemeData(color: Color(0xFF0F172A)),
      textTheme: _buildTextTheme(
        textPrimary: const Color(0xFF0F172A),
        textSecondary: const Color(0xFF64748B),
        textMuted: const Color(0xFF94A3B8),
        displayColor: const Color(0xFF0F172A),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: primary,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: false,
        titleTextStyle: GoogleFonts.inter(
          fontSize: 18,
          fontWeight: FontWeight.w800,
          color: Colors.white,
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        actionsIconTheme: const IconThemeData(color: Colors.white),
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.dark,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primary,
          foregroundColor: Colors.white,
          minimumSize: const Size.fromHeight(buttonHeight),
          elevation: 0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radiusSm)),
          textStyle: GoogleFonts.inter(fontWeight: FontWeight.w700, fontSize: 15),
        ),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: primary,
          foregroundColor: Colors.white,
          minimumSize: const Size.fromHeight(buttonHeight),
          elevation: 0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radiusSm)),
          textStyle: GoogleFonts.inter(fontWeight: FontWeight.w700, fontSize: 15),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: primary,
          minimumSize: const Size.fromHeight(buttonHeight),
          elevation: 0,
          side: BorderSide(color: primary, width: 1.5),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radiusSm)),
          textStyle: GoogleFonts.inter(fontWeight: FontWeight.w700, fontSize: 15),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: const Color(0xFFFFFFFF),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radiusMd),
          borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radiusMd),
          borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radiusMd),
          borderSide: BorderSide(color: primary, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radiusMd),
          borderSide: const BorderSide(color: Color(0xFFEF4444)),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radiusMd),
          borderSide: const BorderSide(color: Color(0xFFEF4444), width: 2),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: inputPaddingH, vertical: inputPaddingV),
        hintStyle: GoogleFonts.inter(color: const Color(0xFF94A3B8), fontSize: 14),
      ),
      cardTheme: CardThemeData(
        color: const Color(0xFFFFFFFF),
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radiusLg)),
        margin: EdgeInsets.zero,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: const Color(0xFFFFFFFF),
        selectedItemColor: primary,
        unselectedItemColor: const Color(0xFF94A3B8),
        type: BottomNavigationBarType.fixed,
        elevation: 8,
      ),
      switchTheme: SwitchThemeData(
        thumbColor: WidgetStateProperty.resolveWith<Color?>((states) {
          if (states.contains(WidgetState.selected)) return primary;
          return null;
        }),
        trackColor: WidgetStateProperty.resolveWith<Color?>((states) {
          if (states.contains(WidgetState.selected)) {
            return primary.withValues(alpha: 0.4);
          }
          return null;
        }),
      ),
      checkboxTheme: CheckboxThemeData(
        fillColor: WidgetStateProperty.resolveWith<Color?>((states) {
          if (states.contains(WidgetState.selected)) return primary;
          return null;
        }),
        checkColor: WidgetStateProperty.all<Color>(Colors.white),
      ),
    );
  }

}
