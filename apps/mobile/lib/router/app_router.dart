import 'dart:ui';
import '../theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gap/gap.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:provider/provider.dart';
import '../providers/auth_provider.dart';
import '../screens/auth/login_screen.dart';
import '../screens/profile/subscreens/printer_configuration_screen.dart';
import '../screens/auth/register_screen.dart';
import '../screens/home/home_screen.dart';
import '../screens/home/track_screen.dart';
import '../screens/home/live_track_screen.dart';
import '../screens/home/parcel_detail_screen.dart';
import '../screens/home/bookings_screen.dart';
import '../screens/home/recent_bookings_screen.dart';
import '../models/cargo_model.dart';
import '../screens/cargo/send_cargo_screen.dart';
import '../screens/cargo/cargo_status_screen.dart';
import '../screens/operator/send_cargo_to_station_screen.dart';
import '../screens/operator/deliver_cargo_screen.dart';
import '../screens/operator/operator_reports_screen.dart';
import '../screens/operator/qr_scanner_screen.dart';
import '../screens/operator/operator_scanned_details_screen.dart';
import '../screens/operator/receive_cargo/operator_package_details_screen.dart';
import '../screens/operator/receive_cargo/operator_receiver_screen.dart';
import '../screens/operator/receive_cargo/operator_payment_screen.dart';
import '../screens/operator/receive_cargo/operator_success_screen.dart';
import '../screens/operator/qr_scanner_message_screen.dart';
import '../screens/operator/operations_hub_screen.dart';
import '../models/operation_model.dart';
import '../screens/operator/kpi_details_screen.dart';
import '../screens/notifications/notification_screen.dart';
import '../screens/payment/payment_screen.dart';
import '../screens/payment/receipt_screen.dart';
import '../screens/profile/profile_screen.dart';
import '../screens/profile/subscreens/personal_information_screen.dart';
import '../screens/profile/subscreens/app_settings_screen.dart';
import '../screens/profile/subscreens/support_help_screen.dart';
import '../screens/profile/subscreens/privacy_policy_screen.dart';
import '../screens/profile/subscreens/terms_conditions_screen.dart';
import '../screens/profile/change_password_screen.dart';
import '../screens/profile/subscreens/notifications_settings_screen.dart';
import '../screens/profile/subscreens/login_security_screen.dart';
import '../screens/profile/subscreens/privacy_permissions_screen.dart';
import '../screens/profile/subscreens/add_place_screen.dart';
import '../screens/profile/subscreens/payment_methods_screen.dart';
import '../screens/profile/subscreens/add_payment_method_screen.dart';
import '../screens/profile/subscreens/legal_document_screen.dart';
import '../screens/cargo/rates_calculator_screen.dart';
import '../screens/cargo/delivery_speed_screen.dart';
import '../screens/cargo/schedule_pickup_screen.dart';
import '../screens/cargo/send_package_screen.dart';
import '../screens/cargo/package_details_screen.dart';
import '../screens/cargo/receiver_screen.dart';
import '../screens/cargo/confirm_order_screen.dart';
import '../screens/cargo/location_search_screen.dart';
import '../screens/cargo/location_confirm_map_screen.dart';
import '../screens/splash/splash_screen.dart';
import '../screens/onboarding/onboarding_screen.dart';
import '../screens/auth/welcome_screen.dart';
import '../screens/auth/verification_screen.dart';
import '../screens/auth/profile_setup_screen.dart';
import '../screens/auth/forgot_password_screen.dart';
import '../screens/cargo/availability_checker_screen.dart';
import '../screens/operator/efficiency_screen.dart';
import '../screens/profile/subscreens/account_deletion_screen.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

GoRouter createRouter(AuthProvider authProvider) {
  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    refreshListenable: authProvider,
    initialLocation: '/',
    redirect: (context, state) {
      final authProvider = context.read<AuthProvider>();
      final status = authProvider.status;
      final isFirstTime = authProvider.isFirstTime;

      final isLoggingIn = state.matchedLocation == '/login';
      final isVerifying = state.matchedLocation == '/verify';
      final isForgotMw = state.matchedLocation == '/forgot-password';
      final isRegistering = state.matchedLocation.startsWith('/register');
      final isWatchingSplash = state.matchedLocation == '/';
      final isOnboarding = state.matchedLocation == '/onboarding';
      final isWelcome = state.matchedLocation == '/welcome';

      if (status == AuthStatus.unknown) return '/';

      if (isFirstTime) {
        if (isOnboarding) return null;
        return '/onboarding';
      }

      if (status == AuthStatus.unauthenticated) {
        if (isLoggingIn || isRegistering || isWelcome || isVerifying || isForgotMw) return null;
        return '/welcome';
      }

      if (status == AuthStatus.authenticated) {
        if (isLoggingIn || isRegistering || isWelcome || isWatchingSplash || isOnboarding) {
          return '/home';
        }
      }

      return null;
    },
    routes: [
      GoRoute(path: '/', builder: (_, _) => const SplashScreen()),
      GoRoute(path: '/onboarding', builder: (_, _) => const OnboardingScreen()),
      GoRoute(path: '/welcome', builder: (_, _) => const WelcomeScreen()),
      // Auth
      GoRoute(path: '/login', builder: (_, _) => const LoginScreen()),
      GoRoute(path: '/register', builder: (_, _) => const RegisterScreen()),
      GoRoute(
        path: '/verify',
        builder: (_, state) =>
            VerificationScreen(phoneNumber: state.extra as String? ?? ''),
      ),
      GoRoute(
        path: '/register/verify',
        builder: (_, state) =>
            VerificationScreen(phoneNumber: state.extra as String? ?? ''),
      ),
      GoRoute(
        path: '/register/setup',
        builder: (_, state) {
          final data = state.extra as Map<String, dynamic>?;
          return ProfileSetupScreen(
            email: data?['email'],
            phone: data?['phone'],
          );
        },
      ),
      GoRoute(
        path: '/forgot-password',
        builder: (_, _) => const ForgotPasswordScreen(),
      ),

      // Main scaffold with bottom nav
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) => MainScaffold(navigationShell: navigationShell),
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(path: '/home', builder: (_, _) => const HomeScreen()),
            ],
          ),
          StatefulShellBranch(
            routes: [
              // This branch is dynamic: /operations for OPERATOR, /track for others
              GoRoute(path: '/operations', builder: (_, _) => const OperationsHubScreen()),
              GoRoute(path: '/track', builder: (_, _) => const TrackScreen()),
            ],
          ),
          StatefulShellBranch(
            routes: [
              // This branch is dynamic: /operator-reports for OPERATOR, /bookings for others
              GoRoute(path: '/operator-reports', builder: (_, _) => const OperatorReportsScreen()),
              GoRoute(
                path: '/bookings', 
                builder: (_, state) {
                  final extra = state.extra as Map<String, dynamic>?;
                  final filter = extra?['filter'] as String?;
                  return BookingsScreen(filter: filter);
                },
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(path: '/profile', builder: (_, _) => const ProfileScreen()),
            ],
          ),
        ],
      ),

      // Profile Subscreens
      GoRoute(
        path: '/profile/personal-info',
        builder: (_, _) => const PersonalInformationScreen(),
      ),
      GoRoute(
        path: '/profile/app-settings',
        builder: (_, _) => const AppSettingsScreen(),
      ),
      GoRoute(
        path: '/profile/support',
        builder: (_, _) => const SupportHelpScreen(),
      ),
      GoRoute(
        path: '/profile/notifications',
        builder: (_, _) => const NotificationsSettingsScreen(),
      ),
      GoRoute(
        path: '/profile/security',
        builder: (_, _) => const LoginSecurityScreen(),
      ),
      GoRoute(
        path: '/profile/printer-settings',
        builder: (_, _) => const PrinterConfigurationScreen(),
      ),
      GoRoute(
        path: '/profile/privacy',
        builder: (_, _) => const PrivacyPermissionsScreen(),
      ),
      GoRoute(
        path: '/profile/delete-account',
        builder: (_, _) => const AccountDeletionScreen(),
      ),
      GoRoute(
        path: '/profile/places/add/:type',
        builder: (_, state) =>
            AddPlaceScreen(placeType: state.pathParameters['type']!),
      ),
      GoRoute(
        path: '/profile/payment-methods',
        builder: (_, _) => const PaymentMethodsScreen(),
      ),
      GoRoute(
        path: '/profile/add-payment-method',
        builder: (_, _) => const AddPaymentMethodScreen(),
      ),
      GoRoute(
        path: '/profile/legal/:type',
        builder: (_, state) {
          final type = state.pathParameters['type']!;
          final title = type == 'terms'
              ? 'Terms & Conditions'
              : 'Privacy Policy';
          return LegalDocumentScreen(title: title);
        },
      ),

      // Cargo flow
      GoRoute(path: '/cargo/send', builder: (_, _) => const SendCargoScreen()),
      GoRoute(
        path: '/cargo/:id/status',
        builder: (_, state) =>
            CargoStatusScreen(cargoId: state.pathParameters['id']!),
      ),
      GoRoute(
        path: '/cargo/:id/payment',
        builder: (context, state) {
          final extra = state.extra as Map<String, dynamic>?;
          return PaymentScreen(
            cargoId: state.pathParameters['id']!,
            initialAmount: extra?['amount'] as double?,
            isOverlay: false,
          );
        },
      ),
      GoRoute(
        path: '/cargo/:id/receipt',
        builder: (_, state) =>
            ReceiptScreen(cargoId: state.pathParameters['id']!),
      ),
      GoRoute(
        path: '/notifications',
        builder: (_, _) => const NotificationScreen(),
      ),
      GoRoute(
        path: '/rates-calculator',
        builder: (_, _) => const RatesCalculatorScreen(),
      ),
      GoRoute(
        path: '/efficiency',
        builder: (_, state) => EfficiencyScreen(metricTitle: state.extra as String? ?? 'Efficiency'),
      ),
      GoRoute(
        path: '/send-package',
        builder: (_, _) => const DeliverySpeedScreen(),
      ),
      GoRoute(
        path: '/schedule-pickup',
        builder: (_, _) => const SchedulePickupScreen(),
      ),
      GoRoute(
        path: '/send-package/vehicle',
        builder: (_, state) {
          final data = state.extra as Map<String, dynamic>? ?? {};
          return SendPackageScreen(
            deliverySpeed: data['deliverySpeed'] as String? ?? 'standard',
            lastMileDelivery: data['lastMileDelivery'] as bool? ?? false,
          );
        },
      ),
      GoRoute(
        path: '/send-package/details',
        builder: (_, state) {
          final data = state.extra as Map<String, dynamic>? ?? {};
          return PackageDetailsScreen(
            pickup: data['pickup'] ?? '',
            delivery: data['delivery'] ?? '',
            vehicle: data['vehicle'] ?? '',
            basePrice: data['price'] as int? ?? 0,
          );
        },
      ),
      GoRoute(
        path: '/send-package/receiver',
        builder: (_, state) {
          final data = state.extra as Map<String, dynamic>? ?? {};
          return ReceiverScreen(
            pickup: data['pickup'] ?? '',
            delivery: data['delivery'] ?? '',
            vehicle: data['vehicle'] ?? '',
            basePrice: data['price'] as int? ?? 0,
            cargoDescription: data['cargoDescription'] ?? '',
            packageName: data['packageName'] ?? '',
            packageValue: data['packageValue'] ?? '',
            condition: data['condition'] ?? '',
            cargoType: data['cargoType'] ?? '',
            urgency: data['urgency'] ?? '',
            packageSize: data['packageSize'] ?? '',
          );
        },
      ),
      GoRoute(
        path: '/send-package/confirm',
        builder: (_, state) {
          final data = state.extra as Map<String, dynamic>? ?? {};
          return ConfirmOrderScreen(
            pickup: data['pickup'] ?? '',
            delivery: data['delivery'] ?? '',
            vehicle: data['vehicle'] ?? '',
            receiverName: data['receiverName'] ?? '',
            receiverPhone: data['receiverPhone'] ?? '',
            total: data['total'] as int? ?? 0,
            receiverPays: data['receiverPays'] as bool? ?? false,
            cargoDescription: data['cargoDescription'] ?? '',
            packageName: data['packageName'] ?? '',
            packageValue: data['packageValue'] ?? '',
            condition: data['condition'] ?? '',
            cargoType: data['cargoType'] ?? '',
            urgency: data['urgency'] ?? '',
            packageSize: data['packageSize'] ?? '',
          );
        },
      ),
      GoRoute(
        path: '/send-package/availability',
        builder: (_, state) {
          final data = state.extra as Map<String, dynamic>? ?? {};
          return AvailabilityCheckerScreen(orderData: data);
        },
      ),
      GoRoute(
        path: '/location-search',
        builder: (_, state) {
          final title = state.extra as String? ?? 'Search Location';
          return LocationSearchScreen(title: title);
        },
      ),
      GoRoute(
        path: '/location-confirm',
        builder: (_, state) {
          final data = state.extra as Map<String, dynamic>? ?? {};
          return LocationConfirmMapScreen(
            title: data['title'] ?? 'Confirm Location',
            initialLocation: data['location'] ?? '',
          );
        },
      ),

      // Recent bookings routes
      GoRoute(
        path: '/bookings/recent',
        builder: (_, _) => const RecentBookingsScreen(),
      ),
      GoRoute(
        path: '/bookings/recent/:id',
        builder: (_, state) {
          final cargo = state.extra as CargoModel?;
          if (cargo == null) {
            // Redirect to list if no cargo data was passed
            return const RecentBookingsScreen();
          }
          return BookingDetailScreen(cargo: cargo);
        },
      ),

      // Track detail routes (outside ShellRoute — full screen)
      GoRoute(
        path: '/track/:id',
        builder: (_, state) {
          final shipment = state.extra as ShipmentData?;
          return ParcelDetailScreen(shipment: shipment ?? mockShipments.first);
        },
      ),
        GoRoute(
          path: '/track/:id/live',
          builder: (_, state) {
            final shipment = state.extra as ShipmentData?;
            return LiveTrackScreen(shipment: shipment ?? mockShipments.first);
          },
        ),

        // Operator Specific Routes
        GoRoute(
          path: '/receive-cargo', // Fallback backwards compat proxy
          builder: (context, state) => const OperatorPackageDetailsScreen(),
        ),
        GoRoute(
          path: '/operator-receive/details',
          builder: (context, state) => const OperatorPackageDetailsScreen(),
        ),
        GoRoute(
          path: '/operator-receive/receiver',
          builder: (context, state) {
            final data = state.extra as Map<String, dynamic>? ?? {};
            return OperatorReceiverScreen(packageData: data);
          },
        ),
        GoRoute(
          path: '/operator-receive/payment',
          builder: (context, state) {
            final data = state.extra as Map<String, dynamic>? ?? {};
            return OperatorPaymentScreen(packageData: data);
          },
        ),
        GoRoute(
          path: '/operator-receive/success',
          builder: (context, state) {
            final data = state.extra as Map<String, dynamic>? ?? {};
            return OperatorSuccessScreen(packageData: data);
          },
        ),
        GoRoute(
          path: '/send-cargo',
          builder: (context, state) => const SendCargoToStationScreen(),
        ),
        GoRoute(
          path: '/deliver-cargo',
          builder: (context, state) => const DeliverCargoScreen(),
        ),
        GoRoute(
          path: '/operator-reports',
          builder: (context, state) => const OperatorReportsScreen(),
        ),
        GoRoute(
          path: '/operator/kpi-details',
          builder: (context, state) {
            final data = state.extra as Map<String, dynamic>? ?? {};
            return KpiDetailsScreen(
              title: data['title'] ?? 'KPI Details',
              value: data['value'] ?? '0',
              timeframe: data['timeframe'] ?? 'Daily',
              color: data['color'] as Color? ?? Colors.blue,
              icon: data['icon'] as Widget? ?? const HugeIcon(icon: HugeIcons.strokeRoundedChartBarLine, color: Colors.blue),
            );
          },
        ),
        GoRoute(
          path: '/change-password',
          builder: (context, state) => const ChangePasswordScreen(),
        ),
        GoRoute(
          path: '/profile/support',
          builder: (context, state) => const SupportHelpScreen(),
        ),
        GoRoute(
          path: '/profile/legal/privacy',
          builder: (context, state) => const PrivacyPolicyScreen(),
        ),
        GoRoute(
          path: '/profile/legal/terms',
          builder: (context, state) => const TermsConditionsScreen(),
        ),
        // Scanner Routes
        GoRoute(
          path: '/scanner',
          builder: (context, state) {
            final operation = state.extra as ParcelOperation? ?? ParcelOperation.view;
            return QrCodeScannerScreen(operation: operation);
          },
        ),
        GoRoute(
          path: '/scanner/message',
          builder: (context, state) {
            final data = state.extra as Map<String, dynamic>? ?? {};
            return QrScannerMessageScreen(
              success: data['success'] as bool? ?? false,
            );
          },
        ),
        GoRoute(
          path: '/operator/scanned-details',
          builder: (context, state) {
            final cargo = state.extra as CargoModel;
            return OperatorScannedDetailsScreen(cargo: cargo);
          },
        ),
      ],
  );
}

// ─── Main Scaffold ─────────────────────────────────────────────────────────────

class MainScaffold extends StatelessWidget {
  final StatefulNavigationShell navigationShell;
  const MainScaffold({super.key, required this.navigationShell});

  List<Map<String, dynamic>> _getTabs(bool isOperator) {
    if (isOperator) {
      return const [
        {
          'label': 'Home',
          'icon': HugeIcons.strokeRoundedHome01,
        },
        {
          'label': 'Operations',
          'icon': HugeIcons.strokeRoundedLayers01,
        },
        {
          'label': 'Reports',
          'icon': HugeIcons.strokeRoundedChartBarLine,
        },
        {
          'label': 'Profile',
          'icon': HugeIcons.strokeRoundedUser,
        },
      ];
    }
    
    return const [
      {
        'label': 'Home',
        'icon': HugeIcons.strokeRoundedHome01,
      },
      {
        'label': 'Track',
        'icon': HugeIcons.strokeRoundedLocation01,
      },
      {
        'label': 'Bookings',
        'icon': HugeIcons.strokeRoundedCalendar03,
      },
      {
        'label': 'You',
        'icon': HugeIcons.strokeRoundedUser,
      },
    ];
  }

  void _onTap(BuildContext context, int index, bool isOperator) {
    // Determine the path to navigate to based on the index and role
    // This ensuring we hit the right routes within the branches
    String path;
    if (isOperator) {
      path = ['/home', '/operations', '/operator-reports', '/profile'][index];
    } else {
      path = ['/home', '/track', '/bookings', '/profile'][index];
    }
    
    context.go(path);
  }

  @override
  Widget build(BuildContext context) {
    final auth = context.watch<AuthProvider>();
    final isOperator = auth.user?.role?.toUpperCase() == 'OPERATOR';
    final tabs = _getTabs(isOperator);
    final currentIndex = navigationShell.currentIndex;

    final theme = Theme.of(context);
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: Container(
        height: 85,
        decoration: BoxDecoration(
          color: AppTheme.cBlackMain, // Solid color instead of glassmorphism
          border: Border(
            top: BorderSide(
              color: Colors.white.withValues(alpha: 0.05),
              width: 1,
            ),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.4),
              blurRadius: 30,
              offset: const Offset(0, -10),
            ),
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: List.generate(tabs.length, (index) {
                    final tab = tabs[index];
                    final isActive = currentIndex == index;
                    return GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () => _onTap(context, index, isOperator),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        decoration: const BoxDecoration(
                          color: Colors.transparent,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            HugeIcon(
                              icon: tab['icon'],
                              color: isActive
                                  ? AppTheme.cPrimary
                                  : const Color(0xFF64748B),
                              size: 24,
                              strokeWidth: isActive ? 2.5 : 1.5,
                            ),
                            const Gap(2),
                            Text(
                              tab['label'],
                              style: GoogleFonts.outfit(
                                fontSize: 11,
                                fontWeight: isActive ? FontWeight.w800 : FontWeight.w600,
                                color: isActive
                                    ? AppTheme.cPrimary
                                    : const Color(0xFF64748B),
                                letterSpacing: 0.2,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ),
      ),
    );
  }
}
