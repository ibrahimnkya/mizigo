import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:intl/intl.dart';
import '../../../services/api_service.dart';
import '../../../theme/app_theme.dart';

class OperatorPaymentScreen extends StatefulWidget {
  final Map<String, dynamic> packageData;

  const OperatorPaymentScreen({super.key, required this.packageData});

  @override
  State<OperatorPaymentScreen> createState() => _OperatorPaymentScreenState();
}

class _OperatorPaymentScreenState extends State<OperatorPaymentScreen> {
  bool _loading = false;
  double _calculatedPrice = 0.0;
  bool _hasError = false;

  final double _baseFare = 5000.0;
  double _weightCharge = 0.0;
  double _sizeSurcharge = 0.0;
  double _urgencyPremium = 0.0;
  double _additionalServicesCost = 0.0;

  @override
  void initState() {
    super.initState();
    _calculatePrice();
  }

  void _calculatePrice() {
    final weightStr = widget.packageData['weight']?.toString() ?? '1';
    final weight = double.tryParse(weightStr) ?? 1.0;
    _weightCharge = weight * 1000.0;

    final size = widget.packageData['packageSize']?.toString() ?? '';
    if (size.contains('Size 1')) {
      _sizeSurcharge = 2000.0;
    } else if (size.contains('Size 2')) {
      _sizeSurcharge = 5000.0;
    } else if (size.contains('Size 3')) {
      _sizeSurcharge = 10000.0;
    } else {
      _sizeSurcharge = 0.0;
    }

    double subtotal = _baseFare + _weightCharge + _sizeSurcharge;

    final urgency = widget.packageData['urgency']?.toString() ?? '';
    double multiplier = 1.0;
    if (urgency == 'Express') {
      multiplier = 1.5;
    } else if (urgency == 'MGR') {
      multiplier = 2.0;
    }

    _urgencyPremium = subtotal * (multiplier - 1.0);

    // Calculate additional services cost
    _additionalServicesCost = 0.0;
    if (widget.packageData['additionalServices'] != null) {
      final List<dynamic> services = widget.packageData['additionalServices'] as List<dynamic>;
      for (final serviceId in services) {
        if (serviceId == 'insurance') _additionalServicesCost += 3000.0;
        if (serviceId == 'packaging') _additionalServicesCost += 2000.0;
        if (serviceId == 'fragile') _additionalServicesCost += 2500.0;
      }
    }

    setState(() {
      _calculatedPrice = (subtotal * multiplier) + _additionalServicesCost;
    });
  }

  Future<void> _submitReception() async {
    setState(() => _loading = true);
    try {
      final totalAmount = _calculatedPrice;

      final payload = {
        'senderName': widget.packageData['senderName'],
        'senderPhone': widget.packageData['senderPhone'],
        'receiverName': widget.packageData['receiverName'],
        'receiverPhone': widget.packageData['receiverPhone'],
        'receivingStationId': widget.packageData['originStationId'],
        'destinationStationId': widget.packageData['destinationStationId'],
        'packageName': widget.packageData['packageName'],
        'declaredValue': double.tryParse(widget.packageData['packageValue']?.toString() ?? '0') ?? 0.0,
        'packageSize': widget.packageData['packageSize'],
        'description': widget.packageData['parcelDescription'] ?? widget.packageData['packageName'],
        'weight': double.tryParse(widget.packageData['weight']?.toString() ?? '1.0') ?? 1.0,
        'isPaid': true,
        'paymentMode': 'PAY_AS_YOU_GO',
        'condition': widget.packageData['condition'],
        'parcelType': widget.packageData['parcelType'],
        'urgency': widget.packageData['urgency'],
        'additionalServices': widget.packageData['additionalServices'],
      };
      final result = await ApiService.receiveParcel(payload);
      if (mounted) {
        // API wraps response under result['data']
        final data = result['data'] as Map<String, dynamic>? ?? result;
        final parcel = data['parcel'] as Map<String, dynamic>? ?? {};
        final successPayload = {
          ...payload,
          'id': parcel['id'] ?? data['id'],
          'trackingId': parcel['trackingNumber'] ?? data['trackingNumber'] ?? parcel['id'],
          'amount': data['pricing']?['amount'] ?? totalAmount,
        };
        context.push('/operator-receive/success', extra: successPayload);
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

  Widget _buildBreakdownRow(String label, double amount) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: GoogleFonts.inter(
            fontSize: 13,
            color: AppTheme.textSecondary,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          'TZS ${NumberFormat('#,###').format(amount)}',
          style: GoogleFonts.inter(
            fontSize: 13,
            color: AppTheme.textPrimary,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
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
          decoration: BoxDecoration(
            color: AppTheme.surface,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(32)),
            border: Border(
              top: BorderSide(color: AppTheme.border),
              left: BorderSide(color: AppTheme.border),
              right: BorderSide(color: AppTheme.border),
            ),
          ),
          child: Column(
            children: [
              const SizedBox(height: 12),
              Center(
                child: Container(
                  width: 40, height: 4,
                  decoration: BoxDecoration(color: AppTheme.border, borderRadius: BorderRadius.circular(2)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(24, 20, 16, 0),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: AppTheme.accent.withValues(alpha: 0.15),
                        shape: BoxShape.circle,
                      ),
                      child: HugeIcon(
                        icon: HugeIcons.strokeRoundedCreditCard,
                        color: AppTheme.accent,
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
                            style: GoogleFonts.outfit(fontSize: 18, fontWeight: FontWeight.w800, color: AppTheme.textPrimary),
                          ),
                          Text(
                            'How payment is collected',
                            style: GoogleFonts.inter(fontSize: 13, color: AppTheme.textSecondary),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      onPressed: () => Navigator.pop(ctx),
                      icon: Icon(Icons.close_rounded, color: AppTheme.textSecondary, size: 22),
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
                      HugeIcons.strokeRoundedCoins01,
                      'Price Calculation',
                      'Price is calculated based on weight (TZS 1,000/kg), package size surcharge, and delivery priority multiplier (Express ×1.5, MGR ×2.0).',
                    ),
                    _helpRow(
                      HugeIcons.strokeRoundedPrinter,
                      'Print Receipt',
                      'Tap "Print Receipt" to register the parcel and print a receipt for the sender. Payment collection will be handled separately.',
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
                      backgroundColor: AppTheme.cPrimary,
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
              color: AppTheme.background,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppTheme.border),
            ),
            child: HugeIcon(icon: icon, color: AppTheme.cPrimary, size: 18),
          ),
          const Gap(14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: GoogleFonts.outfit(fontWeight: FontWeight.w700, fontSize: 14, color: AppTheme.textPrimary)),
                const Gap(3),
                Text(body, style: GoogleFonts.inter(fontSize: 13, color: AppTheme.textSecondary, height: 1.5)),
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
    final appBarTheme = theme.appBarTheme;
    final appBarBgColor = appBarTheme.backgroundColor ?? theme.primaryColor;
    final appBarTextColor = appBarTheme.titleTextStyle?.color ?? Colors.white;
    final appBarIconColor = appBarTheme.iconTheme?.color ?? Colors.white;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top + 14,
              bottom: 18,
              left: 20,
              right: 20,
            ),
            color: appBarBgColor,
            child: Row(
              children: [
                GestureDetector(
                  onTap: () => context.pop(),
                  child: HugeIcon(icon: HugeIcons.strokeRoundedArrowLeft01, color: appBarIconColor, size: 24),
                ),
                const Gap(16),
                Text(
                  'Payment Checkout',
                  style: GoogleFonts.outfit(
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    color: appBarTextColor,
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
                          ? (_hasError ? AppTheme.danger : AppTheme.accent) 
                          : appBarTextColor.withValues(alpha: 0.24),
                        borderRadius: BorderRadius.circular(3),
                      ),
                    );
                  }),
                ),
                const Gap(12),
                GestureDetector(
                  onTap: () => _showPaymentHelp(context),
                  child: HugeIcon(icon: HugeIcons.strokeRoundedHelpCircle, color: appBarIconColor, size: 22),
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
                          'Amount to be Paid',
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
                              NumberFormat('#,###').format(_calculatedPrice),
                              style: GoogleFonts.outfit(
                                color: Colors.white,
                                fontSize: 40,
                                fontWeight: FontWeight.w800,
                                height: 1,
                              ),
                            ),
                          ],
                        ),
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
                              const Gap(16),
                              Expanded(
                                child: Text(
                                  '${widget.packageData['originStation']} ➔ ${widget.packageData['destinationStation']}',
                                  style: GoogleFonts.inter(color: Colors.white, fontSize: 13, fontWeight: FontWeight.w600),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.right,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Gap(20),
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: isDark ? const Color(0xFF1E293B) : Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: isDark ? Colors.white.withValues(alpha: 0.05) : const Color(0xFFE2E8F0)),
                      boxShadow: isDark ? null : [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.05),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Cost Breakdown',
                          style: GoogleFonts.outfit(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: isDark ? Colors.white : const Color(0xFF0F172A),
                          ),
                        ),
                        const Gap(16),
                        _buildBreakdownRow('Base Fare', _baseFare),
                        const Gap(12),
                        _buildBreakdownRow('Weight Charge (${widget.packageData['weight'] ?? 1} kg)', _weightCharge),
                        if (_sizeSurcharge > 0) ...[
                          const Gap(12),
                          _buildBreakdownRow('Size Surcharge (${widget.packageData['packageSize'] ?? 'Standard'})', _sizeSurcharge),
                        ],
                        if (_urgencyPremium > 0) ...[
                          const Gap(12),
                          _buildBreakdownRow('Delivery Priority Premium (${widget.packageData['urgency'] ?? 'Normal'})', _urgencyPremium),
                        ],
                        if (widget.packageData['additionalServices'] != null) ...[
                          ...(widget.packageData['additionalServices'] as List<dynamic>).map((s) {
                            String name = '';
                            double price = 0.0;
                            if (s == 'insurance') { name = 'Cargo Insurance'; price = 3000.0; }
                            if (s == 'packaging') { name = 'Secure Packaging'; price = 2000.0; }
                            if (s == 'fragile') { name = 'Special Handling'; price = 2500.0; }
                            return Padding(
                              padding: const EdgeInsets.only(top: 12),
                              child: _buildBreakdownRow(name, price),
                            );
                          }),
                        ],
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          child: Divider(color: isDark ? Colors.white12 : const Color(0xFFE2E8F0), height: 1),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Total Cost',
                              style: GoogleFonts.inter(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: isDark ? Colors.white : const Color(0xFF0F172A),
                              ),
                            ),
                            Text(
                              'TZS ${NumberFormat('#,###').format(_calculatedPrice)}',
                              style: GoogleFonts.outfit(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: const Color(0xFF3B82F6),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const Gap(24),
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
                          const HugeIcon(icon: HugeIcons.strokeRoundedPrinter, color: Colors.white, size: 20),
                          const Gap(8),
                          Text(
                            'Print Receipt',
                            style: GoogleFonts.outfit(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
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
