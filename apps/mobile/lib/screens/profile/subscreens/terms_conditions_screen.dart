import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hugeicons/hugeicons.dart';
import '../../../widgets/profile/premium_settings_components.dart';
import '../../../services/api_service.dart';

class TermsConditionsScreen extends StatefulWidget {
  const TermsConditionsScreen({super.key});

  @override
  State<TermsConditionsScreen> createState() => _TermsConditionsScreenState();
}

class _TermsConditionsScreenState extends State<TermsConditionsScreen> {
  String? _customTermsText;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadTerms();
  }

  Future<void> _loadTerms() async {
    try {
      final data = await ApiService.getLegalPolicies();
      if (mounted) {
        setState(() {
          if (data['termsAndConditions'] != null && data['termsAndConditions']!.trim().isNotEmpty) {
            _customTermsText = data['termsAndConditions'];
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
        title: 'Terms & Conditions',
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
                          'Effective Date: January 2024',
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
                  if (_customTermsText != null)
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
                        _customTermsText!,
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
                      'Agreement to Terms',
                      'By accessing or using the Mizigo Staff application, you agree to comply with and be bound by these Terms and Conditions. If you do not agree, please do not use the app.',
                      HugeIcons.strokeRoundedLegalDocument02,
                    ),
                    _buildSection(
                      context,
                      'Account Usage',
                      'Mizigo accounts are assigned to specific staff. You are responsible for maintaining the confidentiality of your credentials and for all activities that occur under your account.',
                      HugeIcons.strokeRoundedUser,
                    ),
                    _buildSection(
                      context,
                      'Operational Integrity',
                      'Staff must accurately register parcel, handle payments as per policy, and ensure that all logistics data entered is truthful and verifiable.',
                      HugeIcons.strokeRoundedCheckmarkBadge01,
                    ),
                    _buildSection(
                      context,
                      'Intellectual Property',
                      'All content, features, and functionality of the application, including logos and trade names, are the exclusive property of Mizigo and its licensors.',
                      HugeIcons.strokeRoundedLegalHammer,
                    ),
                    _buildSection(
                      context,
                      'Modifications',
                      'Mizigo reserves the right to modify these terms at any time. Your continued use of the app signifies your acceptance of any changes.',
                      HugeIcons.strokeRoundedPencilEdit01,
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
