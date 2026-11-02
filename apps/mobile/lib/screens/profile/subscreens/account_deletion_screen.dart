import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hugeicons/hugeicons.dart';
import '../../../theme/staff_palette.dart';
import '../../../widgets/staff/staff_settings.dart';

/// Delete Account — reason, two acknowledgements, then a final confirmation.
class AccountDeletionScreen extends StatefulWidget {
  const AccountDeletionScreen({super.key});

  @override
  State<AccountDeletionScreen> createState() => _AccountDeletionScreenState();
}

class _AccountDeletionScreenState extends State<AccountDeletionScreen> {
  String? _selectedReason;
  bool _understandDataLoss = false;
  bool _understandNoRecovery = false;

  static const _reasons = [
    'I have privacy concerns',
    'I found an alternative service',
    'The app is difficult to use',
    'I no longer need this account',
    'Too many notifications',
    'Other',
  ];

  bool get _canDelete => _selectedReason != null && _understandDataLoss && _understandNoRecovery;

  Future<void> _confirmDeletion() async {
    await showStaffConfirmSheet(
      context,
      title: 'Final Confirmation',
      message:
          'This is irreversible. Your account and all associated data will be permanently deleted after 30 days. There is no way to undo this.',
      confirmText: 'Delete My Account',
      danger: true,
    );
    // Account deletion isn't connected to the API yet.
  }

  @override
  Widget build(BuildContext context) {
    final palette = StaffPalette.of(context);

    return StaffSettingsScaffold(
      title: 'Delete Account',
      onBack: () => Navigator.pop(context),
      children: [
        Container(
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            color: kStaffDanger.withValues(alpha: 0.12),
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: kStaffDanger.withValues(alpha: 0.4)),
          ),
          child: Row(
            children: [
              const HugeIcon(icon: HugeIcons.strokeRoundedDelete02, color: kStaffDanger, size: 30),
              const Gap(16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Permanent Deletion',
                      style: GoogleFonts.outfit(fontSize: 18, fontWeight: FontWeight.w700, color: kStaffDanger),
                    ),
                    const Gap(2),
                    Text(
                      'Your data will be permanently removed after 30 days.',
                      style: GoogleFonts.outfit(fontSize: 14, height: 1.35, color: palette.fg(0.75)),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const Gap(10),
        StaffGlassCard(
          title: 'Why are you leaving?',
          child: Wrap(
            spacing: 8,
            runSpacing: 10,
            children: [
              for (final reason in _reasons)
                StaffChoiceChip(
                  label: reason,
                  selected: _selectedReason == reason,
                  onTap: () => setState(() => _selectedReason = reason),
                ),
            ],
          ),
        ),
        const Gap(10),
        StaffGlassCard(
          title: 'Consent & Confirmation',
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 10),
          child: Column(
            children: [
              StaffCheckboxTile(
                text: 'I understand that all my operational history, profile data and records will be permanently deleted.',
                value: _understandDataLoss,
                activeColor: kStaffDanger,
                onChanged: (v) => setState(() => _understandDataLoss = v),
              ),
              StaffCheckboxTile(
                text: 'I acknowledge that this is irreversible and I won’t be able to recover my account after 30 days.',
                value: _understandNoRecovery,
                activeColor: kStaffDanger,
                onChanged: (v) => setState(() => _understandNoRecovery = v),
              ),
            ],
          ),
        ),
        const Gap(24),
        StaffButton(
          label: 'Permanently Delete Account',
          color: kStaffDanger,
          onPressed: _canDelete ? _confirmDeletion : null,
        ),
        const Gap(10),
        StaffButton(
          label: 'Keep My Account',
          color: palette.fg(0.7),
          outlined: true,
          onPressed: () => Navigator.pop(context),
        ),
      ],
    );
  }
}
