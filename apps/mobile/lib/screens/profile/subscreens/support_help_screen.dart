import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../theme/staff_palette.dart';
import '../../../widgets/profile/premium_settings_components.dart';
import '../../../widgets/staff/staff_settings.dart';

/// Support & Help — searchable common questions and direct contact options.
class SupportHelpScreen extends StatefulWidget {
  const SupportHelpScreen({super.key});

  @override
  State<SupportHelpScreen> createState() => _SupportHelpScreenState();
}

// Same contact details printed on customer receipts.
const _supportPhone = '0736699593';
const _supportPhoneDisplay = '0736 699 593';
const _supportEmail = 'support@mizigo.app';

class _Faq {
  const _Faq(this.icon, this.question, this.answer);
  final List<List<dynamic>> icon;
  final String question;
  final String answer;
}

const _faqs = [
  _Faq(
    HugeIcons.strokeRoundedPackageReceive,
    'How do I receive a parcel?',
    'On Home, tap Receive. Enter or scan the parcel details, confirm the payment, then print the receipt and label.',
  ),
  _Faq(
    HugeIcons.strokeRoundedPackageDelivered,
    'How do I deliver a parcel?',
    'On Home, tap Deliver and scan the parcel QR code or enter its number, then confirm the receiver before handing it over.',
  ),
  _Faq(
    HugeIcons.strokeRoundedPrinter,
    'My printer won’t connect',
    'Make sure Bluetooth is on and the printer is paired in your phone’s Bluetooth settings. Then open You › Printer Settings, tap Find Printers and print a test page.',
  ),
  _Faq(
    HugeIcons.strokeRoundedSecurityPassword,
    'I forgot my PIN',
    'Sign out, then tap Forgot PIN? on the login screen. We’ll text you a temporary PIN, and you’ll set a new one right after signing in.',
  ),
  _Faq(
    HugeIcons.strokeRoundedUserList,
    'My station or role is wrong',
    'Your station and role are set by your administrator. Contact them or our support team to have them updated.',
  ),
];

class _SupportHelpScreenState extends State<SupportHelpScreen> {
  final _searchController = TextEditingController();
  int? _expanded;

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Future<void> _launch(Uri uri) async {
    var ok = false;
    try {
      ok = await launchUrl(uri);
    } catch (_) {}
    if (!ok && mounted) MizigoToasts.showError(context, 'No app available to open this');
  }

  @override
  Widget build(BuildContext context) {
    final palette = StaffPalette.of(context);
    final query = _searchController.text.trim().toLowerCase();
    final results = [
      for (var i = 0; i < _faqs.length; i++)
        if (query.isEmpty ||
            _faqs[i].question.toLowerCase().contains(query) ||
            _faqs[i].answer.toLowerCase().contains(query))
          i,
    ];

    return StaffSettingsScaffold(
      title: 'Support & Help',
      onBack: () => Navigator.pop(context),
      children: [
        StaffTextField(
          label: 'Search',
          hint: 'Search for help…',
          controller: _searchController,
          icon: HugeIcons.strokeRoundedSearch01,
          textInputAction: TextInputAction.search,
          onChanged: (_) => setState(() => _expanded = null),
        ),
        const Gap(16),
        StaffGlassCard(
          title: 'Common Questions',
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
          child: results.isEmpty
              ? Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: Text(
                    'No answers match “${_searchController.text.trim()}”. Contact us below.',
                    style: GoogleFonts.outfit(fontSize: 15, color: palette.fg(0.6)),
                  ),
                )
              : Column(
                  children: [
                    for (var n = 0; n < results.length; n++) ...[
                      if (n > 0) const StaffDivider(),
                      _FaqTile(
                        faq: _faqs[results[n]],
                        expanded: _expanded == results[n],
                        onTap: () => setState(() => _expanded = _expanded == results[n] ? null : results[n]),
                      ),
                    ],
                  ],
                ),
        ),
        const Gap(10),
        StaffGlassCard(
          title: 'Contact Support',
          subtitle: 'Can’t find what you need? We’re happy to help.',
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
          child: Column(
            children: [
              StaffSettingsTile(
                icon: HugeIcons.strokeRoundedCall,
                title: 'Call us',
                value: _supportPhoneDisplay,
                onTap: () => _launch(Uri(scheme: 'tel', path: _supportPhone)),
              ),
              const StaffDivider(),
              StaffSettingsTile(
                icon: HugeIcons.strokeRoundedMail01,
                title: 'Email',
                value: _supportEmail,
                onTap: () => _launch(Uri(scheme: 'mailto', path: _supportEmail, query: 'subject=MiziGO Staff support')),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _FaqTile extends StatelessWidget {
  const _FaqTile({required this.faq, required this.expanded, required this.onTap});

  final _Faq faq;
  final bool expanded;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final palette = StaffPalette.of(context);
    return Semantics(
      expanded: expanded,
      button: true,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  HugeIcon(icon: faq.icon, color: palette.fg(), size: 24),
                  const Gap(20),
                  Expanded(
                    child: Text(faq.question, style: GoogleFonts.outfit(fontSize: 17, color: palette.fg())),
                  ),
                  AnimatedRotation(
                    turns: expanded ? 0.25 : 0,
                    duration: const Duration(milliseconds: 180),
                    child: HugeIcon(icon: HugeIcons.strokeRoundedArrowRight01, color: palette.fg(), size: 20),
                  ),
                ],
              ),
              AnimatedSize(
                duration: const Duration(milliseconds: 180),
                curve: Curves.easeOut,
                alignment: Alignment.topCenter,
                child: expanded
                    ? Padding(
                        padding: const EdgeInsets.only(left: 44, top: 10),
                        child: Text(
                          faq.answer,
                          style: GoogleFonts.outfit(fontSize: 15, height: 1.5, color: palette.fg(0.75)),
                        ),
                      )
                    : const SizedBox(width: double.infinity),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
