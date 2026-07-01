import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';

import '../../providers/scanner_provider.dart';
import '../../models/operation_model.dart';
import '../../widgets/common/neo_container.dart';

class QrScannerMessageScreen extends StatelessWidget {
  final bool success;
  const QrScannerMessageScreen({super.key, required this.success});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scannerProvider = context.watch<ScannerProvider>();
    final operation = scannerProvider.currentOperation;
    final parcel = scannerProvider.scannedParcel;
    final error = scannerProvider.error;

    final isCustomTheme = theme.colorScheme.primary.toARGB32() == 0xFF670E1E;
    final successColor = isCustomTheme ? theme.colorScheme.secondary : const Color(0xFF10B981);
    final failureColor = isCustomTheme ? theme.colorScheme.primary : const Color(0xFFEF4444);
    final activeColor = success ? successColor : failureColor;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Result Icon
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: activeColor.withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: HugeIcon(
                    icon: success 
                      ? HugeIcons.strokeRoundedCheckmarkCircle01 
                      : HugeIcons.strokeRoundedCancelCircle,
                    color: activeColor,
                    size: 60,
                  ),
                ),
              ),
              const Gap(32),
 
              // Result Message
              Text(
                success ? 'Operation Successful' : 'Scan Failed',
                style: GoogleFonts.outfit(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: theme.textTheme.bodyLarge?.color ?? Colors.white,
                ),
              ),
              const Gap(12),
              Text(
                success 
                  ? (operation?.successMessage ?? 'The operation was completed successfully.')
                  : (error ?? 'We couldn\'t find a parcel matching this QR code.'),
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(
                  fontSize: 16,
                  color: theme.textTheme.bodyMedium?.color?.withValues(alpha: 0.7) ?? const Color(0xFF64748B),
                ),
              ),
              const Gap(48),
 
              // Detail Card (if success)
              if (success && parcel != null)
                NeoContainer(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      _buildDetailRow(
                        theme, 
                        'Tracking ID', 
                        parcel.id, 
                        HugeIcons.strokeRoundedQrCode
                      ),
                      const Divider(height: 32),
                      _buildDetailRow(
                        theme, 
                        'Receiver', 
                        parcel.receiverName, 
                        HugeIcons.strokeRoundedUser
                      ),
                      const Divider(height: 32),
                      _buildDetailRow(
                        theme, 
                        'Destination', 
                        parcel.toAddress, 
                        HugeIcons.strokeRoundedLocation01
                      ),
                    ],
                  ),
                ),
 
              const Gap(40),
 
              // Actions
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => context.pushReplacement('/home'),
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        side: BorderSide(
                          color: theme.colorScheme.outline,
                        ),
                      ),
                      child: Text(
                        'Go Home',
                        style: GoogleFonts.outfit(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: theme.textTheme.bodyLarge?.color ?? Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const Gap(16),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        scannerProvider.reset();
                        context.pushReplacement('/scanner', extra: operation);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: theme.colorScheme.primary,
                        foregroundColor: theme.colorScheme.onPrimary,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        elevation: 0,
                      ),
                      child: Text(
                        'Scan Next',
                        style: GoogleFonts.outfit(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDetailRow(ThemeData theme, String label, String value, dynamic icon) {
    return Row(
      children: [
        HugeIcon(
          icon: icon,
          color: theme.colorScheme.primary,
          size: 20,
        ),
        const Gap(12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: GoogleFonts.inter(
                fontSize: 12,
                color: theme.textTheme.bodySmall?.color ?? const Color(0xFF64748B),
              ),
            ),
            Text(
              value,
              style: GoogleFonts.outfit(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: theme.textTheme.bodyLarge?.color ?? Colors.white,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
