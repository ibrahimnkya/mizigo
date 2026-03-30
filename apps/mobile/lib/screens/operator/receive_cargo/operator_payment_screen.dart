import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hugeicons/hugeicons.dart';
import '../../../services/api_service.dart';
import '../../../theme/app_theme.dart';

class OperatorPaymentScreen extends StatefulWidget {
  final Map<String, dynamic> packageData;

  const OperatorPaymentScreen({super.key, required this.packageData});

  @override
  State<OperatorPaymentScreen> createState() => _OperatorPaymentScreenState();
}

class _OperatorPaymentScreenState extends State<OperatorPaymentScreen> {
  String _paymentMethod = 'Mobile Money';
  bool _loading = false;
  double _calculatedPrice = 0.0;
  bool _hasError = false; // Track error for progress dots

  @override
  void initState() {
    super.initState();
    _calculatePrice();
  }

  void _calculatePrice() {
    final weightStr = widget.packageData['weight']?.toString() ?? '1';
    final weight = double.tryParse(weightStr) ?? 1.0;
    double base = 5000.0;
    base += (weight * 1000.0);
    final size = widget.packageData['packageSize']?.toString() ?? '';
    if (size.contains('Size 1')) { base += 2000; }
    else if (size.contains('Size 2')) { base += 5000; }
    else if (size.contains('Size 3')) { base += 10000; }
    final urgency = widget.packageData['urgency']?.toString() ?? '';
    if (urgency == 'Express') { base *= 1.5; }
    else if (urgency == 'MGR') { base *= 2.0; }
    setState(() {
      _calculatedPrice = base;
    });
  }

  Future<void> _submitReception() async {
    setState(() => _loading = true);
    try {
      final totalAmount = _calculatedPrice;
      final advanceAmount = _paymentMethod == 'Receiver Pays' ? totalAmount * 0.5 : totalAmount;
      final balanceAmount = totalAmount - advanceAmount;

      final payload = {
        'senderName': widget.packageData['senderName'],
        'senderPhone': widget.packageData['senderPhone'],
        'receiverName': widget.packageData['receiverName'],
        'receiverPhone': widget.packageData['receiverPhone'],
        'origin': widget.packageData['originStation'],
        'destination': widget.packageData['destinationStation'],
        'description': widget.packageData['cargoDescription'] ?? widget.packageData['packageName'],
        'weight': widget.packageData['weight'],
        'type': 'OPERATOR_RECEPTION',
        'totalPrice': totalAmount,
        'advanceAmount': advanceAmount,
        'balanceAmount': balanceAmount,
        'paymentMethod': _paymentMethod,
        'condition': widget.packageData['condition'],
        'cargoType': widget.packageData['cargoType'],
        'urgency': widget.packageData['urgency'],
      };
      await ApiService.receiveCargo(payload);
      if (mounted) {
        context.push('/operator-receive/success', extra: payload);
      }
    } catch (e) {
      if (mounted) {
        setState(() => _hasError = true);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $e'), backgroundColor: const Color(0xFFEF4444)),
        );
      }
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  Widget _buildPaymentOption(String title, Widget iconWidget, String description, bool isDark) {
    bool isSelected = _paymentMethod == title;
    return GestureDetector(
      onTap: () => setState(() => _paymentMethod = title),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isDark ? const Color(0xFF1E293B) : Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected ? const Color(0xFF3B82F6) : (isDark ? Colors.white.withValues(alpha: 0.05) : const Color(0xFFE2E8F0)),
            width: isSelected ? 2 : 1,
          ),
          boxShadow: isSelected
              ? [BoxShadow(color: const Color(0xFF3B82F6).withValues(alpha: 0.2), blurRadius: 10, offset: const Offset(0, 4))]
              : null,
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: isSelected ? const Color(0xFF3B82F6) : (isDark ? Colors.white.withValues(alpha: 0.05) : const Color(0xFFF1F5F9)),
                shape: BoxShape.circle,
              ),
              child: Theme(
                data: Theme.of(context).copyWith(
                  iconTheme: IconThemeData(
                    color: isSelected ? Colors.white : (isDark ? Colors.white70 : const Color(0xFF64748B)),
                    size: 24,
                  ),
                ),
                child: iconWidget,
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
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: isDark ? Colors.white : const Color(0xFF1E293B),
                    ),
                  ),
                  const Gap(4),
                  Text(
                    description,
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      color: isDark ? Colors.white54 : const Color(0xFF64748B),
                    ),
                  ),
                ],
              ),
            ),
            if (isSelected)
              const Icon(Icons.check_circle, color: Color(0xFF3B82F6), size: 24)
            else
              Icon(Icons.circle_outlined, color: isDark ? Colors.white24 : const Color(0xFFCBD5E1), size: 24),
          ],
        ),
      ),
    );
  }

  void _showPaymentHelp(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => DraggableScrollableSheet(
        initialChildSize: 0.62,
        minChildSize: 0.4,
        maxChildSize: 0.88,
        builder: (ctx, scrollCtrl) => Container(
          decoration: const BoxDecoration(
            color: Color(0xFF0F172A),
            borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
          ),
          child: Column(
            children: [
              const SizedBox(height: 12),
              Center(
                child: Container(
                  width: 40, height: 4,
                  decoration: BoxDecoration(color: Colors.white10, borderRadius: BorderRadius.circular(2)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(24, 20, 16, 0),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: const Color(0xFF3B82F6).withValues(alpha: 0.15),
                        shape: BoxShape.circle,
                      ),
                      child: const HugeIcon(
                        icon: HugeIcons.strokeRoundedCreditCard,
                        color: Color(0xFF3B82F6),
                        size: 22,
                      ),
                    ),
                    const Gap(12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Step 3 — Payment',
                            style: GoogleFonts.outfit(fontSize: 18, fontWeight: FontWeight.w800, color: Colors.white),
                          ),
                          Text(
                            'How payment is collected',
                            style: GoogleFonts.inter(fontSize: 13, color: Colors.white38),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      onPressed: () => Navigator.pop(ctx),
                      icon: const Icon(Icons.close_rounded, color: Colors.white38, size: 22),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView(
                  controller: scrollCtrl,
                  padding: const EdgeInsets.fromLTRB(24, 16, 24, 8),
                  children: [
                    _helpRow(
                      HugeIcons.strokeRoundedSmartPhone01,
                      'Mobile Money',
                      'The sender pays the full amount now via Mobile Money (M-Pesa, Airtel Money, etc.). No balance is left unpaid.',
                    ),
                    _helpRow(
                      HugeIcons.strokeRoundedPackageReceive,
                      'Receiver Pays',
                      'The sender pays 50% advance now. The remaining 50% balance is collected from the receiver upon delivery at the destination station.',
                    ),
                    _helpRow(
                      HugeIcons.strokeRoundedCalculator,
                      'Price Calculation',
                      'Price is calculated based on weight (TZS 1,000/kg), package size surcharge, and urgency multiplier (Express ×1.5, MGR ×2.0).',
                    ),
                    _helpRow(
                      HugeIcons.strokeRoundedPrinter,
                      'Receipt',
                      'After confirming payment, a receipt will be generated and can be printed immediately. Always print a copy for the sender.',
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(24, 4, 24, MediaQuery.of(context).padding.bottom + 16),
                child: SizedBox(
                  width: double.infinity,
                  height: 52,
                  child: FilledButton(
                    onPressed: () => Navigator.pop(ctx),
                    style: FilledButton.styleFrom(
                      backgroundColor: const Color(0xFF3B82F6),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                    ),
                    child: Text(
                      'Got it',
                      style: GoogleFonts.inter(fontWeight: FontWeight.w800, color: Colors.white, fontSize: 15),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _helpRow(dynamic icon, String title, String body) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.04),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.white.withValues(alpha: 0.06)),
            ),
            child: HugeIcon(icon: icon, color: const Color(0xFF3B82F6), size: 18),
          ),
          const Gap(14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: GoogleFonts.outfit(fontWeight: FontWeight.w700, fontSize: 14, color: Colors.white)),
                const Gap(3),
                Text(body, style: GoogleFonts.inter(fontSize: 13, color: Colors.white38, height: 1.5)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final advanceAmount = _paymentMethod == 'Receiver Pays' ? _calculatedPrice * 0.5 : _calculatedPrice;

    return Scaffold(
      backgroundColor: AppTheme.cBlackMain,
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top + 14,
              bottom: 18,
              left: 20,
              right: 20,
            ),
            color: const Color(0xFF0F172A),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () => context.pop(),
                  child: const HugeIcon(icon: HugeIcons.strokeRoundedArrowLeft01, color: Colors.white, size: 24),
                ),
                const Gap(16),
                Text(
                  'Payment Checkout',
                  style: GoogleFonts.outfit(
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
                const Spacer(),
                // Progress Dots
                Row(
                  children: List.generate(3, (index) {
                    final isActive = index == 2; // Step 3
                    return Container(
                      margin: const EdgeInsets.only(right: 4),
                      width: isActive ? 12 : 6,
                      height: 6,
                      decoration: BoxDecoration(
                        color: isActive 
                          ? (_hasError ? const Color(0xFFEF4444) : const Color(0xFF3B82F6)) 
                          : Colors.white24,
                        borderRadius: BorderRadius.circular(3),
                      ),
                    );
                  }),
                ),
                const Gap(12),
                GestureDetector(
                  onTap: () => _showPaymentHelp(context),
                  child: const HugeIcon(icon: HugeIcons.strokeRoundedHelpCircle, color: Colors.white, size: 22),
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [AppTheme.cPrimary, AppTheme.cPrimary.withValues(alpha: 0.8)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(24),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFF3B82F6).withValues(alpha: 0.3),
                          blurRadius: 20,
                          offset: const Offset(0, 10),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _paymentMethod == 'Receiver Pays' ? 'Advance to Collect (50%)' : 'Amount to Collect',
                          style: GoogleFonts.inter(
                            color: Colors.white.withValues(alpha: 0.8),
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const Gap(8),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              'TZS',
                              style: GoogleFonts.outfit(
                                color: Colors.white.withValues(alpha: 0.8),
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const Gap(8),
                            Text(
                              advanceAmount.toStringAsFixed(0),
                              style: GoogleFonts.outfit(
                                color: Colors.white,
                                fontSize: 40,
                                fontWeight: FontWeight.w800,
                                height: 1,
                              ),
                            ),
                          ],
                        ),
                        if (_paymentMethod == 'Receiver Pays') ...[
                          const Gap(16),
                          Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: Colors.black12,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Balance on Delivery', style: GoogleFonts.inter(color: Colors.white70, fontSize: 13)),
                                Text('TZS ${(_calculatedPrice * 0.5).toStringAsFixed(0)}', style: GoogleFonts.inter(color: Colors.white, fontWeight: FontWeight.w700)),
                              ],
                            ),
                          ),
                        ],
                        const Gap(20),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                          decoration: BoxDecoration(
                            color: Colors.white.withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Route',
                                style: GoogleFonts.inter(color: Colors.white70, fontSize: 13),
                              ),
                              Text(
                                '${widget.packageData['originStation']} ➔ ${widget.packageData['destinationStation']}',
                                style: GoogleFonts.inter(color: Colors.white, fontSize: 13, fontWeight: FontWeight.w600),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Gap(32),
                  Text(
                    'Payment Method',
                    style: GoogleFonts.outfit(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: isDark ? Colors.white : const Color(0xFF1E293B),
                    ),
                  ),
                  const Gap(16),
                  _buildPaymentOption(
                    'Mobile Money',
                    const HugeIcon(icon: HugeIcons.strokeRoundedSmartPhone01, color: Colors.transparent),
                    'Full payment via M-Pesa, Tigo or Airtel',
                    isDark,
                  ),
                  const Gap(16),
                  _buildPaymentOption(
                    'Receiver Pays',
                    const HugeIcon(icon: HugeIcons.strokeRoundedPackageReceive, color: Colors.transparent),
                    '50% Advance now, 50% on Delivery',
                    isDark,
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(
              20, 16, 20, MediaQuery.of(context).padding.bottom + 16,
            ),
            decoration: BoxDecoration(
              color: isDark ? const Color(0xFF1E293B) : Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.05),
                  blurRadius: 10,
                  offset: const Offset(0, -5),
                ),
              ],
            ),
            child: SizedBox(
              width: double.infinity,
              height: 58,
              child: ElevatedButton(
                onPressed: _loading ? null : _submitReception,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.cPrimary,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  elevation: 0,
                ),
                child: _loading
                    ? const SizedBox(
                        height: 24,
                        width: 24,
                        child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2),
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Confirm & Receive Parcel',
                            style: GoogleFonts.outfit(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                          const Gap(8),
                          const HugeIcon(icon: HugeIcons.strokeRoundedArrowRight01, color: Colors.white, size: 20),
                        ],
                      ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
