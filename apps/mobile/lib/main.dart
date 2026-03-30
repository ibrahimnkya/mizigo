import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'providers/auth_provider.dart';
import 'providers/cargo_provider.dart';
import 'providers/payment_provider.dart';
import 'providers/theme_provider.dart';
import 'providers/printer_provider.dart';
import 'providers/scanner_provider.dart';
import 'router/app_router.dart';
import 'services/notification_service.dart';
import 'theme/app_theme.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await NotificationService.initialize();
  runApp(const MizigoApp());
}

class MizigoApp extends StatefulWidget {
  const MizigoApp({super.key});
  @override
  State<MizigoApp> createState() => _MizigoAppState();
}

class _MizigoAppState extends State<MizigoApp> {
  late final AuthProvider _authProvider;
  late final CargoProvider _cargoProvider;
  late final PaymentProvider _paymentProvider;
  late final ThemeProvider _themeProvider;
  late final PrinterProvider _printerProvider;
  late final ScannerProvider _scannerProvider;

  @override
  void initState() {
    super.initState();
    _authProvider = AuthProvider();
    _cargoProvider = CargoProvider();
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
        ChangeNotifierProvider.value(value: _cargoProvider),
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
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();
    
    return MaterialApp.router(
      title: 'Mizigo',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: themeProvider.themeMode,
      routerConfig: router,
    );
  }
}
