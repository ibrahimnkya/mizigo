import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:intl/intl.dart';
import '../../../services/api_service.dart';
import '../../../theme/staff_palette.dart';
import '../../../widgets/profile/premium_settings_components.dart';
import '../../../widgets/staff/staff_settings.dart';
import '../../../widgets/staff/step_progress.dart';
import '../../../widgets/staff/parcel_badges.dart';
import '../../../widgets/staff/parcel_cards.dart';

class OperatorPaymentScreen extends StatefulWidget {
  final Map<String, dynamic> packageData;

  const OperatorPaymentScreen({super.key, required this.packageData});

  @override
  State<OperatorPaymentScreen> createState() => _OperatorPaymentScreenState();
}

class _OperatorPaymentScreenState extends State<OperatorPaymentScreen> {
  bool _loading = false;
  bool _pricingLoading = true;
  bool _pricingError = false;
  bool _hasError = false;

  /// Server quote: same engine /parcel/receive charges from.
  Map<String, dynamic> _quote = const {};
  double get _calculatedPrice => (_quote['amount'] as num?)?.toDouble() ?? 0;

  Map<String, dynamic> get _d => widget.packageData;
  List<String> get _services => (_d['additionalServices'] as List?)?.map((e) => '$e').toList() ?? const [];

  @override
  void initState() {
    super.initState();
    _loadPricingThenCalculate();
  }

  Future<void> _loadPricingThenCalculate() async {
    setState(() {
      _pricingLoading = true;
      _pricingError = false;
    });
    try {
      final quote = await ApiService.getPriceQuote(
        weight: double.tryParse('${_d['weight']}') ?? 1,
        urgency: '${_d['urgency'] ?? 'Standard'}',
        parcelType: '${_d['parcelType'] ?? 'Parcel'}',
        packageSize: '${_d['packageSize'] ?? 'Standard'}',
        condition: _d['condition']?.toString(),
        declaredValue: double.tryParse('${_d['packageValue'] ?? 0}') ?? 0,
        packageName: _d['packageName']?.toString(),
        receivingStationId: _d['originStationId']?.toString(),
        destinationStationId: _d['destinationStationId']?.toString(),
        additionalServices: _services,
      );
      if (!mounted) return;
      setState(() {
        _quote = quote;
        _pricingLoading = false;
        _pricingError = quote['amount'] == null;
      });
    } catch (e) {
      debugPrint('[Pricing] /parcel/quote failed: $e');
      if (mounted) {
        setState(() {
          _pricingLoading = false;
          _pricingError = true;
        });
      }
    }
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
          ...widget.packageData,
          ...payload,
          'id': parcel['id'] ?? data['id'],
          'trackingId': parcel['trackingNumber'] ?? data['trackingNumber'] ?? parcel['id'],
          'amount': data['pricing']?['amount'] ?? totalAmount,
          'price': data['pricing']?['amount'] ?? totalAmount,
        };
        context.push('/operator-receive/success', extra: successPayload);
      }
    } catch (e) {
      if (mounted) {
        setState(() => _hasError = true);
        MizigoToasts.showError(context, 'Couldn’t receive the parcel: $e');
      }
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  static final _money = NumberFormat('#,###');
  String _tsh(num v) => 'TSh ${_money.format(v.round())}';

  static String _city(dynamic v) {
    final s = '${v ?? ''}'.split(',').first.trim();
    return s.isEmpty ? '—' : s;
  }

  /// One line of the breakdown: label (+ optional detail) and amount.
  Widget _line(String label, num amount, {String? detail}) {
    final palette = StaffPalette.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label, style: GoogleFonts.outfit(fontSize: 15, color: palette.fg(0.85))),
                if (detail != null && detail.isNotEmpty)
                  Text(detail, style: GoogleFonts.outfit(fontSize: 12.5, color: palette.fg(0.5))),
              ],
            ),
          ),
          Text(
            '${amount < 0 ? '−' : ''}${_tsh(amount.abs())}',
            style: GoogleFonts.outfit(fontSize: 15, fontWeight: FontWeight.w600, color: palette.fg()),
          ),
        ],
      ),
    );
  }

  /// "Label  value" fact in the parcel summary grid.
  Widget _fact(String label, String value) {
    final palette = StaffPalette.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: GoogleFonts.outfit(fontSize: 12.5, color: palette.fg(0.5))),
        const Gap(2),
        Text(
          value,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: GoogleFonts.outfit(fontSize: 15, fontWeight: FontWeight.w600, color: palette.fg()),
        ),
      ],
    );
  }

  Widget _person(String role, dynamic name, dynamic phone, List<List<dynamic>> icon) {
    final palette = StaffPalette.of(context);
    return Row(
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(color: kStaffAccent.withValues(alpha: 0.14), shape: BoxShape.circle),
          child: Center(
            child: HugeIcon(icon: icon, color: kStaffAccent, size: 19),
          ),
        ),
        const Gap(12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(role, style: GoogleFonts.outfit(fontSize: 12.5, color: palette.fg(0.5))),
              Text(
                '${name ?? '—'}',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.outfit(fontSize: 15.5, fontWeight: FontWeight.w600, color: palette.fg()),
              ),
            ],
          ),
        ),
        if ('${phone ?? ''}'.isNotEmpty)
          Text('$phone', style: GoogleFonts.outfit(fontSize: 14, color: palette.fg(0.65))),
      ],
    );
  }

  void _showPaymentHelp(BuildContext context) {
    showStaffSheet<void>(
      context,
      title: 'Payment',
      builder: (_) => const Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          StaffSheetTile(
            icon: HugeIcons.strokeRoundedCalculator,
            label: 'Price calculation',
            subtitle: 'From your tariff: base fare, weight, size, priority and services',
            onTap: null,
          ),
          StaffSheetTile(
            icon: HugeIcons.strokeRoundedMoney02,
            label: 'Collect payment',
            subtitle: 'Take the total from the sender before confirming',
            onTap: null,
          ),
          StaffSheetTile(
            icon: HugeIcons.strokeRoundedPrinter,
            label: 'Print receipt',
            subtitle: 'After confirming you can print the receipt and label',
            onTap: null,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final palette = StaffPalette.of(context);
    final d = _d;
    final lines = (_quote['lines'] as List?)?.cast<Map>() ?? const [];
    final services = (_quote['services'] as List?)?.cast<Map>() ?? const [];
    final fromSgr = _quote['source'] == 'SGR';
    final distance = (_quote['distanceInKm'] as num?)?.round();
    final urgency = '${d['urgency'] ?? ''}';
    final express = urgency.toLowerCase().contains('express') || urgency.toUpperCase() == 'MGR';
    final value = double.tryParse('${d['packageValue'] ?? ''}') ?? 0;

    return StaffSettingsScaffold(
      title: 'Payment',
      onBack: () => context.pop(),
      onRefresh: _loadPricingThenCalculate,
      trailing: IconButton(
        tooltip: 'Help',
        onPressed: () => _showPaymentHelp(context),
        icon: HugeIcon(icon: HugeIcons.strokeRoundedHelpCircle, color: palette.fg(), size: 24),
      ),
      bottom: _pricingError
          ? null
          : StaffButton(
              label: _pricingLoading ? 'Calculating price…' : 'Confirm & Receive · ${_tsh(_calculatedPrice)}',
              icon: HugeIcons.strokeRoundedCheckmarkCircle02,
              loading: _loading,
              onPressed: _pricingLoading ? null : _submitReception,
            ),
      children: [
        const StepProgress(step: 3, total: 3, label: 'Payment'),
        const Gap(16),

        // ── Amount to collect + From → To, one orange card ──
        Container(
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(28),
            gradient: const LinearGradient(
              colors: [Color(0xFFF78A1F), Color(0xFFD9620B)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Amount to collect',
                style: GoogleFonts.outfit(fontSize: 15, color: Colors.white.withValues(alpha: 0.85)),
              ),
              const Gap(2),
              if (_pricingLoading)
                Container(
                  height: 38,
                  width: 170,
                  margin: const EdgeInsets.symmetric(vertical: 2),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                )
              else
                Text(
                  _pricingError ? '—' : _tsh(_calculatedPrice),
                  style: GoogleFonts.outfit(fontSize: 32, fontWeight: FontWeight.w800, color: Colors.white),
                ),
              const Gap(4),
              Text(
                _pricingLoading
                    ? 'Calculating price…'
                    : _pricingError
                    ? 'Price unavailable'
                    : fromSgr
                    ? 'Live SGR tariff'
                    : (_quote['estimate'] == true ? 'Estimate from your pricing rules' : 'From your pricing rules'),
                style: GoogleFonts.outfit(fontSize: 13, color: Colors.white.withValues(alpha: 0.85)),
              ),
              const Gap(16),
              ParcelRouteStrip(from: _city(d['originStation']), to: _city(d['destinationStation']), onColor: true),
              if (distance != null || express) ...[
                const Gap(12),
                Row(
                  children: [
                    if (distance != null)
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.18),
                          borderRadius: BorderRadius.circular(999),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const HugeIcon(icon: HugeIcons.strokeRoundedRoute01, color: Colors.white, size: 14),
                            const Gap(5),
                            Text(
                              '$distance km by SGR',
                              style: GoogleFonts.outfit(fontSize: 13, fontWeight: FontWeight.w600, color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    const Spacer(),
                    if (express) const ExpressBadge(),
                  ],
                ),
              ],
            ],
          ),
        ),
        const Gap(10),

        if (_pricingLoading) ...[
          for (final h in [220.0])
            Container(
              height: h,
              margin: const EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(color: palette.surface(0.08), borderRadius: BorderRadius.circular(28)),
            ),
        ] else if (_pricingError)
          StaffGlassCard(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Couldn’t get the price',
                  style: GoogleFonts.outfit(fontSize: 18, fontWeight: FontWeight.w600, color: palette.fg()),
                ),
                const Gap(6),
                Text(
                  'The price comes from your pricing rules on the server. Check your connection and try again.',
                  style: GoogleFonts.outfit(fontSize: 15, height: 1.4, color: palette.fg(0.65)),
                ),
                const Gap(16),
                StaffButton(label: 'Retry', icon: HugeIcons.strokeRoundedRefresh, onPressed: _loadPricingThenCalculate),
              ],
            ),
          )
        else ...[
          // ── Cost breakdown ──
          StaffGlassCard(
            title: 'Cost breakdown',
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 10),
            child: Column(
              children: [
                for (final l in lines)
                  _line('${l['label']}', (l['amount'] as num?) ?? 0, detail: l['detail']?.toString()),
                if (services.isNotEmpty) ...[
                  const StaffDivider(),
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Extra services',
                        style: GoogleFonts.outfit(fontSize: 13, fontWeight: FontWeight.w600, color: palette.fg(0.55)),
                      ),
                    ),
                  ),
                  for (final sv in services) _line('${sv['label']}', (sv['amount'] as num?) ?? 0),
                ],
                const StaffDivider(),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Total',
                          style: GoogleFonts.outfit(fontSize: 17, fontWeight: FontWeight.w700, color: palette.fg()),
                        ),
                      ),
                      Text(
                        _tsh(_calculatedPrice),
                        style: GoogleFonts.outfit(fontSize: 19, fontWeight: FontWeight.w800, color: kStaffAccent),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Gap(10),

          // ── Parcel & people ──
          StaffGlassCard(
            title: 'Parcel',
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(child: _fact('Item', '${d['packageName'] ?? '—'}')),
                    Expanded(child: _fact('Type', '${d['parcelType'] ?? '—'}')),
                  ],
                ),
                const Gap(12),
                Row(
                  children: [
                    Expanded(child: _fact('Weight', '${d['weight'] ?? '—'} kg')),
                    Expanded(child: _fact('Size', '${d['packageSize'] ?? '—'}')),
                  ],
                ),
                const Gap(12),
                Row(
                  children: [
                    Expanded(child: _fact('Declared value', value > 0 ? _tsh(value) : '—')),
                    Expanded(child: _fact('Priority', urgency.isEmpty ? '—' : urgency)),
                  ],
                ),
                const Gap(14),
                const StaffDivider(),
                const Gap(12),
                _person('Sender', d['senderName'], d['senderPhone'], HugeIcons.strokeRoundedUser),
                const Gap(12),
                _person('Receiver', d['receiverName'], d['receiverPhone'], HugeIcons.strokeRoundedUserCheck01),
              ],
            ),
          ),
          if (_hasError) ...[
            const Gap(12),
            Text(
              'Receiving failed. Check the details and try again.',
              style: GoogleFonts.outfit(fontSize: 14, color: kStaffDanger),
            ),
          ],
        ],
      ],
    );
  }
}
