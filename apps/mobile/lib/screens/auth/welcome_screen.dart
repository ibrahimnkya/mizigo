import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gap/gap.dart';
import 'package:flutter/services.dart';
import 'package:hugeicons/hugeicons.dart';


class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  void _showFaqModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height * 0.75,
        decoration: const BoxDecoration(
          color: Color(0xFF0F172A),
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Frequently Asked Questions',
                  style: GoogleFonts.outfit(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.close, color: Colors.white54),
                ),
              ],
            ),
            const Gap(16),
            Expanded(
              child: ListView(
                children: [
                  _faqItem(
                    'How do I track my parcel?',
                    'You can track your parcel by entering your tracking number on the "Track" screen from the home dashboard.',
                  ),
                  _faqItem(
                    'What are the shipping rates?',
                    'Shipping rates vary based on weight, dimensions, and destination. Use our rate calculator on the website for an exact quote.',
                  ),
                  _faqItem(
                    'How long does delivery take?',
                    'Standard delivery typically takes 2-5 business days. Express options are available for same-day or next-day delivery.',
                  ),
                  _faqItem(
                    'Where can I find more help?',
                    'For more detailed help and support, please visit our help center on our website.',
                  ),
                ],
              ),
            ),
            const Gap(16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {}, // Link to website
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF3B82F6),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  'Visit Website for More FAQ\'s',
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _faqItem(String question, String answer) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            question,
            style: GoogleFonts.inter(
              fontWeight: FontWeight.w600,
              fontSize: 16,
              color: Colors.white,
            ),
          ),
          const Gap(4),
          Text(
            answer,
            style: GoogleFonts.inter(
              fontSize: 14,
              color: Colors.white60,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        backgroundColor: const Color(0xFF0F172A), // Premium dark navy
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return SingleChildScrollView(
                      physics: const ClampingScrollPhysics(),
                      child: ConstrainedBox(
                        constraints: BoxConstraints(minHeight: constraints.maxHeight),
                        child: IntrinsicHeight(
                          child: Column(
                            children: [
                              // Top App Bar area
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    IconButton(
                                      icon: const HugeIcon(
                                        icon: HugeIcons.strokeRoundedInformationCircle,
                                        color: Colors.white,
                                        size: 28,
                                      ),
                                      onPressed: () => _showFaqModal(context),
                                    ),
                                  ],
                                ),
                              ),
                            
                            const Spacer(flex: 2),
                            
                            // Logo
                            SizedBox(
                              width: 90,
                              height: 90,
                              child: Center(
                                child: SizedBox(
                                  width: 60,
                                  height: 60,
                                  child: Image.asset(
                                    'assets/images/logo_icon.png',
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                            ),
                            
                            const Gap(40),
                            
                            // Welcome Text Asset
                            SizedBox(
                              height: 40,
                              child: Image.asset(
                                'assets/images/logo_text.png',
                                fit: BoxFit.contain,
                                color: Colors.white,
                              ),
                            ),
                            
                            const Gap(16),
                            
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 48.0),
                              child: Text(
                                'Start booking, tracking, and managing your shipments in seconds.',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.inter(
                                  fontSize: 15,
                                  color: Colors.white.withValues(alpha: 0.6),
                                  height: 1.6,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            
                            const Spacer(flex: 3),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            
            // Bottom CTA & Terms
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 8, 24, 24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _AuthButton(
                    text: 'Get Started',
                    icon: HugeIcons.strokeRoundedArrowRight01,
                    backgroundColor: const Color(0xFF3B82F6),
                    textColor: Colors.white,
                    iconColor: Colors.white,
                    onPressed: () => context.push('/login'),
                  ),
                  const Gap(16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        style: GoogleFonts.inter(
                          fontSize: 12.5,
                          color: Colors.white.withValues(alpha: 0.5),
                          height: 1.6,
                          letterSpacing: -0.1,
                        ),
                        children: [
                          const TextSpan(text: 'By getting started, you agree to MiziGo\'s '),
                          TextSpan(
                            text: 'Terms of Service',
                            style: const TextStyle(
                              color: Color(0xFF3B82F6),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const TextSpan(text: ' and confirm that you\'ve read our '),
                          TextSpan(
                            text: 'Privacy Policy',
                            style: const TextStyle(
                              color: Color(0xFF3B82F6),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
   );
  }
}

class _AuthButton extends StatelessWidget {
  final String text;
  final List<List<dynamic>> icon;
  final Color backgroundColor;
  final Color textColor;
  final Color iconColor;
  final VoidCallback onPressed;

  const _AuthButton({
    required this.text,
    required this.icon,
    required this.backgroundColor,
    required this.textColor,
    required this.iconColor,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 58,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: textColor,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          splashFactory: InkRipple.splashFactory,
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            Text(
              text,
              style: GoogleFonts.inter(
                fontSize: 17,
                fontWeight: FontWeight.w600,
                color: textColor,
                letterSpacing: -0.2,
              ),
            ),
            const Gap(8),
            HugeIcon(icon: icon, color: iconColor, size: 24),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
