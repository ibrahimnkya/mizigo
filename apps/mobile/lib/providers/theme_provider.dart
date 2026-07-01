import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../theme/app_theme.dart';

enum MizigoThemeMode { light, customLight }

class ThemeProvider extends ChangeNotifier {
  static const String _themeModeKey = 'mizigo_theme_mode';
  MizigoThemeMode _currentMode = MizigoThemeMode.light;

  MizigoThemeMode get currentMode => _currentMode;

  // Always false — dark themes have been removed
  bool get isDarkMode => false;

  ThemeData get currentTheme {
    switch (_currentMode) {
      case MizigoThemeMode.light:
        return AppTheme.light;
      case MizigoThemeMode.customLight:
        return AppTheme.customLight;
    }
  }

  ThemeProvider() {
    AppTheme.activeTheme = currentTheme;
    _loadTheme();
  }

  Future<void> _loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    final modeStr = prefs.getString(_themeModeKey);
    if (modeStr == 'customLight' || modeStr == 'custom') {
      _currentMode = MizigoThemeMode.customLight;
    } else {
      // 'dark', 'customDark', unknown, or unset → default to light
      _currentMode = MizigoThemeMode.light;
    }
    AppTheme.activeTheme = currentTheme;
    notifyListeners();
  }

  Future<void> setThemeMode(MizigoThemeMode mode) async {
    _currentMode = mode;
    AppTheme.activeTheme = currentTheme;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_themeModeKey, mode.name);
    notifyListeners();
  }
}
