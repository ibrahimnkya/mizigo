import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:gap/gap.dart';
import '../../../theme/app_theme.dart';
import '../../../widgets/common/danger_action_sheet.dart';
import '../../../widgets/profile/premium_settings_components.dart';

class AccountDeletionScreen extends StatefulWidget {
  const AccountDeletionScreen({super.key});

  @override
  State<AccountDeletionScreen> createState() => _AccountDeletionScreenState();
}

class _AccountDeletionScreenState extends State<AccountDeletionScreen> {
  String? _selectedReason;
  bool _understandDataLoss = false;
  bool _understandNoRecovery = false;

  final List<String> _reasons = [
    'I have privacy concerns',
    'I found an alternative service',
    'The app is difficult to use',
    'I no longer need this account',
    'Too many notifications',
    'Other',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SettingsAppBar(title: 'Account Security'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppTheme.danger.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(24),
                border: Border.all(color: AppTheme.danger.withValues(alpha: 0.2)),
              ),
              child: Row(
                children: [
                  HugeIcon(icon: HugeIcons.strokeRoundedDelete02, color: AppTheme.danger, size: 32),
                  const Gap(16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Permanent Deletion',
                          style: GoogleFonts.outfit(
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                            color: AppTheme.textPrimary,
                          ),
                        ),
                        const Gap(4),
                        Text(
                          'Your data will be permanently removed after 30 days.',
                          style: GoogleFonts.inter(
                            fontSize: 13,
                            color: AppTheme.textSecondary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Gap(32),
            
            Text(
              'Why are you leaving?',
              style: GoogleFonts.outfit(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: AppTheme.textPrimary,
              ),
            ),
            const Gap(16),
            
            Wrap(
              spacing: 8,
              runSpacing: 12,
              children: _reasons.map((reason) {
                bool isSelected = _selectedReason == reason;
                return GestureDetector(
                  onTap: () => setState(() => _selectedReason = reason),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? AppTheme.cPrimary
                          : AppTheme.surface,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: isSelected
                            ? AppTheme.cPrimary
                            : AppTheme.border,
                      ),
                      boxShadow: isSelected
                          ? null
                          : [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: 0.02),
                                blurRadius: 8,
                                offset: const Offset(0, 2),
                              ),
                            ],
                    ),
                    child: Text(
                      reason,
                      style: GoogleFonts.inter(
                        color: isSelected
                            ? Colors.white
                            : AppTheme.textSecondary,
                        fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                        fontSize: 13,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
            
            const Gap(40),
            
            Text(
              'Consent & Confirmation',
              style: GoogleFonts.outfit(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: AppTheme.textPrimary,
              ),
            ),
            const Gap(16),
            
            _consentTile(
              'I understand that all my operational history, profile data, and earnings records will be permanently deleted.',
              _understandDataLoss,
              (v) => setState(() => _understandDataLoss = v!),
            ),
            const Gap(12),
            _consentTile(
              'I acknowledge that this action is irreversible and I will not be able to recover my account after 30 days.',
              _understandNoRecovery,
              (v) => setState(() => _understandNoRecovery = v!),
            ),
            
            const Gap(48),
            
            SizedBox(
              width: double.infinity,
              height: 58,
              child: FilledButton(
                onPressed: (_selectedReason != null && _understandDataLoss && _understandNoRecovery)
                    ? _processDeletion
                    : null,
                style: FilledButton.styleFrom(
                  backgroundColor: AppTheme.danger,
                  disabledBackgroundColor: AppTheme.danger.withValues(alpha: 0.2),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                ),
                child: Text(
                  'Permanently Delete Account',
                  style: GoogleFonts.inter(fontWeight: FontWeight.w800, color: Colors.white),
                ),
              ),
            ),
            const Gap(16),
            SizedBox(
              width: double.infinity,
              height: 58,
              child: OutlinedButton(
                onPressed: () => Navigator.pop(context),
                style: OutlinedButton.styleFrom(
                  side: BorderSide(
                    color: AppTheme.border,
                  ),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                ),
                child: Text(
                  'Deactivate Account Instead',
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w700,
                    color: const Color(0xFF475569),
                  ),
                ),
              ),
            ),
            const Gap(32),
          ],
        ),
      ),
    );
  }

  Widget _consentTile(String text, bool value, ValueChanged<bool?> onChanged) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
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
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Theme(
            data: Theme.of(context).copyWith(
              unselectedWidgetColor: const Color(0xFFCBD5E1),
            ),
            child: SizedBox(
              width: 24,
              height: 24,
              child: Checkbox(
                value: value,
                onChanged: onChanged,
                activeColor: AppTheme.danger,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
              ),
            ),
          ),
          const Gap(12),
          Expanded(
            child: Text(
              text,
              style: GoogleFonts.inter(
                fontSize: 13,
                color: const Color(0xFF475569),
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _processDeletion() {
    DangerActionBottomSheet.show(
      context: context,
      title: 'Final Confirmation',
      message:
          'This is irreversible. Your account and all associated data will be permanently deleted after 30 days. There is no way to undo this action.',
      confirmText: 'Delete My Account',
      cancelText: 'Cancel',
      onConfirm: () {
        // Final deletion logic goes here
        Navigator.pop(context);
      },
    );
  }
}
