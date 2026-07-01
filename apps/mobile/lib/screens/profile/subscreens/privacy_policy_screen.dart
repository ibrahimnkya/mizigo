import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hugeicons/hugeicons.dart';
import '../../../widgets/profile/premium_settings_components.dart';
import '../../../services/api_service.dart';

class PrivacyPolicyScreen extends StatefulWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  State<PrivacyPolicyScreen> createState() => _PrivacyPolicyScreenState();
}

class _PrivacyPolicyScreenState extends State<PrivacyPolicyScreen> {
  String? _customPrivacyText;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadPolicy();
  }

  Future<void> _loadPolicy() async {
    try {
      final data = await ApiService.getLegalPolicies();
      if (mounted) {
        setState(() {
          if (data['privacyPolicy'] != null && data['privacyPolicy']!.trim().isNotEmpty) {
            _customPrivacyText = data['privacyPolicy'];
          }
          _isLoading = false;
        });
      }
    } catch (_) {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: const SettingsAppBar(
        title: 'Privacy Policy',
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
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
                  if (_customPrivacyText != null)
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: theme.cardTheme.color ?? theme.colorScheme.surface,
                        borderRadius: BorderRadius.circular(24),
                        border: Border.all(
                          color: theme.colorScheme.outline.withValues(alpha: 0.5),
                        ),
                      ),
                      child: Text(
                        _customPrivacyText!,
                        style: GoogleFonts.inter(
                          fontSize: 15,
                          height: 1.6,
                          color: theme.textTheme.bodyMedium?.color,
                        ),
                      ),
                    )
                  else ...[
                    _buildSection(
                      context,
                      'Introduction',
                      'At Mizigo, we take your privacy seriously. This Privacy Policy explains how we collect, use, and protect your information when you use our Mizigo Staff application.',
                      HugeIcons.strokeRoundedHelpCircle,
                    ),
                    _buildSection(
                      context,
                      'Data Collection',
                      'We collect information necessary for parcel operations, including your name, contact details, station information, and operational logs to ensure accountability and service quality.',
                      HugeIcons.strokeRoundedUserList,
                    ),
                    _buildSection(
                      context,
                      'Bluetooth & Location',
                      'The app requires Bluetooth and Location permissions specifically for connecting to thermal printers and identifying the station location for parcel registration. This data is not shared for marketing purposes.',
                      HugeIcons.strokeRoundedLocation01,
                    ),
                    _buildSection(
                      context,
                      'Data Security',
                      'All data is encrypted in transit and at rest. We implement industry-standard security measures to protect against unauthorized access or disclosure.',
                      HugeIcons.strokeRoundedShield01,
                    ),
                    _buildSection(
                      context,
                      'Contact Us',
                      'If you have any questions about this policy, please reach out to our support team through the Support & Help section.',
                      HugeIcons.strokeRoundedCustomerService,
                    ),
                  ],
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
            Container(
              width: 4,
              height: 48,
              decoration: BoxDecoration(
                color: theme.colorScheme.primary,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const Gap(12),
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
                      fontSize: 14,
                      height: 1.5,
                      color: theme.textTheme.bodyMedium?.color?.withValues(alpha: 0.7),
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
