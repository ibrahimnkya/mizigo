import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hugeicons/hugeicons.dart';
import '../../../services/api_service.dart';
import '../../../theme/staff_palette.dart';
import '../../../widgets/staff/staff_settings.dart';

enum LegalDocumentType { terms, privacy }

/// Terms & Conditions / Privacy Policy. Shows the organization's published
/// text when the server has one, otherwise the built-in staff defaults.
class LegalDocumentScreen extends StatefulWidget {
  const LegalDocumentScreen({super.key, required this.type});

  final LegalDocumentType type;

  /// From a route segment: 'terms' → terms, anything else → privacy.
  static LegalDocumentType typeFromPath(String? segment) =>
      segment == 'terms' ? LegalDocumentType.terms : LegalDocumentType.privacy;

  @override
  State<LegalDocumentScreen> createState() => _LegalDocumentScreenState();
}

class _Section {
  const _Section(this.title, this.body, this.icon);
  final String title;
  final String body;
  final List<List<dynamic>> icon;
}

const _termsSections = [
  _Section(
    'Agreement to Terms',
    'By accessing or using the MiziGO Staff application, you agree to comply with and be bound by these Terms and Conditions. If you do not agree, please do not use the app.',
    HugeIcons.strokeRoundedHelpCircle,
  ),
  _Section(
    'Account Usage',
    'MiziGO accounts are assigned to specific staff. You are responsible for keeping your PIN confidential and for all activity that occurs under your account.',
    HugeIcons.strokeRoundedUser,
  ),
  _Section(
    'Operational Integrity',
    'Staff must register parcels accurately, handle payments as per policy, and ensure that all logistics data entered is truthful and verifiable.',
    HugeIcons.strokeRoundedPackage,
  ),
  _Section(
    'Intellectual Property',
    'All content, features and functionality of the application, including logos and trade names, are the exclusive property of MiziGO and its licensors.',
    HugeIcons.strokeRoundedLegalHammer,
  ),
  _Section(
    'Modifications',
    'MiziGO may modify these terms at any time. Your continued use of the app signifies your acceptance of any changes.',
    HugeIcons.strokeRoundedPencilEdit01,
  ),
];

const _privacySections = [
  _Section(
    'Introduction',
    'At MiziGO we take your privacy seriously. This policy explains how we collect, use and protect your information when you use the MiziGO Staff application.',
    HugeIcons.strokeRoundedHelpCircle,
  ),
  _Section(
    'Data Collection',
    'We collect what parcel operations need, including your name, contact details, station information and operational logs, to ensure accountability and service quality.',
    HugeIcons.strokeRoundedUserList,
  ),
  _Section(
    'Bluetooth & Location',
    'Bluetooth and Location are used to connect thermal printers and to identify your station when registering parcels. This data is not shared for marketing purposes.',
    HugeIcons.strokeRoundedLocation01,
  ),
  _Section(
    'Data Security',
    'All data is encrypted in transit and at rest. We use industry-standard security measures to protect against unauthorized access or disclosure.',
    HugeIcons.strokeRoundedShield01,
  ),
  _Section(
    'Contact Us',
    'If you have any questions about this policy, reach our support team through the Support & Help section.',
    HugeIcons.strokeRoundedCustomerService,
  ),
];

class _LegalDocumentScreenState extends State<LegalDocumentScreen> {
  String? _customText;
  bool _loading = true;

  bool get _isTerms => widget.type == LegalDocumentType.terms;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    try {
      final data = await ApiService.getLegalPolicies();
      final text = data[_isTerms ? 'termsAndConditions' : 'privacyPolicy']?.trim() ?? '';
      if (mounted) setState(() => _customText = text.isEmpty ? null : text);
    } catch (_) {
      // Signed out or offline: built-in text below.
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final palette = StaffPalette.of(context);
    final sections = _isTerms ? _termsSections : _privacySections;

    return StaffSettingsScaffold(
      title: _isTerms ? 'Terms & Conditions' : 'Privacy Policy',
      onBack: () => Navigator.pop(context),
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 6, bottom: 12),
          child: Row(
            children: [
              HugeIcon(icon: HugeIcons.strokeRoundedInformationCircle, color: palette.fg(0.6), size: 18),
              const Gap(8),
              Text('Last updated: March 2026', style: GoogleFonts.outfit(fontSize: 14, color: palette.fg(0.6))),
            ],
          ),
        ),
        if (_loading)
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 40),
            child: Center(child: CircularProgressIndicator(strokeWidth: 2, color: kStaffAccent)),
          )
        else if (_customText != null)
          StaffGlassCard(
            padding: const EdgeInsets.all(20),
            child: SelectableText(
              _customText!,
              style: GoogleFonts.outfit(fontSize: 15, height: 1.55, color: palette.fg(0.85)),
            ),
          )
        else
          for (var i = 0; i < sections.length; i++) ...[
            if (i > 0) const Gap(10),
            StaffGlassCard(
              padding: const EdgeInsets.all(20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HugeIcon(icon: sections[i].icon, color: kStaffAccent, size: 24),
                  const Gap(16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${i + 1}. ${sections[i].title}',
                          style: GoogleFonts.outfit(fontSize: 17, fontWeight: FontWeight.w600, color: palette.fg()),
                        ),
                        const Gap(6),
                        Text(
                          sections[i].body,
                          style: GoogleFonts.outfit(fontSize: 15, height: 1.5, color: palette.fg(0.75)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
      ],
    );
  }
}
