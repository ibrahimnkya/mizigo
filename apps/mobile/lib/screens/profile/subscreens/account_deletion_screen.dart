import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:gap/gap.dart';
import '../../../theme/app_theme.dart';

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
      backgroundColor: AppTheme.cBlackMain,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const HugeIcon(icon: HugeIcons.strokeRoundedArrowLeft01, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Account Security',
          style: GoogleFonts.outfit(fontSize: 20, fontWeight: FontWeight.w700, color: Colors.white),
        ),
      ),
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
                const HugeIcon(icon: HugeIcons.strokeRoundedDelete02, color: AppTheme.danger, size: 32),
                const Gap(16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Permanent Deletion',
                        style: GoogleFonts.outfit(fontSize: 18, fontWeight: FontWeight.w800, color: Colors.white),
                      ),
                      const Gap(4),
                      Text(
                        'Your data will be permanently removed after 30 days.',
                        style: GoogleFonts.inter(fontSize: 13, color: Colors.white60),
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
            style: GoogleFonts.outfit(fontSize: 18, fontWeight: FontWeight.w700, color: Colors.white),
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
                    color: isSelected ? const Color(0xFF3B82F6) : const Color(0xFF1E293B),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: isSelected ? const Color(0xFF3B82F6) : Colors.white.withValues(alpha: 0.05)),
                  ),
                  child: Text(
                    reason,
                    style: GoogleFonts.inter(
                      color: isSelected ? Colors.white : Colors.white70,
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
            style: GoogleFonts.outfit(fontSize: 18, fontWeight: FontWeight.w700, color: Colors.white),
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
                side: BorderSide(color: Colors.white.withValues(alpha: 0.1)),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              ),
              child: Text(
                'Deactivate Account Instead',
                style: GoogleFonts.inter(fontWeight: FontWeight.w700, color: Colors.white70),
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
        color: const Color(0xFF1E293B).withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withValues(alpha: 0.05)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Theme(
            data: Theme.of(context).copyWith(unselectedWidgetColor: Colors.white24),
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
              style: GoogleFonts.inter(fontSize: 13, color: Colors.white70, height: 1.5),
            ),
          ),
        ],
      ),
    );
  }

  void _processDeletion() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xFF0F172A),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
        title: Text('Last Step', style: GoogleFonts.outfit(fontWeight: FontWeight.w800, color: Colors.white)),
        content: Text(
          'To ensure security, please confirm that you wish to delete account @xxxx. This cannot be reversed.',
          style: GoogleFonts.inter(color: Colors.white60),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel', style: GoogleFonts.inter(color: Colors.white38)),
          ),
          TextButton(
            onPressed: () {
              // Final logic would go here
              Navigator.pop(context);
              Navigator.pop(context);
            },
            child: Text('Confirm Deletion', style: GoogleFonts.inter(color: AppTheme.danger, fontWeight: FontWeight.w800)),
          ),
        ],
      ),
    );
  }
}
