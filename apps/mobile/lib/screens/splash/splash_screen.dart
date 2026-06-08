import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gap/gap.dart';
import 'package:flutter/services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 2500), () {
      if (mounted) {
        context.go('/welcome'); // AppRouter will intercept and appropriately redirect based on state
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        backgroundColor: const Color(0xFF0F172A),
        body: Stack(
          children: [
            // Center Logo
            Center(
              child: SizedBox(
                width: 140,
                height: 140,
                child: Center(
                  child: SizedBox(
                    width: 90,
                    height: 90,
                    child: Image.asset(
                      'assets/images/logo_icon.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ),
          
          // Bottom Branding
          Positioned(
            bottom: 60,
            left: 0,
            right: 0,
            child: Column(
              children: [
                // "MiziGO" Text Asset
                SizedBox(
                  height: 50,
                  child: Image.asset(
                    'assets/images/logo_text.png',
                    fit: BoxFit.contain,
                    color: Colors.white,
                  ),
                ),
                Gap(8),
                // Tagline
                Text(
                  'Book • Track • Deliver',
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.white.withValues(alpha: 0.6),
                    letterSpacing: 0.5,
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
