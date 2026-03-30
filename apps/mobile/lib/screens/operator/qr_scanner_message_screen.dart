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
    final scannerProvider = context.watch<ScannerProvider>();
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final operation = scannerProvider.currentOperation;
    final cargo = scannerProvider.scannedCargo;
    final error = scannerProvider.error;

    return Scaffold(
      backgroundColor: isDark ? const Color(0xFF111827) : Colors.white,
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
                  color: success 
                    ? const Color(0xFF10B981).withValues(alpha: 0.1) 
                    : const Color(0xFFEF4444).withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: HugeIcon(
                    icon: success 
                      ? HugeIcons.strokeRoundedCheckmarkCircle01 
                      : HugeIcons.strokeRoundedCancelCircle,
                    color: success ? const Color(0xFF10B981) : const Color(0xFFEF4444),
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
                  color: isDark ? Colors.white : Colors.black,
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
                  color: isDark ? Colors.white70 : Colors.black54,
                ),
              ),
              const Gap(48),

              // Detail Card (if success)
              if (success && cargo != null)
                NeoContainer(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      _buildDetailRow(
                        isDark, 
                        'Tracking ID', 
                        cargo.id, 
                        HugeIcons.strokeRoundedQrCode
                      ),
                      const Divider(height: 32),
                      _buildDetailRow(
                        isDark, 
                        'Receiver', 
                        cargo.receiverName, 
                        HugeIcons.strokeRoundedUser
                      ),
                      const Divider(height: 32),
                      _buildDetailRow(
                        isDark, 
                        'Destination', 
                        cargo.toAddress, 
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
                          color: isDark ? Colors.white24 : Colors.black12,
                        ),
                      ),
                      child: Text(
                        'Go Home',
                        style: GoogleFonts.outfit(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: isDark ? Colors.white : Colors.black,
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
                        backgroundColor: const Color(0xFF3B82F6),
                        foregroundColor: Colors.white,
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

  Widget _buildDetailRow(bool isDark, String label, String value, dynamic icon) {
    return Row(
      children: [
        HugeIcon(
          icon: icon,
          color: const Color(0xFF3B82F6),
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
                color: isDark ? Colors.white38 : Colors.black38,
              ),
            ),
            Text(
              value,
              style: GoogleFonts.outfit(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: isDark ? Colors.white : Colors.black,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
