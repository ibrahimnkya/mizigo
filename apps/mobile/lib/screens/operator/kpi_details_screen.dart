import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gap/gap.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:intl/intl.dart' as intl;
import 'package:printing/printing.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import '../../services/api_service.dart';
import 'operator_reports_screen.dart';
import '../../theme/staff_palette.dart';
import '../../widgets/staff/date_range_sheet.dart';
import '../../widgets/staff/staff_settings.dart';
import '../../widgets/staff/bridge_card.dart';
import '../../widgets/staff/parcel_cards.dart';
import '../../models/parcel_model.dart';
import 'package:go_router/go_router.dart';
import '../../widgets/profile/premium_settings_components.dart';

class KpiDetailsScreen extends StatefulWidget {
  final String title;
  final String dataKey;
  final String timeframe;
  final Color color;
  final Widget icon;
  final ReportPeriod initialPeriod;

  const KpiDetailsScreen({
    super.key,
    required this.title,
    required this.dataKey,
    required this.timeframe,
    required this.color,
    required this.icon,
    this.initialPeriod = ReportPeriod.thisMonth,
  });

  @override
  State<KpiDetailsScreen> createState() => _KpiDetailsScreenState();
}

class _KpiDetailsScreenState extends State<KpiDetailsScreen> {
  late ReportPeriod _period;
  DateTime? _dateStart;
  DateTime? _dateEnd;
  List<dynamic> _allParcels = [];
  List<dynamic> _filteredParcels = [];
  bool _loading = true;
  bool _exporting = false;

  bool get _isDateRangeActive => _dateStart != null;

  static const _allPills = [
    (ReportPeriod.today, 'Today'),
    (ReportPeriod.thisWeek, 'This Week'),
    (ReportPeriod.thisMonth, 'This Month'),
    (ReportPeriod.last30, '30 Days'),
    (ReportPeriod.last90, '90 Days'),
  ];

  @override
  void initState() {
    super.initState();
    _period = widget.initialPeriod;
    _fetchParcels();
  }

  Future<void> _showDateRangeModal() async {
    final initial = _dateStart == null ? null : DateTimeRange(start: _dateStart!, end: _dateEnd ?? _dateStart!);
    final range = await showStaffDateRangeSheet(context, initial: initial);
    if (!mounted || range == null) return;
    setState(() {
      _dateStart = range.start;
      _dateEnd = range.end;
      _filterParcels();
    });
  }

  void _clearDateRange() {
    setState(() {
      _dateStart = null;
      _dateEnd = null;
      _filterParcels();
    });
  }

  String get _statusFilter {
    switch (widget.dataKey) {
      case 'received':
        return 'Received';
      case 'delivered':
        return 'Delivered';
      case 'sent':
        return 'Dispatched';
      case 'atWarehouse':
        return 'At Station';
      default:
        return 'Received';
    }
  }

  Future<void> _fetchParcels() async {
    setState(() => _loading = true);
    try {
      final res = await ApiService.getParcels(status: _statusFilter);
      if (mounted) {
        setState(() {
          _allParcels = res;
          _filterParcels();
        });
      }
    } catch (e) {
      debugPrint('Error fetching parcels: $e');
      if (mounted) {
        MizigoToasts.showError(context, 'Failed to load parcels: $e');
        setState(() {
          _allParcels = [];
          _filterParcels();
        });
      }
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  void _filterParcels() {
    _filteredParcels = _allParcels.where((p) {
      if (_isDateRangeActive) {
        return _isWithinRange(p['createdAt'], _dateStart!, _dateEnd);
      }
      return _isWithinPeriod(p['createdAt'], _period);
    }).toList();
  }

  bool _isWithinRange(String? createdAtStr, DateTime start, DateTime? end) {
    if (createdAtStr == null) return false;
    final createdAt = DateTime.tryParse(createdAtStr)?.toLocal();
    if (createdAt == null) return false;
    final startDay = DateTime(start.year, start.month, start.day);
    if (end != null) {
      final endDay = DateTime(end.year, end.month, end.day, 23, 59, 59);
      return !createdAt.isBefore(startDay) && !createdAt.isAfter(endDay);
    }
    // Single-day: only that day
    final endDay = DateTime(start.year, start.month, start.day, 23, 59, 59);
    return !createdAt.isBefore(startDay) && !createdAt.isAfter(endDay);
  }

  bool _isWithinPeriod(String? createdAtStr, ReportPeriod period) {
    if (createdAtStr == null) return false;
    final createdAt = DateTime.tryParse(createdAtStr);
    if (createdAt == null) return false;
    final now = DateTime.now();
    final startOfToday = DateTime(now.year, now.month, now.day);

    switch (period) {
      case ReportPeriod.today:
        return createdAt.isAfter(startOfToday) || createdAt.isAtSameMomentAs(startOfToday);
      case ReportPeriod.thisWeek:
        final startOfWeek = now.subtract(Duration(days: now.weekday - 1));
        final startOfWeekDay = DateTime(startOfWeek.year, startOfWeek.month, startOfWeek.day);
        return createdAt.isAfter(startOfWeekDay) || createdAt.isAtSameMomentAs(startOfWeekDay);
      case ReportPeriod.thisMonth:
        final startOfMonth = DateTime(now.year, now.month, 1);
        return createdAt.isAfter(startOfMonth) || createdAt.isAtSameMomentAs(startOfMonth);
      case ReportPeriod.last30:
        final start30 = now.subtract(const Duration(days: 30));
        return createdAt.isAfter(start30);
      case ReportPeriod.last90:
        final start90 = now.subtract(const Duration(days: 90));
        return createdAt.isAfter(start90);
      case ReportPeriod.custom:
        return true;
    }
  }

  double _calculateTotalValue(List<dynamic> list) {
    double total = 0.0;
    for (var item in list) {
      final priceVal = item['price'];
      if (priceVal != null) {
        final parsed = double.tryParse(priceVal.toString());
        if (parsed != null) total += parsed;
      }
    }
    return total;
  }

  String _formatCurrency(double val) {
    final formatter = intl.NumberFormat.decimalPattern();
    return 'TSh ${formatter.format(val)}';
  }

  String get _activeDateRangeLabel {
    if (_dateStart == null) return '';
    final fmt = intl.DateFormat('MMM dd, yyyy');
    if (_dateEnd == null || _dateEnd == _dateStart) {
      return fmt.format(_dateStart!);
    }
    return '${fmt.format(_dateStart!)} – ${fmt.format(_dateEnd!)}';
  }

  Future<void> _exportReport() async {
    setState(() => _exporting = true);
    try {
      final String timestamp = intl.DateFormat('yyyyMMdd_HHmm').format(DateTime.now());
      Uint8List pdfBytes;
      try {
        pdfBytes = await ApiService.generateOperatorReport(type: widget.title, period: _period.key);
      } catch (e) {
        debugPrint('Server-side PDF failed, falling back to local: $e');
        pdfBytes = await _generateLocalPdfReport();
      }
      await Printing.sharePdf(bytes: pdfBytes, filename: 'mizigo_${widget.title.toLowerCase()}_report_$timestamp.pdf');
    } catch (e) {
      if (mounted) {
        MizigoToasts.showError(context, 'Failed to download report: $e');
      }
    } finally {
      if (mounted) setState(() => _exporting = false);
    }
  }

  Future<Uint8List> _generateLocalPdfReport() async {
    final pdf = pw.Document();
    final font = await PdfGoogleFonts.interRegular();
    final boldFont = await PdfGoogleFonts.interBold();

    pdf.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        margin: const pw.EdgeInsets.all(32),
        build: (context) => [
          pw.Header(
            level: 0,
            child: pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: [
                pw.Text(
                  'Mizigo Logistical Report',
                  style: pw.TextStyle(font: boldFont, fontSize: 24, fontWeight: pw.FontWeight.bold),
                ),
                pw.Text(
                  widget.title.toUpperCase(),
                  style: pw.TextStyle(font: boldFont, fontSize: 18, color: PdfColors.blue700),
                ),
              ],
            ),
          ),
          pw.Paragraph(
            text:
                'Generated on ${intl.DateFormat('MMM dd, yyyy HH:mm').format(DateTime.now())}\nFilter: ${_isDateRangeActive ? _activeDateRangeLabel : _period.label}',
            style: pw.TextStyle(font: font, fontSize: 12),
          ),
          pw.Divider(),
          pw.SizedBox(height: 16),
          pw.Text(
            'Summary',
            style: pw.TextStyle(font: boldFont, fontSize: 16, fontWeight: pw.FontWeight.bold),
          ),
          pw.Bullet(
            text: 'Total Volume: ${_filteredParcels.length} parcels',
            style: pw.TextStyle(font: font),
          ),
          pw.Bullet(
            text: 'Total Declared Valuation: ${_formatCurrency(_calculateTotalValue(_filteredParcels))}',
            style: pw.TextStyle(font: font),
          ),
          pw.SizedBox(height: 24),
          pw.Text(
            'Parcel Listings',
            style: pw.TextStyle(font: boldFont, fontSize: 16, fontWeight: pw.FontWeight.bold),
          ),
          pw.SizedBox(height: 8),
          pw.TableHelper.fromTextArray(
            headers: ['Tracking ID', 'From', 'To', 'Price', 'Description'],
            data: _filteredParcels
                .map(
                  (p) => [
                    p['trackingNumber'] ?? p['id'] ?? 'N/A',
                    p['fromAddress'] ?? 'N/A',
                    p['toAddress'] ?? 'N/A',
                    _formatCurrency(double.tryParse((p['price'] ?? 0).toString()) ?? 0),
                    p['description'] ?? 'No Description',
                  ],
                )
                .toList(),
            headerStyle: pw.TextStyle(font: boldFont, color: PdfColors.white),
            headerDecoration: const pw.BoxDecoration(color: PdfColors.blueGrey900),
            cellStyle: pw.TextStyle(font: font, fontSize: 10),
            cellAlignment: pw.Alignment.centerLeft,
          ),
        ],
      ),
    );
    return pdf.save();
  }

  void _openParcel(Map<String, dynamic> json) {
    context.push('/operator/scanned-details', extra: ParcelModel.fromJson(json));
  }

  @override
  Widget build(BuildContext context) {
    final palette = StaffPalette.of(context);
    final count = _filteredParcels.length;
    final totalValue = _calculateTotalValue(_filteredParcels);
    final periodText = _isDateRangeActive ? _activeDateRangeLabel : _period.label;
    final base = widget.color;
    final dark = Color.lerp(base, Colors.black, 0.55)!;
    final white75 = Colors.white.withValues(alpha: 0.75);
    final fmt = intl.NumberFormat.decimalPattern();

    return StaffSettingsScaffold(
      title: '${widget.title} Details',
      onBack: () => context.pop(),
      onRefresh: _fetchParcels,
      trailing: IconButton(
        tooltip: 'Export PDF',
        onPressed: (_exporting || count == 0) ? null : _exportReport,
        icon: _exporting
            ? SizedBox(width: 20, height: 20, child: CircularProgressIndicator(strokeWidth: 2, color: palette.fg()))
            : HugeIcon(
                icon: kStaffDownloadIcon,
                color: count == 0 ? palette.fg(0.3) : palette.fg(),
                size: 24,
              ),
      ),
      children: [
        // ── Summary ──────────────────────────────────────────────────
        BridgeCard(
          colors: [base, dark],
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(9),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.18),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: IconTheme(
                      data: const IconThemeData(color: Colors.white, size: 22),
                      child: widget.icon,
                    ),
                  ),
                  const Gap(10),
                  Expanded(
                    child: Text(
                      periodText,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.outfit(fontSize: 15, fontWeight: FontWeight.w600, color: Colors.white),
                    ),
                  ),
                ],
              ),
              const Gap(20),
              if (_loading)
                const SizedBox(
                  height: 70,
                  child: Center(child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2)),
                )
              else if (count == 0) ...[
                Text(
                  'Nothing ${widget.title.toLowerCase()} yet',
                  style: GoogleFonts.outfit(fontSize: 24, fontWeight: FontWeight.w700, color: Colors.white),
                ),
                const Gap(4),
                Text('No parcels match this period.', style: GoogleFonts.outfit(fontSize: 14, color: white75)),
              ] else ...[
                Text(
                  '${widget.title} parcels',
                  style: GoogleFonts.outfit(fontSize: 14, color: white75),
                ),
                Text(
                  fmt.format(count),
                  style: GoogleFonts.outfit(fontSize: 44, fontWeight: FontWeight.w800, height: 1.1, color: Colors.white),
                ),
                const Gap(16),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.12),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    children: [
                      Expanded(child: BridgeStat(label: 'Declared value', value: _formatCurrency(totalValue))),
                      Container(width: 1, height: 34, color: Colors.white.withValues(alpha: 0.2)),
                      const Gap(12),
                      Expanded(
                        child: BridgeStat(
                          label: 'Average per parcel',
                          value: _formatCurrency(totalValue / count),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ],
          ),
        ),
        const Gap(18),

        // ── Period filter ────────────────────────────────────────────
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              for (final (p, label) in _allPills) ...[
                StaffChoiceChip(
                  label: label,
                  selected: !_isDateRangeActive && _period == p,
                  onTap: () => setState(() {
                    _dateStart = null;
                    _dateEnd = null;
                    _period = p;
                    _filterParcels();
                  }),
                ),
                const Gap(8),
              ],
              StaffChoiceChip(
                label: _isDateRangeActive ? _activeDateRangeLabel : 'Pick dates',
                selected: _isDateRangeActive,
                onTap: _showDateRangeModal,
              ),
              if (_isDateRangeActive)
                IconButton(
                  tooltip: 'Clear dates',
                  onPressed: _clearDateRange,
                  icon: HugeIcon(icon: HugeIcons.strokeRoundedCancelCircle, color: palette.fg(0.6), size: 20),
                ),
            ],
          ),
        ),
        const Gap(22),

        // ── Parcels ──────────────────────────────────────────────────
        if (_loading)
          for (var i = 0; i < 3; i++)
            Container(
              height: 140,
              margin: const EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(color: palette.surface(0.08), borderRadius: BorderRadius.circular(24)),
            )
        else if (count == 0)
          _KpiEmptyState(
            color: kStaffAccent,
            title: 'No ${widget.title.toLowerCase()} parcels',
            message: _isDateRangeActive
                ? 'Nothing was recorded between $_activeDateRangeLabel. Try other dates.'
                : 'Nothing was recorded ${_period.label.toLowerCase()}. Try a longer period or pick dates.',
            actionLabel: _isDateRangeActive ? 'Clear dates' : 'Pick dates',
            onAction: _isDateRangeActive ? _clearDateRange : _showDateRangeModal,
          )
        else ...[
          Row(
            children: [
              Text('Parcels', style: GoogleFonts.outfit(fontSize: 19, fontWeight: FontWeight.w700, color: palette.fg())),
              const Gap(8),
              Text('$count', style: GoogleFonts.outfit(fontSize: 16, color: palette.fg(0.5))),
            ],
          ),
          const Gap(10),
          for (final p in _filteredParcels)
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: ParcelSummaryCard(
                parcel: ParcelModel.fromJson(Map<String, dynamic>.from(p as Map)),
                onTap: () => _openParcel(Map<String, dynamic>.from(p)),
              ),
            ),
        ],
      ],
    );
  }
}

class _KpiEmptyState extends StatelessWidget {
  const _KpiEmptyState({
    required this.color,
    required this.title,
    required this.message,
    required this.actionLabel,
    required this.onAction,
  });

  final Color color;
  final String title;
  final String message;
  final String actionLabel;
  final VoidCallback onAction;

  @override
  Widget build(BuildContext context) {
    final palette = StaffPalette.of(context);
    return Container(
      padding: const EdgeInsets.fromLTRB(24, 32, 24, 24),
      decoration: BoxDecoration(
        color: palette.surface(0.06),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: palette.fg(0.1)),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(color: color.withValues(alpha: 0.14), shape: BoxShape.circle),
            child: HugeIcon(icon: HugeIcons.strokeRoundedPackageSearch, color: color, size: 36),
          ),
          const Gap(16),
          Text(
            title,
            textAlign: TextAlign.center,
            style: GoogleFonts.outfit(fontSize: 19, fontWeight: FontWeight.w700, color: palette.fg()),
          ),
          const Gap(6),
          Text(
            message,
            textAlign: TextAlign.center,
            style: GoogleFonts.outfit(fontSize: 14, height: 1.4, color: palette.fg(0.6)),
          ),
          const Gap(20),
          StaffButton(label: actionLabel, icon: HugeIcons.strokeRoundedCalendar03, outlined: true, onPressed: onAction),
        ],
      ),
    );
  }
}
