import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import 'providers/auth_provider.dart';
import 'providers/branding_provider.dart';
import 'providers/parcel_provider.dart';
import 'providers/payment_provider.dart';
import 'providers/theme_provider.dart';
import 'providers/printer_provider.dart';
import 'providers/scanner_provider.dart';
import 'router/app_router.dart';
import 'services/notification_service.dart';
import 'services/api_service.dart';
import 'theme/app_theme.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';
import '/widgets/profile/premium_settings_components.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // Push notifications are a nice-to-have — a setup failure here (bad icon
  // resource, permission plumbing, etc.) must never block the app from
  // rendering at all, which is what an unhandled exception here does since
  // it stops execution before runApp() is ever reached.
  try {
    await NotificationService.initialize();
  } catch (e, st) {
    debugPrint('[main] NotificationService.initialize failed: $e\n$st');
  }
  await ApiService.init();
  // Read the saved theme up front so the splash's first frame already uses it.
  final initialTheme = await ThemeProvider.loadSavedMode();
  runApp(MizigoApp(initialTheme: initialTheme));
}

class MizigoApp extends StatefulWidget {
  const MizigoApp({super.key, this.initialTheme});

  final MizigoThemeMode? initialTheme;
  @override
  State<MizigoApp> createState() => _MizigoAppState();
}

class _MizigoAppState extends State<MizigoApp> {
  late final AuthProvider _authProvider;
  late final ParcelProvider _parcelProvider;
  late final PaymentProvider _paymentProvider;
  late final ThemeProvider _themeProvider;
  late final BrandingProvider _brandingProvider;
  late final PrinterProvider _printerProvider;
  late final ScannerProvider _scannerProvider;

  @override
  void initState() {
    super.initState();
    _authProvider = AuthProvider();
    _parcelProvider = ParcelProvider();
    _paymentProvider = PaymentProvider();
    _themeProvider = ThemeProvider(initialMode: widget.initialTheme);
    _brandingProvider = BrandingProvider();
    _printerProvider = PrinterProvider();
    _scannerProvider = ScannerProvider();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: _authProvider),
        ChangeNotifierProvider.value(value: _parcelProvider),
        ChangeNotifierProvider.value(value: _paymentProvider),
        ChangeNotifierProvider.value(value: _themeProvider),
        ChangeNotifierProvider.value(value: _brandingProvider),
        ChangeNotifierProvider.value(value: _printerProvider),
        ChangeNotifierProvider.value(value: _scannerProvider),
      ],
      child: _AppWithRouter(authProvider: _authProvider),
    );
  }
}

class _AppWithRouter extends StatefulWidget {
  final AuthProvider authProvider;
  const _AppWithRouter({required this.authProvider});
  @override
  State<_AppWithRouter> createState() => _AppWithRouterState();
}

class _AppWithRouterState extends State<_AppWithRouter> {
  late final router = createRouter(widget.authProvider);
  late final BrandingProvider _brandingProvider;

  @override
  void initState() {
    super.initState();
    _brandingProvider = context.read<BrandingProvider>();
    widget.authProvider.addListener(_onAuthChanged);
    _onAuthChanged();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _checkForUpdates();
    });
  }

  void _onAuthChanged() {
    _brandingProvider.syncWithAuth(widget.authProvider.status);
  }

  @override
  void dispose() {
    widget.authProvider.removeListener(_onAuthChanged);
    super.dispose();
  }

  Future<void> _checkForUpdates() async {
    try {
      final info = await PackageInfo.fromPlatform();
      final currentVersion = info.version;

      final updateInfo = await ApiService.checkUpdate(currentVersion);
      final latestVersion = updateInfo['latestVersion']?.toString() ?? currentVersion;
      final downloadUrl = updateInfo['downloadUrl']?.toString() ?? '';
      final releaseNotes = updateInfo['releaseNotes']?.toString();

      if (!_isNewer(latestVersion, currentVersion)) return;

      // "Later" is only allowed once per pending version.
      // If the user already dismissed this version, force them to update.
      final prefs = await SharedPreferences.getInstance();
      final dismissedVersion = prefs.getString('update_dismissed_version');
      // Required when the server says so (force flag or below the minimum
      // supported version), or when this version was already put off once.
      final alreadyDismissed =
          updateInfo['forceUpdate'] == true || dismissedVersion == latestVersion;

      final context = rootNavigatorKey.currentContext;
      if (context == null || !context.mounted) return;

      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (ctx) => PopScope(
          canPop: false,
          child: AlertDialog(
            backgroundColor: AppTheme.surface,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            title: Row(
              children: [
                Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    color: AppTheme.primary.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(Icons.system_update_rounded, color: AppTheme.primary, size: 20),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    alreadyDismissed ? 'Update Required' : 'Update Available',
                    style: GoogleFonts.outfit(fontWeight: FontWeight.w800, color: AppTheme.textPrimary, fontSize: 17),
                  ),
                ),
              ],
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Version $latestVersion is available (you have $currentVersion).',
                  style: GoogleFonts.inter(color: AppTheme.textSecondary, fontSize: 13),
                ),
                if (releaseNotes != null && releaseNotes.isNotEmpty) ...[
                  const SizedBox(height: 12),
                  Text(
                    "What's new:",
                    style: GoogleFonts.inter(fontWeight: FontWeight.w700, color: AppTheme.textPrimary, fontSize: 12),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    releaseNotes,
                    style: GoogleFonts.inter(color: AppTheme.textSecondary, fontSize: 12, height: 1.5),
                  ),
                ],
                if (alreadyDismissed) ...[
                  const SizedBox(height: 12),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.red.shade50,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      'This update is required to continue using the app.',
                      style: GoogleFonts.inter(color: Colors.red.shade700, fontSize: 11, fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ],
            ),
            actions: [
              // "Later" only on first encounter — saves the version so next launch forces it.
              if (!alreadyDismissed)
                TextButton(
                  onPressed: () async {
                    await prefs.setString('update_dismissed_version', latestVersion);
                    if (ctx.mounted) Navigator.pop(ctx);
                  },
                  child: Text('Later', style: GoogleFonts.inter(color: AppTheme.textSecondary)),
                ),
              if (downloadUrl.isNotEmpty)
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppTheme.primary,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  ),
                  onPressed: () async {
                    final uri = Uri.tryParse(downloadUrl);
                    final launched = uri != null &&
                        await launchUrl(uri, mode: LaunchMode.externalApplication);
                    if (launched != true && ctx.mounted) {
                      MizigoToasts.showInfo(ctx, 'Could not open the update link.');
                    }
                  },
                  child: Text('Update Now', style: GoogleFonts.inter(color: Colors.white, fontWeight: FontWeight.w700)),
                ),
            ],
          ),
        ),
      );
    } catch (e) {
      debugPrint('[Update] Check failed: $e');
    }
  }

  /// Returns true if [candidate] is strictly newer than [current].
  bool _isNewer(String candidate, String current) {
    final a = candidate.split('.').map((s) => int.tryParse(s) ?? 0).toList();
    final b = current.split('.').map((s) => int.tryParse(s) ?? 0).toList();
    for (var i = 0; i < [a.length, b.length].reduce((x, y) => x > y ? x : y); i++) {
      final diff = (i < a.length ? a[i] : 0) - (i < b.length ? b[i] : 0);
      if (diff > 0) return true;
      if (diff < 0) return false;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();
    final brandingProvider = context.watch<BrandingProvider>();

    return MaterialApp.router(
      title: 'Mizigo',
      debugShowCheckedModeBanner: false,
      theme: themeProvider.resolve(brandingProvider.dynamicTheme),
      routerConfig: router,
      // Tap anywhere outside a field to close the keyboard (app-wide).
      builder: (context, child) => GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: child,
      ),
    );
  }
}
