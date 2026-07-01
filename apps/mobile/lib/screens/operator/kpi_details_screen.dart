import 'dart:typed_data';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gap/gap.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:intl/intl.dart' as intl;
import 'package:printing/printing.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import '../../services/api_service.dart';
import '../../widgets/profile/premium_settings_components.dart';
import 'operator_reports_screen.dart';

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
    final result = await showGeneralDialog<(DateTime, DateTime?)>(
      context: context,
      barrierDismissible: true,
      barrierLabel: 'Date range picker',
      barrierColor: Colors.transparent,
      transitionDuration: const Duration(milliseconds: 320),
      pageBuilder: (ctx, anim1, anim2) => const SizedBox.shrink(),
      transitionBuilder: (ctx, anim1, anim2, child) {
        return _DateRangeModal(
          accentColor: widget.color,
          initialStart: _dateStart,
          initialEnd: _dateEnd,
          animation: anim1,
        );
      },
    );
    if (!mounted) return;
    if (result != null) {
      setState(() {
        _dateStart = result.$1;
        _dateEnd = result.$2;
        _filterParcels();
      });
    }
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
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to load parcels: $e'),
            backgroundColor: const Color(0xFFEF4444),
          ),
        );
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
        pdfBytes = await ApiService.generateOperatorReport(
          type: widget.title,
          period: _period.key,
        );
      } catch (e) {
        debugPrint('Server-side PDF failed, falling back to local: $e');
        pdfBytes = await _generateLocalPdfReport();
      }
      await Printing.sharePdf(
        bytes: pdfBytes,
        filename: 'mizigo_${widget.title.toLowerCase()}_report_$timestamp.pdf',
      );
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to download report: $e'),
            backgroundColor: const Color(0xFFEF4444),
          ),
        );
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
                pw.Text('Mizigo Logistical Report',
                    style: pw.TextStyle(font: boldFont, fontSize: 24, fontWeight: pw.FontWeight.bold)),
                pw.Text(widget.title.toUpperCase(),
                    style: pw.TextStyle(font: boldFont, fontSize: 18, color: PdfColors.blue700)),
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
          pw.Text('Summary', style: pw.TextStyle(font: boldFont, fontSize: 16, fontWeight: pw.FontWeight.bold)),
          pw.Bullet(text: 'Total Volume: ${_filteredParcels.length} parcels', style: pw.TextStyle(font: font)),
          pw.Bullet(
              text: 'Total Declared Valuation: ${_formatCurrency(_calculateTotalValue(_filteredParcels))}',
              style: pw.TextStyle(font: font)),
          pw.SizedBox(height: 24),
          pw.Text('Parcel Listings',
              style: pw.TextStyle(font: boldFont, fontSize: 16, fontWeight: pw.FontWeight.bold)),
          pw.SizedBox(height: 8),
          pw.TableHelper.fromTextArray(
            headers: ['Tracking ID', 'From', 'To', 'Price', 'Description'],
            data: _filteredParcels
                .map((p) => [
                      p['trackingNumber'] ?? p['id'] ?? 'N/A',
                      p['fromAddress'] ?? 'N/A',
                      p['toAddress'] ?? 'N/A',
                      _formatCurrency(double.tryParse((p['price'] ?? 0).toString()) ?? 0),
                      p['description'] ?? 'No Description',
                    ])
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

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final totalValue = _calculateTotalValue(_filteredParcels);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: SettingsAppBar(
        title: '${widget.title} Details',
        actions: [
          IconButton(
            tooltip: 'Filter by date range',
            icon: HugeIcon(
              icon: HugeIcons.strokeRoundedCalendar03,
              color: _isDateRangeActive
                  ? widget.color
                  : (theme.appBarTheme.iconTheme?.color ?? Colors.white),
              size: 22,
            ),
            onPressed: _showDateRangeModal,
          ),
          IconButton(
            icon: _exporting
                ? const SizedBox(
                    width: 20, height: 20,
                    child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white))
                : HugeIcon(
                    icon: HugeIcons.strokeRoundedDownload01,
                    color: theme.appBarTheme.iconTheme?.color ?? Colors.white,
                    size: 24),
            onPressed: _exporting ? null : _exportReport,
          ),
        ],
      ),
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: _fetchParcels,
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(24, 16, 24, 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // ── Header Row ──────────────────────────────────────
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: widget.color.withValues(alpha: 0.1),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Theme(
                              data: theme.copyWith(
                                iconTheme: IconThemeData(color: widget.color, size: 28),
                              ),
                              child: widget.icon,
                            ),
                          ),
                          const Gap(16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.title,
                                  style: GoogleFonts.outfit(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w800,
                                    color: theme.textTheme.bodyLarge?.color ?? Colors.white,
                                  ),
                                ),
                                Text(
                                  _isDateRangeActive
                                      ? _activeDateRangeLabel
                                      : '${_period.label} Overview',
                                  style: GoogleFonts.inter(
                                    fontSize: 14,
                                    color: _isDateRangeActive
                                        ? widget.color
                                        : (theme.textTheme.bodyMedium?.color?.withValues(alpha: 0.7) ??
                                            const Color(0xFF64748B)),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const Gap(24),

                      // ── Filter Pills ────────────────────────────────────
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            // Active date-range chip
                            if (_isDateRangeActive)
                              GestureDetector(
                                onTap: _clearDateRange,
                                child: AnimatedContainer(
                                  duration: const Duration(milliseconds: 180),
                                  margin: const EdgeInsets.only(right: 8),
                                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                                  decoration: BoxDecoration(
                                    color: widget.color.withValues(alpha: 0.15),
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                        color: widget.color.withValues(alpha: 0.6), width: 1.5),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      HugeIcon(
                                          icon: HugeIcons.strokeRoundedCalendar03,
                                          color: widget.color,
                                          size: 14),
                                      const SizedBox(width: 6),
                                      Text(
                                        _activeDateRangeLabel,
                                        style: GoogleFonts.inter(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w700,
                                            color: widget.color),
                                      ),
                                      const SizedBox(width: 6),
                                      HugeIcon(
                                          icon: HugeIcons.strokeRoundedCancel01,
                                          color: widget.color,
                                          size: 14),
                                    ],
                                  ),
                                ),
                              ),
                            // Period pills (dimmed during date range)
                            ..._allPills.map((pill) {
                              final isSelected = !_isDateRangeActive && _period == pill.$1;
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _dateStart = null;
                                    _dateEnd = null;
                                    _period = pill.$1;
                                    _filterParcels();
                                  });
                                },
                                child: AnimatedContainer(
                                  duration: const Duration(milliseconds: 180),
                                  margin: const EdgeInsets.only(right: 8),
                                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                                  decoration: BoxDecoration(
                                    color: isSelected
                                        ? widget.color.withValues(alpha: 0.15)
                                        : theme.cardTheme.color ?? theme.colorScheme.surface,
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                      color: isSelected
                                          ? widget.color.withValues(alpha: 0.6)
                                          : theme.colorScheme.outline,
                                      width: isSelected ? 1.5 : 1,
                                    ),
                                  ),
                                  child: Text(
                                    pill.$2,
                                    style: GoogleFonts.inter(
                                      fontSize: 13,
                                      fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                                      color: isSelected
                                          ? widget.color
                                          : (theme.textTheme.bodyMedium?.color ??
                                                  const Color(0xFF94A3B8))
                                              .withValues(alpha: _isDateRangeActive ? 0.4 : 1.0),
                                    ),
                                  ),
                                ),
                              );
                            }),
                            // "Pick Range" pill
                            GestureDetector(
                              onTap: _showDateRangeModal,
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 180),
                                margin: const EdgeInsets.only(right: 4),
                                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                                decoration: BoxDecoration(
                                  color: theme.cardTheme.color ?? theme.colorScheme.surface,
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(color: theme.colorScheme.outline),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    HugeIcon(
                                      icon: HugeIcons.strokeRoundedCalendar03,
                                      color: theme.textTheme.bodyMedium?.color ??
                                          const Color(0xFF94A3B8),
                                      size: 14,
                                    ),
                                    const SizedBox(width: 6),
                                    Text(
                                      'Pick Range',
                                      style: GoogleFonts.inter(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500,
                                        color: theme.textTheme.bodyMedium?.color ??
                                            const Color(0xFF94A3B8),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Gap(24),

                      // ── Summary Cards (always visible) ──────────────────
                      Row(
                        children: [
                          Expanded(
                            child: _SummaryStatCard(
                              title: 'Total Volume',
                              value: _loading ? '—' : _filteredParcels.length.toString(),
                              subtitle: _filteredParcels.isEmpty && !_loading
                                  ? 'No data available'
                                  : 'Parcels count',
                              icon: HugeIcons.strokeRoundedPackage,
                              color: widget.color,
                              isEmpty: !_loading && _filteredParcels.isEmpty,
                            ),
                          ),
                          const Gap(16),
                          Expanded(
                            child: _SummaryStatCard(
                              title: 'Declared Value',
                              value: _loading ? '—' : _formatCurrency(totalValue),
                              subtitle: _filteredParcels.isEmpty && !_loading
                                  ? 'No data available'
                                  : 'Financial valuation',
                              icon: HugeIcons.strokeRoundedCoins01,
                              color: const Color(0xFF10B981),
                              isEmpty: !_loading && _filteredParcels.isEmpty,
                            ),
                          ),
                        ],
                      ),
                      const Gap(32),

                      // ── Export CTA ──────────────────────────────────────
                      Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: isDark ? const Color(0xFF1E293B) : const Color(0xFFF1F5F9),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Need a physical copy?',
                                    style: GoogleFonts.outfit(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 16,
                                        color: theme.textTheme.bodyLarge?.color),
                                  ),
                                  const Gap(4),
                                  Text(
                                    _filteredParcels.isEmpty
                                        ? 'No transactions to export for this filter.'
                                        : 'Download these ${_filteredParcels.length} transactions as a PDF document.',
                                    style: GoogleFonts.inter(
                                        fontSize: 13,
                                        color: theme.textTheme.bodyMedium?.color
                                            ?.withValues(alpha: 0.7)),
                                  ),
                                ],
                              ),
                            ),
                            const Gap(16),
                            ElevatedButton(
                              onPressed: (_exporting || _filteredParcels.isEmpty) ? null : _exportReport,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: widget.color,
                                disabledBackgroundColor:
                                    widget.color.withValues(alpha: 0.35),
                                foregroundColor: Colors.white,
                                elevation: 0,
                                minimumSize: const Size(0, 44),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12)),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 12),
                              ),
                              child: _exporting
                                  ? const SizedBox(
                                      width: 18,
                                      height: 18,
                                      child: CircularProgressIndicator(
                                          strokeWidth: 2, color: Colors.white))
                                  : Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        const HugeIcon(
                                            icon: HugeIcons.strokeRoundedDownload01,
                                            color: Colors.white,
                                            size: 16),
                                        const Gap(8),
                                        Text('PDF',
                                            style: GoogleFonts.inter(
                                                fontWeight: FontWeight.w700, fontSize: 13)),
                                      ],
                                    ),
                            ),
                          ],
                        ),
                      ),
                      const Gap(32),

                      Text(
                        'Transactions Table List',
                        style: GoogleFonts.outfit(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: theme.textTheme.titleMedium?.color ?? Colors.white,
                        ),
                      ),
                      const Gap(16),
                    ],
                  ),
                ),
              ),

              // ── Table / Empty / Loading ──────────────────────────────────
              if (_loading)
                const SliverFillRemaining(
                  hasScrollBody: false,
                  child: Center(child: CircularProgressIndicator()),
                )
              else if (_filteredParcels.isEmpty)
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(24, 8, 24, 60),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 48, horizontal: 24),
                      decoration: BoxDecoration(
                        color: isDark
                            ? const Color(0xFF0F172A).withValues(alpha: 0.6)
                            : const Color(0xFFF8FAFC),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                            color: theme.colorScheme.outline.withValues(alpha: 0.5)),
                      ),
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color: widget.color.withValues(alpha: 0.08),
                              shape: BoxShape.circle,
                            ),
                            child: HugeIcon(
                              icon: HugeIcons.strokeRoundedPackage,
                              color: widget.color.withValues(alpha: 0.5),
                              size: 48,
                            ),
                          ),
                          const Gap(20),
                          Text(
                            'No data is available',
                            style: GoogleFonts.outfit(
                              fontSize: 20,
                              fontWeight: FontWeight.w800,
                              color: theme.textTheme.bodyLarge?.color,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              else
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 24.0, right: 24.0, bottom: 40.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: theme.cardTheme.color ?? theme.colorScheme.surface,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: theme.colorScheme.outline),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: DataTable(
                            headingRowColor: WidgetStateProperty.all(
                              isDark
                                  ? const Color(0xFF0F172A)
                                  : const Color(0xFFF8FAFC),
                            ),
                            columns: [
                              DataColumn(
                                  label: Text('Tracking ID',
                                      style: GoogleFonts.inter(fontWeight: FontWeight.w700))),
                              DataColumn(
                                  label: Text('Route',
                                      style: GoogleFonts.inter(fontWeight: FontWeight.w700))),
                              DataColumn(
                                  label: Text('Description',
                                      style: GoogleFonts.inter(fontWeight: FontWeight.w700))),
                              DataColumn(
                                  label: Text('Price',
                                      style: GoogleFonts.inter(fontWeight: FontWeight.w700))),
                              DataColumn(
                                  label: Text('Date',
                                      style: GoogleFonts.inter(fontWeight: FontWeight.w700))),
                            ],
                            rows: _filteredParcels.map((parcel) {
                              final price =
                                  double.tryParse((parcel['price'] ?? 0).toString()) ?? 0.0;
                              final dateStr = parcel['createdAt'];
                              final formattedDate = dateStr != null
                                  ? intl.DateFormat('MMM dd, hh:mm a')
                                      .format(DateTime.parse(dateStr))
                                  : 'N/A';

                              return DataRow(
                                cells: [
                                  DataCell(Text(
                                    parcel['trackingNumber'] ?? parcel['id'] ?? 'N/A',
                                    style: GoogleFonts.outfit(
                                        fontWeight: FontWeight.w600,
                                        color: theme.colorScheme.primary),
                                  )),
                                  DataCell(Text(
                                    '${parcel['fromAddress'] ?? 'N/A'} → ${parcel['toAddress'] ?? 'N/A'}',
                                    style: GoogleFonts.inter(fontSize: 13),
                                  )),
                                  DataCell(SizedBox(
                                    width: 150,
                                    child: Text(
                                      parcel['description'] ?? 'No Description',
                                      style: GoogleFonts.inter(fontSize: 13),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  )),
                                  DataCell(Text(
                                    _formatCurrency(price),
                                    style:
                                        GoogleFonts.outfit(fontWeight: FontWeight.w700, fontSize: 13),
                                  )),
                                  DataCell(Text(
                                    formattedDate,
                                    style: GoogleFonts.inter(fontSize: 13),
                                  )),
                                ],
                              );
                            }).toList(),
                          ),
                        ),
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
}

// ════════════════════════════════════════════════════════════════
//  Custom Date Range Modal — Premium glassmorphism design
// ════════════════════════════════════════════════════════════════

class _DateRangeModal extends StatefulWidget {
  final Color accentColor;
  final DateTime? initialStart;
  final DateTime? initialEnd;
  final Animation<double> animation;

  const _DateRangeModal({
    required this.accentColor,
    required this.animation,
    this.initialStart,
    this.initialEnd,
  });

  @override
  State<_DateRangeModal> createState() => _DateRangeModalState();
}

class _DateRangeModalState extends State<_DateRangeModal> {
  late DateTime _focusedMonth;
  DateTime? _startDate;
  DateTime? _endDate;
  bool _selectingEnd = false;

  static const List<String> _months = [
    'January', 'February', 'March', 'April', 'May', 'June',
    'July', 'August', 'September', 'October', 'November', 'December'
  ];
  static const List<String> _days = ['Mo', 'Tu', 'We', 'Th', 'Fr', 'Sa', 'Su'];

  @override
  void initState() {
    super.initState();
    _startDate = widget.initialStart;
    _endDate = widget.initialEnd;
    _focusedMonth = widget.initialStart ??
        DateTime(DateTime.now().year, DateTime.now().month, 1);
    _selectingEnd = _startDate != null;
  }

  void _prevMonth() {
    setState(() {
      _focusedMonth = DateTime(_focusedMonth.year, _focusedMonth.month - 1);
    });
  }

  void _nextMonth() {
    setState(() {
      _focusedMonth = DateTime(_focusedMonth.year, _focusedMonth.month + 1);
    });
  }

  void _onDayTap(DateTime day) {
    setState(() {
      if (!_selectingEnd) {
        // Picking start
        _startDate = day;
        _endDate = null;
        _selectingEnd = true;
      } else {
        if (day.isBefore(_startDate!)) {
          // Tapped before start — restart
          _startDate = day;
          _endDate = null;
        } else if (day == _startDate!) {
          // Same day = single day
          _endDate = null;
          _selectingEnd = false;
        } else {
          _endDate = day;
          _selectingEnd = false;
        }
      }
    });
  }

  bool _isStart(DateTime d) =>
      _startDate != null &&
      d.year == _startDate!.year &&
      d.month == _startDate!.month &&
      d.day == _startDate!.day;

  bool _isEnd(DateTime d) =>
      _endDate != null &&
      d.year == _endDate!.year &&
      d.month == _endDate!.month &&
      d.day == _endDate!.day;

  bool _isInRange(DateTime d) {
    if (_startDate == null || _endDate == null) return false;
    return d.isAfter(_startDate!) && d.isBefore(_endDate!);
  }

  bool _isToday(DateTime d) {
    final now = DateTime.now();
    return d.year == now.year && d.month == now.month && d.day == now.day;
  }

  bool _isFuture(DateTime d) => d.isAfter(DateTime.now());

  List<DateTime?> _buildCalendarDays() {
    final firstDay = DateTime(_focusedMonth.year, _focusedMonth.month, 1);
    final lastDay = DateTime(_focusedMonth.year, _focusedMonth.month + 1, 0);
    // Monday = 1 ... Sunday = 7
    final leadingBlanks = (firstDay.weekday - 1) % 7;
    // Use growable:true so we can append dates to the list
    final List<DateTime?> days = List.filled(leadingBlanks, null, growable: true);
    for (int i = 1; i <= lastDay.day; i++) {
      days.add(DateTime(_focusedMonth.year, _focusedMonth.month, i));
    }
    return days;
  }

  Widget _buildCalendarGrid(
      List<DateTime?> calDays, Color accent, ThemeData theme) {
    // Pad list to a multiple of 7 so rows are complete
    final padded = List<DateTime?>.from(calDays);
    while (padded.length % 7 != 0) {
      padded.add(null);
    }

    final rows = <Widget>[];
    for (int rowStart = 0; rowStart < padded.length; rowStart += 7) {
      final rowCells = <Widget>[];
      for (int col = 0; col < 7; col++) {
        final day = padded[rowStart + col];
        rowCells.add(Expanded(child: _buildDayCell(day, accent, theme)));
      }
      rows.add(Row(
        mainAxisSize: MainAxisSize.max,
        children: rowCells,
      ));
      if (rowStart + 7 < padded.length) {
        rows.add(const SizedBox(height: 4));
      }
    }

    return Column(mainAxisSize: MainAxisSize.min, children: rows);
  }

  Widget _buildDayCell(DateTime? day, Color accent, ThemeData theme) {
    if (day == null) return const SizedBox(height: 40);

    final isStart = _isStart(day);
    final isEnd = _isEnd(day);
    final inRange = _isInRange(day);
    final today = _isToday(day);
    final future = _isFuture(day);
    final selected = isStart || isEnd;

    Color bgColor = Colors.transparent;
    Color textColor = theme.textTheme.bodyLarge?.color ?? Colors.white;

    if (future) {
      textColor = textColor.withValues(alpha: 0.25);
    } else if (selected) {
      bgColor = accent;
      textColor = Colors.white;
    } else if (inRange) {
      bgColor = accent.withValues(alpha: 0.12);
      textColor = accent;
    }

    return GestureDetector(
      onTap: future ? null : () => _onDayTap(day),
      behavior: HitTestBehavior.opaque,
      child: SizedBox(
        height: 40,
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Full-width range tint for cells strictly inside range
            if (inRange)
              Positioned.fill(
                child: Container(color: accent.withValues(alpha: 0.08)),
              ),
            // Right-half tint on start cell when a range is active
            if (isStart && _endDate != null)
              Positioned(right: 0, top: 0, bottom: 0, width: 20,
                child: Container(color: accent.withValues(alpha: 0.08))),
            // Left-half tint on end cell
            if (isEnd && _startDate != null)
              Positioned(left: 0, top: 0, bottom: 0, width: 20,
                child: Container(color: accent.withValues(alpha: 0.08))),
            // Circle
            Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: bgColor,
                shape: BoxShape.circle,
                border: today && !selected
                    ? Border.all(color: accent.withValues(alpha: 0.55), width: 1.5)
                    : null,
              ),
              child: Center(
                child: Text(
                  '${day.day}',
                  style: GoogleFonts.inter(
                    fontSize: 13,
                    fontWeight:
                        selected || inRange ? FontWeight.w700 : FontWeight.w500,
                    color: textColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _formatLabel(DateTime? d) {
    if (d == null) return '—';
    return intl.DateFormat('MMM dd, yyyy').format(d);
  }

  void _apply() {
    if (_startDate == null) return;
    Navigator.of(context).pop((_startDate!, _endDate));
  }

  void _clear() {
    Navigator.of(context).pop(null);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final accent = widget.accentColor;
    final calDays = _buildCalendarDays();

    final slideAnim = Tween<Offset>(
      begin: const Offset(0, 1),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: widget.animation, curve: Curves.easeOutCubic));

    final fadeAnim = Tween<double>(begin: 0.0, end: 1.0)
        .animate(CurvedAnimation(parent: widget.animation, curve: Curves.easeOut));

    return Stack(
      children: [
        // ── Blurry backdrop ─────────────────────────────────────────────
        FadeTransition(
          opacity: fadeAnim,
          child: GestureDetector(
            onTap: () => Navigator.of(context).pop(null),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 14, sigmaY: 14),
              child: Container(
                color: (isDark ? Colors.black : Colors.black).withValues(alpha: 0.55),
              ),
            ),
          ),
        ),

        // ── Modal sheet ─────────────────────────────────────────────────
        Align(
          alignment: Alignment.bottomCenter,
          child: SlideTransition(
            position: slideAnim,
            child: SafeArea(
              top: false,
              child: Container(
                width: double.infinity,
                margin: const EdgeInsets.fromLTRB(12, 0, 12, 16),
                decoration: BoxDecoration(
                  color: isDark ? const Color(0xFF0F1623) : Colors.white,
                  borderRadius: BorderRadius.circular(28),
                  border: Border.all(
                    color: isDark
                        ? Colors.white.withValues(alpha: 0.08)
                        : Colors.black.withValues(alpha: 0.06),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.4),
                      blurRadius: 40,
                      spreadRadius: 0,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(28),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Drag handle
                      Padding(
                        padding: const EdgeInsets.only(top: 12),
                        child: Container(
                          width: 36,
                          height: 4,
                          decoration: BoxDecoration(
                            color: isDark
                                ? Colors.white.withValues(alpha: 0.15)
                                : Colors.black.withValues(alpha: 0.12),
                            borderRadius: BorderRadius.circular(2),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(24, 20, 24, 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // ── Title row ──────────────────────────────
                            Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: accent.withValues(alpha: 0.12),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: HugeIcon(
                                      icon: HugeIcons.strokeRoundedCalendar03,
                                      color: accent,
                                      size: 20),
                                ),
                                const Gap(12),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Filter by Date Range',
                                        style: GoogleFonts.outfit(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w800,
                                          color: theme.textTheme.bodyLarge?.color,
                                        ),
                                      ),
                                      Text(
                                        _selectingEnd && _startDate != null
                                            ? 'Now pick an end date (or tap Apply)'
                                            : 'Tap a day to start',
                                        style: GoogleFonts.inter(
                                          fontSize: 12,
                                          color: theme.textTheme.bodySmall?.color
                                              ?.withValues(alpha: 0.6),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const Gap(20),

                            // ── Selected range row ──────────────────────
                            Container(
                              padding: const EdgeInsets.all(14),
                              decoration: BoxDecoration(
                                color: isDark
                                    ? Colors.white.withValues(alpha: 0.04)
                                    : Colors.black.withValues(alpha: 0.03),
                                borderRadius: BorderRadius.circular(14),
                                border: Border.all(
                                  color: isDark
                                      ? Colors.white.withValues(alpha: 0.07)
                                      : Colors.black.withValues(alpha: 0.07),
                                ),
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: _DateBadge(
                                      label: 'From',
                                      value: _formatLabel(_startDate),
                                      accent: accent,
                                      active: _startDate != null,
                                      isDark: isDark,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 10),
                                    child: HugeIcon(
                                      icon: HugeIcons.strokeRoundedArrowRight01,
                                      color: isDark
                                          ? Colors.white.withValues(alpha: 0.3)
                                          : Colors.black.withValues(alpha: 0.3),
                                      size: 16,
                                    ),
                                  ),
                                  Expanded(
                                    child: _DateBadge(
                                      label: 'To',
                                      value: _formatLabel(_endDate),
                                      accent: accent,
                                      active: _endDate != null,
                                      isDark: isDark,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const Gap(20),

                            // ── Month navigation ───────────────────────
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: _prevMonth,
                                  child: Container(
                                    width: 36,
                                    height: 36,
                                    decoration: BoxDecoration(
                                      color: isDark
                                          ? Colors.white.withValues(alpha: 0.06)
                                          : Colors.black.withValues(alpha: 0.05),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Center(
                                      child: HugeIcon(
                                        icon: HugeIcons.strokeRoundedArrowLeft01,
                                        color: theme.textTheme.bodyMedium?.color ??
                                            Colors.white,
                                        size: 16,
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Center(
                                    child: Text(
                                      '${_months[_focusedMonth.month - 1]} ${_focusedMonth.year}',
                                      style: GoogleFonts.outfit(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                        color: theme.textTheme.bodyLarge?.color,
                                      ),
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: _isFuture(DateTime(
                                          _focusedMonth.year, _focusedMonth.month + 1))
                                      ? null
                                      : _nextMonth,
                                  child: Container(
                                    width: 36,
                                    height: 36,
                                    decoration: BoxDecoration(
                                      color: isDark
                                          ? Colors.white.withValues(alpha: 0.06)
                                          : Colors.black.withValues(alpha: 0.05),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Center(
                                      child: HugeIcon(
                                        icon: HugeIcons.strokeRoundedArrowRight01,
                                        color: _isFuture(DateTime(
                                                _focusedMonth.year, _focusedMonth.month + 1))
                                            ? (theme.textTheme.bodyMedium?.color
                                                    ?.withValues(alpha: 0.2) ??
                                                Colors.white24)
                                            : (theme.textTheme.bodyMedium?.color ??
                                                Colors.white),
                                        size: 16,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const Gap(16),

                            // ── Day-of-week headers ────────────────────
                            Row(
                              children: _days.map((d) {
                                return Expanded(
                                  child: Center(
                                    child: Text(
                                      d,
                                      style: GoogleFonts.inter(
                                        fontSize: 11,
                                        fontWeight: FontWeight.w700,
                                        color: theme.textTheme.bodySmall?.color
                                            ?.withValues(alpha: 0.5),
                                      ),
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                            const Gap(10),

                            // ── Calendar grid (Table-based, no shrinkWrap) ─
                            _buildCalendarGrid(calDays, accent, theme),
                            const Gap(20),
                          ],
                        ),
                      ),

                      // ── Action buttons ──────────────────────────────────
                      Container(
                        padding: const EdgeInsets.fromLTRB(24, 16, 24, 24),
                        decoration: BoxDecoration(
                          border: Border(
                            top: BorderSide(
                              color: isDark
                                  ? Colors.white.withValues(alpha: 0.07)
                                  : Colors.black.withValues(alpha: 0.07),
                            ),
                          ),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: OutlinedButton(
                                onPressed: _clear,
                                style: OutlinedButton.styleFrom(
                                  foregroundColor:
                                      theme.textTheme.bodyMedium?.color,
                                  side: BorderSide(
                                    color: isDark
                                        ? Colors.white.withValues(alpha: 0.15)
                                        : Colors.black.withValues(alpha: 0.15),
                                  ),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(14)),
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 14),
                                ),
                                child: Text('Clear',
                                    style: GoogleFonts.inter(fontWeight: FontWeight.w600)),
                              ),
                            ),
                            const Gap(12),
                            Expanded(
                              flex: 2,
                              child: ElevatedButton(
                                onPressed: _startDate == null ? null : _apply,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: accent,
                                  disabledBackgroundColor:
                                      accent.withValues(alpha: 0.35),
                                  foregroundColor: Colors.white,
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(14)),
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 14),
                                ),
                                child: Text(
                                  _endDate != null
                                      ? 'Apply Range'
                                      : _startDate != null
                                          ? 'Apply Single Day'
                                          : 'Select a date',
                                  style: GoogleFonts.inter(fontWeight: FontWeight.w700),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

// Small badge widget for from/to date display
class _DateBadge extends StatelessWidget {
  final String label;
  final String value;
  final Color accent;
  final bool active;
  final bool isDark;

  const _DateBadge({
    required this.label,
    required this.value,
    required this.accent,
    required this.active,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label.toUpperCase(),
          style: GoogleFonts.inter(
            fontSize: 9,
            fontWeight: FontWeight.w800,
            letterSpacing: 1.2,
            color: active ? accent : (theme.textTheme.bodySmall?.color?.withValues(alpha: 0.4)),
          ),
        ),
        const SizedBox(height: 2),
        Text(
          value,
          style: GoogleFonts.outfit(
            fontSize: 13,
            fontWeight: FontWeight.w700,
            color: active
                ? (theme.textTheme.bodyLarge?.color)
                : (theme.textTheme.bodySmall?.color?.withValues(alpha: 0.4)),
          ),
        ),
      ],
    );
  }
}

// ════════════════════════════════════════════════════════════════
//  Summary stat card
// ════════════════════════════════════════════════════════════════

class _SummaryStatCard extends StatelessWidget {
  final String title;
  final String value;
  final String subtitle;
  final dynamic icon;
  final Color color;
  final bool isEmpty;

  const _SummaryStatCard({
    required this.title,
    required this.value,
    required this.subtitle,
    required this.icon,
    required this.color,
    this.isEmpty = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: theme.cardTheme.color ?? theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: isEmpty
              ? theme.colorScheme.outline.withValues(alpha: 0.4)
              : theme.colorScheme.outline,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: color.withValues(alpha: isEmpty ? 0.05 : 0.12),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: HugeIcon(
                    icon: icon,
                    color: color.withValues(alpha: isEmpty ? 0.35 : 1.0),
                    size: 20),
              ),
            ],
          ),
          const Gap(16),
          Text(
            value,
            style: GoogleFonts.outfit(
              fontSize: 24,
              fontWeight: FontWeight.w800,
              color: isEmpty
                  ? (theme.textTheme.bodyLarge?.color?.withValues(alpha: 0.35))
                  : theme.textTheme.bodyLarge?.color ?? Colors.white,
              height: 1.1,
            ),
          ),
          const Gap(4),
          Text(
            title,
            style: GoogleFonts.inter(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: theme.textTheme.bodyMedium?.color?.withValues(alpha: isEmpty ? 0.4 : 0.8),
            ),
          ),
          Text(
            subtitle,
            style: GoogleFonts.inter(
              fontSize: 10,
              color: isEmpty
                  ? color.withValues(alpha: 0.5)
                  : (theme.textTheme.bodySmall?.color?.withValues(alpha: 0.5) ??
                      const Color(0xFF64748B)),
            ),
          ),
        ],
      ),
    );
  }
}
