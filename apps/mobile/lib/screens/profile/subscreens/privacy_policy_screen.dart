import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';
import 'package:mizigo/theme/app_theme.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.cBlackMain,
      body: Column(
        children: [
          // Header
          Container(
            padding: const EdgeInsets.fromLTRB(20, 60, 20, 24),
            decoration: const BoxDecoration(
              color: Color(0xFF0F172A),
            ),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () => context.pop(),
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.05),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(Icons.arrow_back, color: Colors.white, size: 20),
                  ),
                ),
                const Gap(16),
                Text(
                  'Privacy Policy',
                  style: GoogleFonts.outfit(
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),

          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Last Updated: March 2024',
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      color: const Color(0xFF64748B),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Gap(24),
                  
                  _buildSection(
                    'Introduction',
                    'At Mizigo, we take your privacy seriously. This Privacy Policy explains how we collect, use, and protect your information when you use our Mizigo Operator application.',
                  ),
                  _buildSection(
                    'Data Collection',
                    'We collect information necessary for cargo operations, including your name, contact details, station information, and operational logs to ensure accountability and service quality.',
                  ),
                  _buildSection(
                    'Bluetooth & Location',
                    'The app requires Bluetooth and Location permissions specifically for connecting to thermal printers and identifying the station location for cargo registration. This data is not shared for marketing purposes.',
                  ),
                  _buildSection(
                    'Data Security',
                    'All data is encrypted in transit and at rest. We implement industry-standard security measures to protect against unauthorized access or disclosure.',
                  ),
                  _buildSection(
                    'Contact Us',
                    'If you have any questions about this policy, please reach out to our support team through the Support & Help section.',
                  ),
                  
                  const Gap(40),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSection(String title, String content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.outfit(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
        const Gap(12),
        Text(
          content,
          style: GoogleFonts.inter(
            fontSize: 15,
            color: Colors.white70,
            height: 1.6,
          ),
        ),
        const Gap(32),
      ],
    );
  }
}
