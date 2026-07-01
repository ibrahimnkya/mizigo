import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

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

  // 1. Mizigo Light ThemeData
  static ThemeData get light => ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorScheme: const ColorScheme.light(
      primary: Color(0xFF3B82F6),
      secondary: Color(0xFF3B82F6),
      surface: Color(0xFFFFFFFF),
      error: Color(0xFFEF4444),
      outline: Color(0xFFE2E8F0),
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
      backgroundColor: const Color(0xFF3B82F6),
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
        backgroundColor: const Color(0xFF3B82F6),
        foregroundColor: Colors.white,
        minimumSize: const Size.fromHeight(buttonHeight),
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radiusSm)),
        textStyle: GoogleFonts.inter(fontWeight: FontWeight.w700, fontSize: 15),
      ),
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        backgroundColor: const Color(0xFF3B82F6),
        foregroundColor: Colors.white,
        minimumSize: const Size.fromHeight(buttonHeight),
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radiusSm)),
        textStyle: GoogleFonts.inter(fontWeight: FontWeight.w700, fontSize: 15),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: const Color(0xFF3B82F6),
        minimumSize: const Size.fromHeight(buttonHeight),
        elevation: 0,
        side: const BorderSide(color: Color(0xFF3B82F6), width: 1.5),
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
        borderSide: const BorderSide(color: Color(0xFF3B82F6), width: 2),
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
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Color(0xFFFFFFFF),
      selectedItemColor: Color(0xFF3B82F6),
      unselectedItemColor: Color(0xFF94A3B8),
      type: BottomNavigationBarType.fixed,
      elevation: 8,
    ),
    switchTheme: SwitchThemeData(
      thumbColor: WidgetStateProperty.resolveWith<Color?>((states) {
        if (states.contains(WidgetState.selected)) {
          return const Color(0xFF3B82F6);
        }
        return null;
      }),
      trackColor: WidgetStateProperty.resolveWith<Color?>((states) {
        if (states.contains(WidgetState.selected)) {
          return const Color(0xFF3B82F6).withValues(alpha: 0.4);
        }
        return null;
      }),
    ),
    checkboxTheme: CheckboxThemeData(
      fillColor: WidgetStateProperty.resolveWith<Color?>((states) {
        if (states.contains(WidgetState.selected)) {
          return const Color(0xFF3B82F6);
        }
        return null;
      }),
      checkColor: WidgetStateProperty.all<Color>(Colors.white),
    ),
  );

  // 2. Custom Light ThemeData (SGR / TRC branded)
  static ThemeData get customLight => ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorScheme: const ColorScheme.light(
      primary: Color(0xFF670E1E),
      secondary: Color(0xFFFA800B),
      surface: Color(0xFFFFFFFF),
      error: Color(0xFFEF4444),
      outline: Color(0xFF9C7A7F),
    ),
    scaffoldBackgroundColor: const Color(0xFFF0EEED),
    dividerColor: const Color(0xFFE2E8F0),
    iconTheme: const IconThemeData(color: Color(0xFF670E1E)),
    textTheme: _buildTextTheme(
      textPrimary: const Color(0xFF1E293B),
      textSecondary: const Color(0xFF9C7A7F),
      textMuted: const Color(0xFF9C7A7F),
      displayColor: const Color(0xFF670E1E),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: const Color(0xFF670E1E),
      elevation: 0,
      scrolledUnderElevation: 0,
      centerTitle: false,
      titleTextStyle: GoogleFonts.inter(
        fontSize: 18,
        fontWeight: FontWeight.w800,
        color: Colors.white,
        letterSpacing: -0.5,
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
        backgroundColor: const Color(0xFF670E1E),
        foregroundColor: Colors.white,
        minimumSize: const Size.fromHeight(buttonHeight),
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radiusSm)),
        textStyle: GoogleFonts.inter(fontWeight: FontWeight.w700, fontSize: 15),
      ),
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        backgroundColor: const Color(0xFF670E1E),
        foregroundColor: Colors.white,
        minimumSize: const Size.fromHeight(buttonHeight),
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radiusSm)),
        textStyle: GoogleFonts.inter(fontWeight: FontWeight.w700, fontSize: 15),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: const Color(0xFF670E1E),
        minimumSize: const Size.fromHeight(buttonHeight),
        elevation: 0,
        side: const BorderSide(color: Color(0xFF670E1E), width: 1.5),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radiusSm)),
        textStyle: GoogleFonts.inter(fontWeight: FontWeight.w700, fontSize: 15),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(radiusMd),
        borderSide: const BorderSide(color: Color(0xFF9C7A7F)),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(radiusMd),
        borderSide: const BorderSide(color: Color(0xFF9C7A7F)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(radiusMd),
        borderSide: const BorderSide(color: Color(0xFFFA800B), width: 2),
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
      hintStyle: GoogleFonts.inter(color: const Color(0xFF9C7A7F), fontSize: 14),
    ),
    cardTheme: CardThemeData(
      color: Colors.white,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radiusLg),
        side: const BorderSide(color: Color(0xFFE2E8F0)),
      ),
      margin: EdgeInsets.zero,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      selectedItemColor: Color(0xFF670E1E),
      unselectedItemColor: Color(0xFF9C7A7F),
      type: BottomNavigationBarType.fixed,
      elevation: 8,
    ),
    switchTheme: SwitchThemeData(
      thumbColor: WidgetStateProperty.resolveWith<Color?>((states) {
        if (states.contains(WidgetState.selected)) {
          return const Color(0xFF670E1E);
        }
        return null;
      }),
      trackColor: WidgetStateProperty.resolveWith<Color?>((states) {
        if (states.contains(WidgetState.selected)) {
          return const Color(0xFF670E1E).withValues(alpha: 0.4);
        }
        return null;
      }),
    ),
    checkboxTheme: CheckboxThemeData(
      fillColor: WidgetStateProperty.resolveWith<Color?>((states) {
        if (states.contains(WidgetState.selected)) {
          return const Color(0xFF670E1E);
        }
        return null;
      }),
      checkColor: WidgetStateProperty.all<Color>(Colors.white),
    ),
  );

}
