import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hugeicons/hugeicons.dart';
import '../../../theme/app_theme.dart';
import '../../../widgets/profile/premium_settings_components.dart';

class SupportHelpScreen extends StatelessWidget {
  const SupportHelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SettingsAppBar(title: 'Support & Help'),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Search Support
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      color: AppTheme.surface,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: AppTheme.border,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.02),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: TextField(
                      style: GoogleFonts.inter(
                        color: AppTheme.textPrimary,
                      ),
                      decoration: InputDecoration(
                        hintText: 'Search for help...',
                        hintStyle: GoogleFonts.inter(
                          color: AppTheme.textMuted,
                        ),
                        border: InputBorder.none,
                        icon: HugeIcon(
                          icon: HugeIcons.strokeRoundedSearch01,
                          color: AppTheme.textSecondary,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                  const Gap(32),

                  Text(
                    'POPULAR TOPICS',
                    style: GoogleFonts.outfit(
                      fontSize: 13,
                      fontWeight: FontWeight.w800,
                      color: const Color(0xFF64748B),
                      letterSpacing: 1.2,
                    ),
                  ),
                  const Gap(16),
                  _buildTopicItem(
                    context,
                    icon: HugeIcons.strokeRoundedPackageReceive,
                    title: 'How to receive parcel?',
                    onTap: () {},
                  ),
                  _buildTopicItem(
                    context,
                    icon: HugeIcons.strokeRoundedPrinter,
                    title: 'Printer connection issues',
                    onTap: () {},
                  ),
                  _buildTopicItem(
                    context,
                    icon: HugeIcons.strokeRoundedSecurityPassword,
                    title: 'Resetting your password',
                    onTap: () {},
                  ),
                  _buildTopicItem(
                    context,
                    icon: HugeIcons.strokeRoundedUserList,
                    title: 'Account verification',
                    onTap: () {},
                  ),

                  const Gap(32),
                  Text(
                    'SUPPORT TICKETS',
                    style: GoogleFonts.outfit(
                      fontSize: 13,
                      fontWeight: FontWeight.w800,
                      color: const Color(0xFF64748B),
                      letterSpacing: 1.2,
                    ),
                  ),
                  const Gap(16),
                  
                  // Empty State for Tickets
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(32),
                    decoration: BoxDecoration(
                      color: AppTheme.surface,
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(
                        color: AppTheme.border,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.02),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: AppTheme.cPrimary.withValues(alpha: 0.1),
                            shape: BoxShape.circle,
                          ),
                          child: HugeIcon(
                            icon: HugeIcons.strokeRoundedMessageQuestion,
                            color: AppTheme.cPrimary,
                            size: 32,
                          ),
                        ),
                        const Gap(16),
                        Text(
                          'No Active Tickets',
                          style: GoogleFonts.outfit(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: AppTheme.textPrimary,
                          ),
                        ),
                        const Gap(8),
                        Text(
                          'You haven\'t raised any support tickets yet.',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.inter(
                            fontSize: 14,
                            color: AppTheme.textSecondary,
                          ),
                        ),
                        const Gap(24),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppTheme.cPrimary,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            elevation: 0,
                          ),
                          child: Text(
                            'Create New Ticket',
                            style: GoogleFonts.outfit(fontWeight: FontWeight.w700),
                          ),
                        ),
                      ],
                    ),
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

  Widget _buildTopicItem(
    BuildContext context, {
    required dynamic icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: AppTheme.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppTheme.border,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.02),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ListTile(
        onTap: onTap,
        leading: HugeIcon(icon: icon, color: AppTheme.cPrimary, size: 20),
        title: Text(
          title,
          style: GoogleFonts.inter(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: AppTheme.textPrimary,
          ),
        ),
        trailing: const HugeIcon(
          icon: HugeIcons.strokeRoundedArrowRight01,
          color: Color(0xFF94A3B8),
          size: 20,
        ),
      ),
    );
  }
}
