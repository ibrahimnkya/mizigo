import 'package:flutter/material.dart';
import '../services/api_service.dart';
import '../theme/app_theme.dart';
import 'auth_provider.dart';

/// Holds the logged-in user's organization whitelabel branding (logo,
/// brand colors) and derives a dynamic [ThemeData] override from it.
/// Branding is cosmetic only — any fetch failure just leaves the app on
/// its default theme rather than surfacing an error.
class BrandingProvider extends ChangeNotifier {
  String? _logoUrl;
  ThemeData? _dynamicTheme;
  AuthStatus? _lastSyncedStatus;

  String? get logoUrl => _logoUrl;
  ThemeData? get dynamicTheme => _dynamicTheme;
  bool get hasOverride => _dynamicTheme != null;

  /// Call whenever [AuthProvider.status] changes. Fetches branding once
  /// authenticated, and clears any override on logout.
  Future<void> syncWithAuth(AuthStatus status) async {
    if (status == _lastSyncedStatus) return;
    _lastSyncedStatus = status;

    if (status != AuthStatus.authenticated) {
      _clear();
      return;
    }
    await refresh();
  }

  Future<void> refresh() async {
    final branding = await ApiService.getOrganizationBranding();
    final primary = _parseHexColor(branding?['primaryColor'] as String?);
    if (branding == null || primary == null) {
      _clear();
      return;
    }

    _logoUrl = branding['logoUrl'] as String?;
    final secondary = _parseHexColor(branding['secondaryColor'] as String?);
    _dynamicTheme = AppTheme.buildDynamic(primary: primary, secondary: secondary);
    notifyListeners();
  }

  void _clear() {
    if (_dynamicTheme == null && _logoUrl == null) return;
    _dynamicTheme = null;
    _logoUrl = null;
    notifyListeners();
  }

  Color? _parseHexColor(String? hex) {
    if (hex == null || hex.isEmpty) return null;
    var value = hex.trim().replaceFirst('#', '');
    if (value.length == 3) {
      value = value.split('').map((c) => '$c$c').join();
    }
    if (value.length != 6) return null;
    final intVal = int.tryParse('FF$value', radix: 16);
    return intVal != null ? Color(intVal) : null;
  }
}
