import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../theme/app_theme.dart';
import '../theme/staff_palette.dart';

enum MizigoThemeMode { light, customLight, midnight }

class ThemeProvider extends ChangeNotifier {
  static const String _themeModeKey = 'mizigo_theme_mode';
  // TRC Default (maroon) is the out-of-the-box staff theme.
  MizigoThemeMode _currentMode = MizigoThemeMode.customLight;

  MizigoThemeMode get currentMode => _currentMode;

  bool get isDarkMode => _currentMode == MizigoThemeMode.midnight;

  ThemeData get currentTheme {
    switch (_currentMode) {
      case MizigoThemeMode.light:
        return AppTheme.light;
      case MizigoThemeMode.customLight:
        return AppTheme.customLight;
      case MizigoThemeMode.midnight:
        return AppTheme.midnight;
    }
  }

  /// Staff-screen colors for the selected theme.
  StaffPalette get staffPalette => currentTheme.extension<StaffPalette>() ?? StaffPalette.trc;

  /// Final app theme: always the user's selected theme. On Daylight the
  /// organization's brand colors (if any) are used for buttons/highlights;
  /// the dark themes keep the orange accent so controls stay visible.
  ThemeData resolve(ThemeData? orgTheme) {
    final base = currentTheme;
    if (orgTheme == null || _currentMode != MizigoThemeMode.light) return base;
    return base.copyWith(
      colorScheme: base.colorScheme.copyWith(
        primary: orgTheme.colorScheme.primary,
        secondary: orgTheme.colorScheme.secondary,
      ),
    );
  }


  /// Pass the mode from [loadSavedMode] (read in `main()` before `runApp`)
  /// so the very first frame — the splash — already uses the saved theme.
  ThemeProvider({MizigoThemeMode? initialMode}) {
    if (initialMode != null) _currentMode = initialMode;
    AppTheme.activeTheme = currentTheme;
    if (initialMode == null) _loadTheme();
  }

  static Future<MizigoThemeMode> loadSavedMode() async {
    final prefs = await SharedPreferences.getInstance();
    return _parse(prefs.getString(_themeModeKey));
  }

  static MizigoThemeMode _parse(String? modeStr) {
    switch (modeStr) {
      case 'customLight':
      case 'custom':
        return MizigoThemeMode.customLight;
      case 'midnight':
        return MizigoThemeMode.midnight;
      case 'light':
        return MizigoThemeMode.light;
      default:
        // unknown or unset → TRC Default
        return MizigoThemeMode.customLight;
    }
  }

  Future<void> _loadTheme() async {
    _currentMode = await loadSavedMode();
    AppTheme.activeTheme = currentTheme;
    notifyListeners();
  }

  /// Android 13+: tells the OS which launch-screen style to show on the next
  /// cold start (see MainActivity.kt). No-op elsewhere.
  static const _launchThemeChannel = MethodChannel('mizigo/launch_theme');

  static Future<void> _syncLaunchScreen(MizigoThemeMode mode) async {
    try {
      await _launchThemeChannel.invokeMethod('set', mode.name);
    } catch (_) {
      // iOS / older Android: launch screen stays the brand maroon.
    }
  }

  Future<void> setThemeMode(MizigoThemeMode mode) async {
    _currentMode = mode;
    AppTheme.activeTheme = currentTheme;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_themeModeKey, mode.name);
    notifyListeners();
    _syncLaunchScreen(mode);
  }
}