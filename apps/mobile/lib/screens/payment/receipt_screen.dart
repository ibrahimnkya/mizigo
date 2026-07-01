import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:printing/printing.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:provider/provider.dart';
import '../../services/api_service.dart';
import '../../widgets/common/export_action_sheet.dart';
import '../../providers/printer_provider.dart';
import '../../widgets/printer_selection_sheet.dart';
import '../../utils/receipt_pdf_generator.dart';
import '../../theme/app_theme.dart';

class ReceiptScreen extends StatefulWidget {
  final String parcelId;
  const ReceiptScreen({super.key, required this.parcelId});

  @override
  State<ReceiptScreen> createState() => _ReceiptScreenState();
}

class _ReceiptScreenState extends State<ReceiptScreen> {
  Map<String, dynamic>? _receipt;
  bool _loading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _fetchReceipt();
  }

  Future<void> _fetchReceipt() async {
    try {
      final data = await ApiService.getParcelReceipt(widget.parcelId);
      setState(() {
        _receipt = data;
        _loading = false;
      });
    } catch (e) {
      setState(() {
        _error = e.toString();
        _loading = false;
      });
    }
  }

  Future<void> _downloadAndSharePDF() async {
    if (_receipt == null) return;
    try {
      final pdfBytes = await ReceiptPdfGenerator.generate(
        trackingId: _receipt!['trackingNumber'] ?? _receipt!['id'] ?? widget.parcelId,
        fromAddress: _receipt!['fromAddress'] ?? 'N/A',
        toAddress: _receipt!['toAddress'] ?? 'N/A',
        serviceType: _receipt!['serviceType'] ?? 'N/A',
        parcelSize: _receipt!['parcelSize'] ?? 'Standard',
        parcelType: _receipt!['parcelType'] ?? 'General',
        senderName: _receipt!['senderName'] ?? 'N/A',
        senderPhone: _receipt!['senderPhone'] ?? 'N/A',
        receiverName: _receipt!['receiverName'] ?? 'N/A',
        receiverPhone: _receipt!['receiverPhone'] ?? 'N/A',
        price: double.tryParse(_receipt!['amount']?.toString() ?? '') ?? 0.0,
        receiverPays: _receipt!['receiverPays'] == true,
        status: _receipt!['status'] ?? 'Received',
        createdAt: _receipt!['createdAt'] != null
            ? DateTime.tryParse(_receipt!['createdAt']) ?? DateTime.now()
            : DateTime.now(),
      );

      await Printing.sharePdf(
        bytes: pdfBytes,
        filename: 'mizigo_receipt_${widget.parcelId}.pdf',
      );
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to generate PDF: $e')),
        );
      }
    }
  }

  Future<void> _handlePrintReceipt() async {
    if (_receipt == null) return;
    final provider = context.read<PrinterProvider>();
    if (provider.isConnected) {
      _executePrint(provider);
      return;
    }

    PrinterSelectionSheet.show(
      context,
      onDeviceSelected: (dev) => _executePrint(provider),
    );
  }

  Future<void> _executePrint(PrinterProvider provider) async {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Row(
          children: [
            SizedBox(
              width: 16,
              height: 16,
              child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
            ),
            Gap(12),
            Text("Printing POS receipt..."),
          ],
        ),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        duration: const Duration(seconds: 1),
      ),
    );

    // Shape the packageData for printer
    final packageData = {
      'trackingId': _receipt!['trackingNumber'] ?? _receipt!['id'] ?? widget.parcelId,
      'description': _receipt!['serviceType'] ?? "Standard Cargo",
      'senderName': _receipt!['senderName'] ?? "N/A",
      'receiverName': _receipt!['receiverName'] ?? "N/A",
      'origin': _receipt!['fromAddress'] ?? "N/A",
      'destination': _receipt!['toAddress'] ?? "N/A",
      'price': _receipt!['amount'],
      'quantity': 1,
    };

    final success = await provider.printReceipt(packageData);
    if (!mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(success ? "Receipt printed successfully!" : "Print failed. Try again."),
        backgroundColor: success ? Colors.green : Colors.red,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    if (_error != null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Error')),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.error_outline, size: 48, color: Colors.red),
                const Gap(16),
                Text(_error!, textAlign: TextAlign.center),
                const Gap(24),
                ElevatedButton(
                  onPressed: () => context.go('/home'),
                  child: const Text('Back to Home'),
                ),
              ],
            ),
          ),
        ),
      );
    }

    final r = _receipt!;
    final amountStr = r['amount']?.toString() ?? '0';
    final amount = double.tryParse(amountStr.replaceAll(',', '')) ?? 0.0;
    final paidAt = r['paidAt'] != null 
        ? DateFormat('MMM dd, yyyy • hh:mm a').format(DateTime.parse(r['paidAt']))
        : 'Unknown Date';

    return Scaffold(
      backgroundColor: AppTheme.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: Icon(Icons.close, color: AppTheme.textPrimary),
            onPressed: () => context.go('/home'),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            const Gap(8),
            // Ticket-like Design
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppTheme.surface,
                    borderRadius: BorderRadius.circular(32),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.05),
                        blurRadius: 20,
                        offset: const Offset(0, 10),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      const Gap(40),
                      // Success Icon
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          color: const Color(0xFF10B981).withValues(alpha: 0.1),
                          shape: BoxShape.circle,
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.check_circle_rounded,
                            color: Color(0xFF10B981),
                            size: 48,
                          ),
                        ),
                      ),
                      const Gap(24),
                      Text(
                        'Payment Success!',
                        style: GoogleFonts.outfit(
                          fontSize: 24,
                          fontWeight: FontWeight.w800,
                          color: AppTheme.textPrimary,
                        ),
                      ),
                      const Gap(8),
                      Text(
                        'Your transaction was successful',
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          color: const Color(0xFF64748B),
                        ),
                      ),
                      const Gap(24),
                      Text(
                        'TZS ${NumberFormat('#,###').format(amount)}',
                        style: GoogleFonts.outfit(
                          fontSize: 40,
                          fontWeight: FontWeight.w900,
                          color: AppTheme.textPrimary,
                          letterSpacing: -1,
                        ),
                      ),
                      const Gap(40),
                      // Dashed line
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 32),
                        child: Row(
                          children: List.generate(
                            20,
                            (index) => Expanded(
                              child: Container(
                                margin: const EdgeInsets.symmetric(horizontal: 2),
                                height: 1,
                                color: AppTheme.border,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const Gap(40),
                      // Details
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 32),
                        child: Column(
                          children: [
                            _buildInfoRow('Tracking ID', r['trackingId'] ?? 'N/A'),
                            _buildInfoRow('Date', paidAt),
                            _buildInfoRow('Payment Method', 'Gateway'),
                            _buildInfoRow('Receiver', 'Mizigo Services'),
                          ],
                        ),
                        ),
                      const Gap(40),
                    ],
                  ),
                ),
                // Decorative notches
                Positioned(
                  left: -15,
                  top: 260,
                  child: Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      color: AppTheme.background,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                Positioned(
                  right: -15,
                  top: 260,
                  child: Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      color: AppTheme.background,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ],
            ),
            const Gap(40),
            // Actions
            Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => context.go('/home'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF4A43EC),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      elevation: 0,
                    ),
                    child: Text(
                      'Done',
                      style: GoogleFonts.outfit(fontSize: 18, fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
                const Gap(16),
                SizedBox(
                  width: double.infinity,
                  child: TextButton.icon(
                    onPressed: _handlePrintReceipt,
                    icon: const HugeIcon(
                      icon: HugeIcons.strokeRoundedPrinter,
                      color: Color(0xFF4A43EC),
                      size: 22,
                    ),
                    label: Text(
                      'Print Receipt',
                      style: GoogleFonts.outfit(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF4A43EC),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const Gap(40),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: GoogleFonts.inter(
              fontSize: 14,
              color: AppTheme.textSecondary,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            value,
            style: GoogleFonts.inter(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: AppTheme.textPrimary,
            ),
          ),
        ],
      ),
    );
  }
}
