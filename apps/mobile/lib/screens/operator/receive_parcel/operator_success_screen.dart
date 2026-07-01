import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:provider/provider.dart';

import '../../../providers/printer_provider.dart';
import '../../../widgets/printer_selection_sheet.dart';

class OperatorSuccessScreen extends StatefulWidget {
  final Map<String, dynamic> packageData;

  const OperatorSuccessScreen({super.key, required this.packageData});

  @override
  State<OperatorSuccessScreen> createState() => _OperatorSuccessScreenState();
}

class _OperatorSuccessScreenState extends State<OperatorSuccessScreen> {
  bool _autoprintAttempted = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _autoPrint();
    });
  }

  Future<void> _autoPrint() async {
    if (_autoprintAttempted) return;
    _autoprintAttempted = true;
    
    final provider = context.read<PrinterProvider>();
    
    // Attempt auto-connection if not already connected
    if (!provider.isConnected && provider.lastPrinterMac != null) {
      await provider.connectToLastPrinter();
    }
    
    if (provider.isConnected) {
      if (mounted) {
        await _executePrint(context, provider, false); // false = receipt
      }
    }
  }

  Future<void> _handlePrint(BuildContext context, {required bool isSticker}) async {
    final provider = context.read<PrinterProvider>();
    
    // If printer is already connected, print directly
    if (provider.isConnected) {
      _executePrint(context, provider, isSticker);
      return;
    }
    
    // Otherwise, select from the list of connected/available Bluetooth devices
    PrinterSelectionSheet.show(
      context,
      onDeviceSelected: (device) {
        _executePrint(context, provider, isSticker);
      },
    );
  }

  Future<void> _executePrint(BuildContext context, PrinterProvider provider, bool isSticker) async {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            const SizedBox(
              width: 16,
              height: 16,
              child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
            ),
            const Gap(12),
            Text(isSticker ? "Printing thermal label..." : "Printing POS receipt..."),
          ],
        ),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        duration: const Duration(seconds: 1),
      ),
    );

    final success = isSticker 
        ? await provider.printLabel(widget.packageData) 
        : await provider.printReceipt(widget.packageData);

    if (!context.mounted) return;
    
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(success ? (isSticker ? "Label printed successfully!" : "Receipt printed successfully!") : "Print failed. Try again."),
        backgroundColor: success ? Colors.green : Colors.red,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F5F9),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              
              // Animated Success Icon (Simulated with static container)
              Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  color: const Color(0xFF10B981).withValues(alpha: 0.15),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Container(
                    width: 80,
                    height: 80,
                    decoration: const BoxDecoration(
                      color: Color(0xFF10B981),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.check_rounded,
                      color: Colors.white,
                      size: 48,
                    ),
                  ),
                ),
              ),
              const Gap(32),
 
              Text(
                'Parcel Received!',
                style: GoogleFonts.outfit(
                  fontSize: 32,
                  fontWeight: FontWeight.w800,
                  color: const Color(0xFF1E293B),
                ),
              ),
              const Gap(12),
 
              Text(
                'You have successfully registered "${widget.packageData['description'] ?? widget.packageData['packageName'] ?? 'Standard Cargo'}" from ${widget.packageData['senderName']}. It is ready to be dispatched.',
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(
                  fontSize: 15,
                  color: const Color(0xFF64748B),
                  height: 1.5,
                ),
              ),
 
              const Gap(48),
 
              // Actions
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: const Color(0xFFE2E8F0)),
                ),
                child: Column(
                  children: [
                    InkWell(
                      onTap: () => _handlePrint(context, isSticker: true),
                      borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: const Color(0xFF3B82F6).withValues(alpha: 0.1),
                                shape: BoxShape.circle,
                              ),
                              child: const HugeIcon(icon: HugeIcons.strokeRoundedPrinter, color: Color(0xFF3B82F6), size: 24),
                            ),
                            const Gap(16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Print Sticker',
                                    style: GoogleFonts.outfit(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                      color: const Color(0xFF1E293B),
                                    ),
                                  ),
                                  Text(
                                    '2x1 inch thermal barcode label',
                                    style: GoogleFonts.inter(
                                      fontSize: 12,
                                      color: const Color(0xFF64748B),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            HugeIcon(icon: HugeIcons.strokeRoundedArrowRight01, color: const Color(0xFF94A3B8), size: 20),
                          ],
                        ),
                      ),
                    ),
                    Divider(height: 1, color: const Color(0xFFE2E8F0)),
                    InkWell(
                      onTap: () => _handlePrint(context, isSticker: false),
                      borderRadius: const BorderRadius.vertical(bottom: Radius.circular(20)),
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: const Color(0xFF8B5CF6).withValues(alpha: 0.1),
                                shape: BoxShape.circle,
                              ),
                              child: const HugeIcon(icon: HugeIcons.strokeRoundedInvoice01, color: Color(0xFF8B5CF6), size: 24),
                            ),
                            const Gap(16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Print Receipt',
                                    style: GoogleFonts.outfit(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                      color: const Color(0xFF1E293B),
                                    ),
                                  ),
                                  Text(
                                    '58mm receipt for the sender',
                                    style: GoogleFonts.inter(
                                      fontSize: 12,
                                      color: const Color(0xFF64748B),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            HugeIcon(icon: HugeIcons.strokeRoundedArrowRight01, color: const Color(0xFF94A3B8), size: 20),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
 
              const Spacer(),
 
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () {
                    // Navigate back to operations hub
                    context.go('/operations');
                  },
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  ),
                  child: Text(
                    'Back to Dashboard',
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF3B82F6),
                    ),
                  ),
                ),
              ),
              const Gap(16),
            ],
          ),
        ),
      ),
    );
  }
}
