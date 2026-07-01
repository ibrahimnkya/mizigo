import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_fonts/google_fonts.dart';

import 'providers/auth_provider.dart';
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

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await NotificationService.initialize();
  await ApiService.init();
  runApp(const MizigoApp());
}

class MizigoApp extends StatefulWidget {
  const MizigoApp({super.key});
  @override
  State<MizigoApp> createState() => _MizigoAppState();
}

class _MizigoAppState extends State<MizigoApp> {
  late final AuthProvider _authProvider;
  late final ParcelProvider _parcelProvider;
  late final PaymentProvider _paymentProvider;
  late final ThemeProvider _themeProvider;
  late final PrinterProvider _printerProvider;
  late final ScannerProvider _scannerProvider;

  @override
  void initState() {
    super.initState();
    _authProvider = AuthProvider();
    _parcelProvider = ParcelProvider();
    _paymentProvider = PaymentProvider();
    _themeProvider = ThemeProvider();
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

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _checkForUpdates();
    });
  }

  void _checkForUpdates() async {
    try {
      // Current version defined as 1.0.0
      const currentVersion = '1.0.0';
      final updateInfo = await ApiService.checkUpdate(currentVersion);
      final latestVersion = updateInfo['latestVersion']?.toString() ?? currentVersion;
      final forceUpdate = updateInfo['forceUpdate'] as bool? ?? false;
      final downloadUrl = updateInfo['downloadUrl']?.toString() ?? '';

      if (latestVersion != currentVersion && downloadUrl.isNotEmpty) {
        final context = rootNavigatorKey.currentContext;
        if (context != null && context.mounted) {
          showDialog(
            context: context,
            barrierDismissible: !forceUpdate,
            builder: (ctx) {
              return PopScope(
                canPop: !forceUpdate,
                child: AlertDialog(
                  backgroundColor: AppTheme.surface,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  title: Text(
                    'App Update Available',
                    style: GoogleFonts.outfit(fontWeight: FontWeight.bold, color: AppTheme.textPrimary),
                  ),
                  content: Text(
                    'A new version ($latestVersion) of Mizigo is available. '
                    '${forceUpdate ? "This update is required to continue using the app." : "Would you like to update now?"}',
                    style: GoogleFonts.inter(color: AppTheme.textSecondary),
                  ),
                  actions: [
                    if (!forceUpdate)
                      TextButton(
                        onPressed: () => Navigator.pop(ctx),
                        child: Text('Later', style: GoogleFonts.inter(color: AppTheme.textSecondary)),
                      ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppTheme.primary,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      ),
                      onPressed: () {
                        debugPrint('Launching update download: $downloadUrl');
                        if (!forceUpdate) {
                          Navigator.pop(ctx);
                        }
                      },
                      child: Text('Update Now', style: GoogleFonts.inter(color: Colors.white)),
                    ),
                  ],
                ),
              );
            },
          );
        }
      }
    } catch (e) {
      debugPrint('Failed to check for updates: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();
    
    return MaterialApp.router(
      title: 'Mizigo',
      debugShowCheckedModeBanner: false,
      theme: themeProvider.currentTheme,
      routerConfig: router,
    );
  }
}
