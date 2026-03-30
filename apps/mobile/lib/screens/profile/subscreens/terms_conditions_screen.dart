import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';
import 'package:mizigo/theme/app_theme.dart';

class TermsConditionsScreen extends StatelessWidget {
  const TermsConditionsScreen({super.key});

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
                  'Terms & Conditions',
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
                    'Effective Date: January 2024',
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      color: const Color(0xFF64748B),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Gap(24),
                  
                  _buildSection(
                    'Agreement to Terms',
                    'By accessing or using the Mizigo Operator application, you agree to comply with and be bound by these Terms and Conditions. If you do not agree, please do not use the app.',
                  ),
                  _buildSection(
                    'Account Usage',
                    'Mizigo accounts are assigned to specific operators. You are responsible for maintaining the confidentiality of your credentials and for all activities that occur under your account.',
                  ),
                  _buildSection(
                    'Operational Integrity',
                    'Operators must accurately register cargo, handle payments as per policy, and ensure that all logistics data entered is truthful and verifiable.',
                  ),
                  _buildSection(
                    'Intellectual Property',
                    'All content, features, and functionality of the application, including logos and trade names, are the exclusive property of Mizigo and its licensors.',
                  ),
                  _buildSection(
                    'Modifications',
                    'Mizigo reserves the right to modify these terms at any time. Your continued use of the app signifies your acceptance of any changes.',
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
