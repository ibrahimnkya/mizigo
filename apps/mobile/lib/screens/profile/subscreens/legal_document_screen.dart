import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hugeicons/hugeicons.dart';
import '../../../widgets/profile/premium_settings_components.dart';

class LegalDocumentScreen extends StatelessWidget {
  final String title;

  const LegalDocumentScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: SettingsAppBar(
        title: title,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: (theme.cardTheme.color ?? theme.colorScheme.surface).withValues(alpha: 0.5),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: theme.colorScheme.outline.withValues(alpha: 0.2),
                ),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.info_outline,
                    color: theme.colorScheme.primary,
                    size: 20,
                  ),
                  const Gap(10),
                  Text(
                    'Last Updated: March 2026',
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      color: theme.textTheme.bodyMedium?.color?.withValues(alpha: 0.7),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            const Gap(24),
            
            _buildSection(
              context,
              '1. Introduction',
              'These terms and conditions outline the rules and regulations for the use of Mizigo\'s Mobile Application. By accessing this app we assume you accept these terms and conditions.',
              HugeIcons.strokeRoundedHelpCircle,
            ),
            _buildSection(
              context,
              '2. License',
              'Unless otherwise stated, Mizigo and/or its licensors own the intellectual property rights for all material on Mizigo. All intellectual property rights are reserved.',
              HugeIcons.strokeRoundedLegalHammer,
            ),
            _buildSection(
              context,
              '3. User Responsibilities',
              'You must not:\n• Republish material from Mizigo\n• Sell, rent or sub-license material from Mizigo\n• Reproduce, duplicate or copy material from Mizigo',
              HugeIcons.strokeRoundedUser,
            ),
            _buildSection(
              context,
              '4. Limitation of Liability',
              'In no event shall Mizigo, nor any of its officers, directors, and employees, be held liable for anything arising out of or in any way connected with your use of this app.',
              HugeIcons.strokeRoundedShield01,
            ),
            _buildSection(
              context,
              '5. Modifications',
              'Mizigo is permitted to revise these Terms at any time as it sees fit, and by using this app you are expected to review these Terms on a regular basis.',
              HugeIcons.strokeRoundedPencilEdit01,
            ),
            
            const Gap(40),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(
    BuildContext context,
    String title,
    String content,
    List<List<dynamic>> icon,
  ) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: 24.0),
      child: Container(
        decoration: BoxDecoration(
          color: theme.cardTheme.color ?? theme.colorScheme.surface,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: theme.colorScheme.outline.withValues(alpha: 0.5),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.03),
              blurRadius: 15,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Left Accent Indicator
            Container(
              width: 4,
              height: 48,
              decoration: BoxDecoration(
                color: theme.colorScheme.primary,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const Gap(12),
            // Icon Enclosure
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: theme.colorScheme.primary.withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: HugeIcon(
                  icon: icon,
                  color: theme.colorScheme.primary,
                  size: 20,
                ),
              ),
            ),
            const Gap(16),
            // Text Content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.outfit(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: theme.textTheme.bodyLarge?.color,
                    ),
                  ),
                  const Gap(8),
                  Text(
                    content,
                    style: GoogleFonts.inter(
                      fontSize: 15,
                      color: theme.textTheme.bodyMedium?.color?.withValues(alpha: 0.8),
                      height: 1.55,
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
