import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:intl/intl.dart' as intl;
import 'package:printing/printing.dart';
import 'package:provider/provider.dart';
import '../../providers/auth_provider.dart';
import '../../services/api_service.dart';
import '../../widgets/common/shimmer_utils.dart';
import 'kpi_details_screen.dart';
import '../../theme/staff_palette.dart';
import '../../widgets/common/station_header_art.dart';
import '../../widgets/staff/staff_settings.dart';
import '../../widgets/staff/date_range_sheet.dart';
import '../../widgets/staff/bridge_card.dart';
import '../../widgets/staff/action_cards.dart';
import '../../widgets/profile/premium_settings_components.dart';

// ─── Period enum ──────────────────────────────────────────────────────────────

enum ReportPeriod { today, thisWeek, thisMonth, last30, last90, custom }

extension ReportPeriodExt on ReportPeriod {
  String get label => switch (this) {
    ReportPeriod.today => 'Today',
    ReportPeriod.thisWeek => 'This Week',
    ReportPeriod.thisMonth => 'This Month',
    ReportPeriod.last30 => 'Last 30 Days',
    ReportPeriod.last90 => 'Last 90 Days',
    ReportPeriod.custom => 'Custom Range',
  };

  String get key => switch (this) {
    ReportPeriod.today => 'daily',
    ReportPeriod.thisWeek => 'weekly',
    ReportPeriod.thisMonth => 'monthly',
    ReportPeriod.last30 => 'last30',
    ReportPeriod.last90 => 'last90',
    ReportPeriod.custom => 'custom',
  };
}

enum ReportDownloadStatus { idle, downloading, success, failed, paused }

// ─── Screen ───────────────────────────────────────────────────────────────────

class OperatorReportsScreen extends StatefulWidget {
  const OperatorReportsScreen({super.key});

  @override
  State<OperatorReportsScreen> createState() => _OperatorReportsScreenState();
}

class _OperatorReportsScreenState extends State<OperatorReportsScreen> with SingleTickerProviderStateMixin {
  Map<String, dynamic> _stats = {};
  bool _loading = true;
  List<dynamic> _reportHistory = [];
  bool _historyLoading = false;

  ReportDownloadStatus _downloadStatus = ReportDownloadStatus.idle;

  /// Period chosen on the summary card; the metric tiles follow it.
  static const _summaryPeriods = [ReportPeriod.today, ReportPeriod.thisWeek, ReportPeriod.thisMonth];
  int _periodIndex = 0;
  int _retryCount = 0;
  final int _maxRetries = 5;

  @override
  void initState() {
    super.initState();
    _fetchStats();
    _fetchHistory();
  }

  Future<void> _fetchHistory() async {
    setState(() => _historyLoading = true);
    try {
      final res = await ApiService.getReportHistory();
      if (mounted) setState(() => _reportHistory = res);
    } catch (e) {
      debugPrint('Error fetching report history: $e');
    } finally {
      if (mounted) setState(() => _historyLoading = false);
    }
  }

  Future<void> _fetchStats({bool silent = false}) async {
    if (!silent && _stats.isEmpty) setState(() => _loading = true);
    try {
      final res = await ApiService.getOperatorStats();
      if (mounted) setState(() => _stats = res['data'] ?? res);
    } catch (e) {
      debugPrint('Error fetching operator stats: $e');
      if (mounted) {
        MizigoToasts.showError(context, 'Failed to fetch statistics: $e');
      }
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  int _valueForPeriod(String key, ReportPeriod period) {
    final periodKey = switch (period) {
      ReportPeriod.today => 'daily',
      ReportPeriod.thisWeek => 'weekly',
      ReportPeriod.thisMonth => 'monthly',
      ReportPeriod.last30 => 'last30',
      ReportPeriod.last90 => 'last90',
      ReportPeriod.custom => 'monthly',
    };
    final periodMap = _stats[periodKey];
    if (periodMap is Map) return (periodMap[key] as num?)?.toInt() ?? 0;
    return (_stats[key] as num?)?.toInt() ?? 0;
  }

  String _roleSubtitle(String role) => switch (role) {
    'CLERK' => 'Incoming & outgoing parcel metrics',
    'TRAIN_GUARD' => 'Dispatch & transit metrics',
    'STATION_MASTER' => 'Full station operational overview',
    _ => 'Analyze your operational metrics',
  };

  String _kpiSectionTitle(String role) => switch (role) {
    'CLERK' => 'Parcel KPIs',
    'TRAIN_GUARD' => 'Transit KPIs',
    'STATION_MASTER' => 'Station KPIs',
    _ => 'Operational KPIs',
  };

  static String _kpiImage(String key) => switch (key) {
    'delivered' => 'assets/images/staff_deliver.png',
    'sent' => 'assets/images/staff_parcel.png',
    _ => 'assets/images/staff_receive.png',
  };

  List<Widget> _buildKpiCards(String role, bool isCustomTheme, Color primary, Color secondary) {
    Widget kpi(String title, dynamic icon, Color defaultColor, String key) => _KpiCard(
      title: title,
      icon: icon,
      image: _kpiImage(key),
      color: isCustomTheme ? primary : defaultColor,
      dataKey: key,
      stats: _stats,
      valueForPeriod: _valueForPeriod,
      period: _summaryPeriods[_periodIndex],
    );

    Widget kpiSecondary(String title, dynamic icon, Color defaultColor, String key) => _KpiCard(
      title: title,
      icon: icon,
      image: _kpiImage(key),
      color: isCustomTheme ? secondary : defaultColor,
      dataKey: key,
      stats: _stats,
      valueForPeriod: _valueForPeriod,
      period: _summaryPeriods[_periodIndex],
    );

    final received = kpi(
      'Received',
      HugeIcons.strokeRoundedPackageReceive,
      Theme.of(context).colorScheme.primary,
      'received',
    );
    final delivered = kpiSecondary(
      'Delivered',
      HugeIcons.strokeRoundedCheckmarkBadge01,
      const Color(0xFF10B981),
      'delivered',
    );
    final dispatched = kpi('Dispatched', HugeIcons.strokeRoundedSpeedTrain02, const Color(0xFFF59E0B), 'sent');
    final atStation = kpiSecondary(
      'At Station',
      HugeIcons.strokeRoundedDeliveryBox01,
      Theme.of(context).colorScheme.primary,
      'atWarehouse',
    );

    // Only the metrics each role actually works with.
    return switch (role) {
      'CLERK' => [received, delivered],
      'TRAIN_GUARD' => [dispatched, atStation],
      _ => [received, delivered, dispatched, atStation],
    };
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final primaryColor = theme.colorScheme.primary;
    final secondaryColor = theme.colorScheme.secondary;
    final isCustomTheme = primaryColor.toARGB32() == 0xFF670E1E;
    final role = context.watch<AuthProvider>().user?.role?.toUpperCase() ?? '';

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: Stack(
        children: [
          const StationHeaderArt(blur: 8),
          SafeArea(
            child: ShimmerLoading(
              isLoading: _loading,
              child: _loading
                  ? const _ReportsSkeleton()
                  : LayoutBuilder(
                      builder: (context, box) {
                        final palette = StaffPalette.of(context);
                        final compact = box.maxHeight < 720;
                        final busy =
                            _downloadStatus == ReportDownloadStatus.downloading ||
                            _downloadStatus == ReportDownloadStatus.paused;
                        return RefreshIndicator(
                          onRefresh: () async {
                            await _fetchStats(silent: true);
                            await _fetchHistory();
                          },
                          color: kStaffAccent,
                          backgroundColor: palette.navBackground,
                          // Laid out to fit one screen; only scrolls if a small
                          // screen (or a station master's 4 metrics) needs it.
                          child: SingleChildScrollView(
                            physics: const AlwaysScrollableScrollPhysics(),
                            child: SizedBox(
                              // Exactly one screen; station masters (4 metrics)
                              // get extra room and scroll on short phones.
                              height: math.max(box.maxHeight, role == 'STATION_MASTER' ? 860 : 600),
                              child: SizedBox.expand(
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(18, compact ? 12 : 20, 18, 14),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.stretch,
                                    children: [
                                      // ── Header ──
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Reports',
                                                  style: GoogleFonts.outfit(
                                                    fontSize: 24,
                                                    fontWeight: FontWeight.w700,
                                                    color: palette.fg(),
                                                  ),
                                                ),
                                                const Gap(4),
                                                Text(
                                                  _roleSubtitle(role),
                                                  style: GoogleFonts.outfit(fontSize: 15, color: palette.fg(0.65)),
                                                ),
                                              ],
                                            ),
                                          ),
                                          _HeaderBtn(
                                            icon: HugeIcons.strokeRoundedClock01,
                                            onTap: _showHistory,
                                            tooltip: 'Recent downloads',
                                          ),
                                          const Gap(8),
                                          _HeaderBtn(
                                            icon: HugeIcons.strokeRoundedHelpCircle,
                                            onTap: () => _showHelp(context),
                                            tooltip: 'Help',
                                          ),
                                        ],
                                      ),
                                      Gap(compact ? 14 : 20),

                                      // ── Summary ──
                                      _VolumePageCarousel(
                                        stats: _stats,
                                        role: role,
                                        compact: compact,
                                        index: _periodIndex,
                                        onChanged: (i) => setState(() => _periodIndex = i),
                                      ),
                                      Gap(compact ? 12 : 16),

                                      // ── Main action ──
                                      StaffPrimaryActionCard(
                                        image: 'assets/images/staff_reports.png',
                                        title: 'Download report',
                                        subtitle: _reportHistory.isEmpty
                                            ? 'Pick what to include and the dates'
                                            : '${_reportHistory.length} downloaded so far',
                                        onTap: busy ? null : _downloadReport,
                                        trailing: switch (_downloadStatus) {
                                          ReportDownloadStatus.downloading ||
                                          ReportDownloadStatus.paused => const SizedBox(
                                            width: 40,
                                            height: 40,
                                            child: Padding(
                                              padding: EdgeInsets.all(10),
                                              child: CircularProgressIndicator(strokeWidth: 2, color: kStaffAccent),
                                            ),
                                          ),
                                          ReportDownloadStatus.success => const SizedBox(
                                            width: 40,
                                            height: 40,
                                            child: Center(
                                              child: HugeIcon(
                                                icon: HugeIcons.strokeRoundedCheckmarkCircle02,
                                                color: kStaffSuccess,
                                                size: 28,
                                              ),
                                            ),
                                          ),
                                          _ => null,
                                        },
                                      ),
                                      Gap(compact ? 16 : 22),

                                      // ── Metrics ──
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        children: [
                                          Expanded(
                                            child: Text(
                                              _kpiSectionTitle(role),
                                              style: GoogleFonts.outfit(
                                                fontSize: 19,
                                                fontWeight: FontWeight.w700,
                                                color: palette.fg(),
                                              ),
                                            ),
                                          ),
                                          Text(
                                            'Tap for details',
                                            style: GoogleFonts.outfit(fontSize: 13, color: palette.fg(0.55)),
                                          ),
                                        ],
                                      ),
                                      const Gap(10),
                                      StaffTileGrid(
                                        minRowHeight: 0,
                                        children: _buildKpiCards(role, isCustomTheme, primaryColor, secondaryColor),
                                      ),
                                      Gap(compact ? 12 : 16),

                                      // ── Recent downloads: as many rows as fit below ──
                                      Expanded(
                                        child: LayoutBuilder(
                                          builder: (context, c) {
                                            // ~52 for the card header, ~56 per report row.
                                            final fit = ((c.maxHeight - 52) / 56).floor().clamp(0, 5);
                                            if (c.maxHeight < 100) return const SizedBox.shrink();
                                            return _RecentDownloadsCard(
                                              items: _reportHistory,
                                              loading: _historyLoading,
                                              maxItems: math.max(fit, 1),
                                              onViewAll: _showHistory,
                                              onDownload: _downloadReport,
                                            );
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ),
        ],
      ),
    );
  }

  // ── Download / history ────────────────────────────────────────────────────

  void _downloadReport() {
    final role = context.read<AuthProvider>().user?.role?.toUpperCase() ?? '';
    // (server type, label, stats key, image, icon) — only what this role works with.
    const all = _ReportKind('All', 'All parcels', 'total', 'assets/images/staff_reports.png');
    const received = _ReportKind('Received', 'Received', 'received', 'assets/images/staff_receive.png');
    const sent = _ReportKind('Sent', 'Dispatched', 'sent', 'assets/images/staff_parcel.png');
    const delivered = _ReportKind('Delivered', 'Delivered', 'delivered', 'assets/images/staff_deliver.png');
    const atStation = _ReportKind('At Station', 'At station', 'atWarehouse', 'assets/images/staff_parcel.png');
    const cancelled = _ReportKind('Cancelled', 'Cancelled', null, null);
    final kinds = switch (role) {
      'CLERK' => const [all, received, delivered, atStation, cancelled],
      'TRAIN_GUARD' => const [all, sent, atStation],
      _ => const [all, received, sent, delivered, atStation, cancelled],
    };
    const quick = [(ReportPeriod.today, 'Today'), (ReportPeriod.thisWeek, 'Week'), (ReportPeriod.thisMonth, 'Month')];
    const more = [(ReportPeriod.last30, 'Last 30 days'), (ReportPeriod.last90, 'Last 90 days')];
    final fmt = intl.DateFormat('d MMM yyyy');
    final number = intl.NumberFormat.decimalPattern();

    var kind = kinds.first;
    var period = ReportPeriod.thisWeek;
    DateTimeRange? range;

    /// The actual dates a period covers (shown on the preview).
    DateTimeRange datesFor(ReportPeriod p) {
      final now = DateTime.now();
      final today = DateTime(now.year, now.month, now.day);
      return switch (p) {
        ReportPeriod.today => DateTimeRange(start: today, end: today),
        ReportPeriod.thisWeek => DateTimeRange(start: today.subtract(const Duration(days: 6)), end: today),
        ReportPeriod.thisMonth => DateTimeRange(start: today.subtract(const Duration(days: 29)), end: today),
        ReportPeriod.last30 => DateTimeRange(start: today.subtract(const Duration(days: 29)), end: today),
        ReportPeriod.last90 => DateTimeRange(start: today.subtract(const Duration(days: 89)), end: today),
        ReportPeriod.custom => range ?? DateTimeRange(start: today, end: today),
      };
    }

    /// Parcel count for a kind & period when the stats cover it.
    int? countFor(_ReportKind k, ReportPeriod p) {
      if (k.statsKey == null) return null;
      final key = switch (p) {
        ReportPeriod.today => 'daily',
        ReportPeriod.thisWeek => 'weekly',
        ReportPeriod.thisMonth => 'monthly',
        _ => null,
      };
      if (key == null) return null;
      final m = _stats[key];
      return m is Map ? (m[k.statsKey] as num?)?.toInt() ?? 0 : null;
    }

    showStaffSheet<void>(
      context,
      title: 'Download Report',
      builder: (sheetContext) => StatefulBuilder(
        builder: (ctx, setSheet) {
          final palette = StaffPalette.of(ctx);
          final dates = datesFor(period);
          final dateLabel = dates.start == dates.end
              ? fmt.format(dates.start)
              : '${fmt.format(dates.start)} – ${fmt.format(dates.end)}';
          final count = countFor(kind, period);
          final empty = count == 0;

          Future<void> pickCustom() async {
            final picked = await showStaffDateRangeSheet(ctx, initial: range, title: 'Report dates');
            if (picked == null) return;
            setSheet(() {
              range = picked;
              period = ReportPeriod.custom;
            });
          }

          Widget periodPill(ReportPeriod p, String label) {
            final selected = period == p;
            return Expanded(
              child: GestureDetector(
                onTap: () => setSheet(() => period = p),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 160),
                  height: 40,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: selected ? kStaffAccent : Colors.transparent,
                    borderRadius: BorderRadius.circular(999),
                  ),
                  child: Text(
                    label,
                    style: GoogleFonts.outfit(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: selected ? Colors.white : palette.fg(0.75),
                    ),
                  ),
                ),
              ),
            );
          }

          return SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // ── Live preview of the PDF that will be generated ──
                BridgeCard(
                  colors: const [Color(0xFF7A1424), Color(0xFF3A060E)],
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      Container(
                        width: 52,
                        height: 64,
                        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
                        child: const Center(
                          child: HugeIcon(icon: HugeIcons.strokeRoundedPdf02, color: Color(0xFF7A1424), size: 30),
                        ),
                      ),
                      const Gap(14),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${kind.label} report',
                              style: GoogleFonts.outfit(fontSize: 18, fontWeight: FontWeight.w700, color: Colors.white),
                            ),
                            const Gap(2),
                            Text(
                              dateLabel,
                              style: GoogleFonts.outfit(fontSize: 13.5, color: Colors.white.withValues(alpha: 0.8)),
                            ),
                            const Gap(8),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 3),
                              decoration: BoxDecoration(
                                color: empty ? Colors.white.withValues(alpha: 0.18) : kStaffAccent,
                                borderRadius: BorderRadius.circular(999),
                              ),
                              child: Text(
                                count == null
                                    ? 'PDF · all matching parcels'
                                    : empty
                                    ? 'No parcels in this period'
                                    : '${number.format(count)} parcel${count == 1 ? '' : 's'}',
                                style: GoogleFonts.outfit(
                                  fontSize: 12.5,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                // ── 1. What ──
                const Gap(22),
                _SheetStep(number: 1, title: 'What should it cover?'),
                const Gap(10),
                SizedBox(
                  height: 108,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: kinds.length,
                    separatorBuilder: (_, _) => const Gap(10),
                    itemBuilder: (_, i) {
                      final k = kinds[i];
                      final selected = k == kind;
                      final n = countFor(k, period);
                      return GestureDetector(
                        onTap: () => setSheet(() => kind = k),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 160),
                          width: 104,
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: selected ? kStaffAccent.withValues(alpha: 0.14) : palette.surface(0.06),
                            borderRadius: BorderRadius.circular(18),
                            border: Border.all(
                              color: selected ? kStaffAccent : palette.fg(0.12),
                              width: selected ? 1.6 : 1,
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  if (k.image != null)
                                    Image.asset(k.image!, width: 30, height: 30, filterQuality: FilterQuality.high)
                                  else
                                    HugeIcon(icon: HugeIcons.strokeRoundedCancel01, color: palette.fg(0.7), size: 26),
                                  const Spacer(),
                                  if (selected)
                                    const HugeIcon(
                                      icon: HugeIcons.strokeRoundedCheckmarkCircle02,
                                      color: kStaffAccent,
                                      size: 18,
                                    ),
                                ],
                              ),
                              const Spacer(),
                              Text(
                                k.label,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.outfit(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  color: palette.fg(),
                                ),
                              ),
                              Text(
                                n == null ? '—' : (n == 0 ? 'None' : number.format(n)),
                                style: GoogleFonts.outfit(fontSize: 12.5, color: palette.fg(0.55)),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),

                // ── 2. When ──
                const Gap(22),
                _SheetStep(number: 2, title: 'For which dates?'),
                const Gap(10),
                Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(color: palette.surface(0.08), borderRadius: BorderRadius.circular(999)),
                  child: Row(children: [for (final (p, l) in quick) periodPill(p, l)]),
                ),
                const Gap(10),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    for (final (p, l) in more)
                      StaffChoiceChip(label: l, selected: period == p, onTap: () => setSheet(() => period = p)),
                    StaffChoiceChip(
                      label: period == ReportPeriod.custom && range != null ? 'Custom · change' : 'Custom dates…',
                      selected: period == ReportPeriod.custom,
                      onTap: pickCustom,
                    ),
                  ],
                ),

                // ── Download (only when there's something to put in the report) ──
                const Gap(24),
                if (empty)
                  Container(
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: palette.surface(0.08),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: palette.fg(0.12)),
                    ),
                    child: Row(
                      children: [
                        HugeIcon(icon: HugeIcons.strokeRoundedFileNotFound, color: palette.fg(0.55), size: 26),
                        const Gap(12),
                        Expanded(
                          child: Text(
                            'No ${kind == all ? '' : '${kind.label.toLowerCase()} '}parcels for these dates, so there’s nothing to download. '
                            'Try another period or type.',
                            style: GoogleFonts.outfit(fontSize: 14, height: 1.4, color: palette.fg(0.7)),
                          ),
                        ),
                      ],
                    ),
                  )
                else ...[
                  StaffButton(
                    label: 'Download PDF',
                    icon: kStaffDownloadIcon,
                    onPressed: () {
                      Navigator.pop(sheetContext);
                      _triggerDownload(kind.type, period, start: range?.start, end: range?.end);
                    },
                  ),
                  const Gap(6),
                  Text(
                    'You can share or save it once it’s ready.',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.outfit(fontSize: 13, color: palette.fg(0.5)),
                  ),
                ],
              ],
            ),
          );
        },
      ),
    );
  }

  void _showHistory() {
    showStaffSheet<void>(
      context,
      title: 'Recent downloads',
      builder: (sheetContext) {
        final palette = StaffPalette.of(sheetContext);
        if (_historyLoading) {
          return const Padding(
            padding: EdgeInsets.all(32),
            child: Center(child: CircularProgressIndicator(color: kStaffAccent)),
          );
        }
        if (_reportHistory.isEmpty) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(24, 12, 24, 20),
            child: Column(
              children: [
                HugeIcon(icon: HugeIcons.strokeRoundedFileNotFound, color: palette.fg(0.35), size: 44),
                const Gap(12),
                Text(
                  'No reports yet',
                  style: GoogleFonts.outfit(fontSize: 17, fontWeight: FontWeight.w600, color: palette.fg()),
                ),
                const Gap(4),
                Text(
                  'Reports you download will be listed here.',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.outfit(fontSize: 14, color: palette.fg(0.6)),
                ),
              ],
            ),
          );
        }
        return ConstrainedBox(
          constraints: BoxConstraints(maxHeight: MediaQuery.of(sheetContext).size.height * 0.5),
          child: ListView(
            shrinkWrap: true,
            children: [
              for (final item in _reportHistory)
                StaffSheetTile(
                  icon: HugeIcons.strokeRoundedPdf02,
                  label: '${item['name'] ?? 'Report.pdf'}',
                  subtitle: [item['date'], item['size']].where((x) => x != null && '$x'.isNotEmpty).join(' • '),
                  onTap: null,
                ),
            ],
          ),
        );
      },
    );
  }

  void _triggerDownload(String selectedReportType, ReportPeriod period, {DateTime? start, DateTime? end}) async {
    _retryCount = 0;
    _startDownloadProcess(selectedReportType, period, start, end);
  }

  Future<void> _startDownloadProcess(
    String selectedReportType,
    ReportPeriod period,
    DateTime? start,
    DateTime? end,
  ) async {
    setState(() {
      _downloadStatus = _retryCount > 0 ? ReportDownloadStatus.paused : ReportDownloadStatus.downloading;
    });

    try {
      final pdfBytes = await ApiService.generateOperatorReport(
        type: selectedReportType,
        period: period.key,
        start: start,
        end: end,
      );

      if (mounted) {
        setState(() {
          _downloadStatus = ReportDownloadStatus.success;
        });

        final String timestamp = intl.DateFormat('yyyyMMdd_HHmm').format(DateTime.now());
        await Printing.sharePdf(
          bytes: pdfBytes,
          filename: 'mizigo_${selectedReportType.toLowerCase()}_report_$timestamp.pdf',
        );
        _fetchHistory();

        await Future.delayed(const Duration(seconds: 4));
        if (mounted) setState(() => _downloadStatus = ReportDownloadStatus.idle);
      }
    } catch (e) {
      debugPrint('Download error (Attempt ${_retryCount + 1}): $e');

      if (_retryCount < _maxRetries) {
        _retryCount++;
        setState(() => _downloadStatus = ReportDownloadStatus.paused);

        // Wait 2 seconds before retrying
        await Future.delayed(const Duration(seconds: 2));
        if (mounted) {
          _startDownloadProcess(selectedReportType, period, start, end);
        }
      } else {
        if (mounted) {
          setState(() => _downloadStatus = ReportDownloadStatus.failed);
          MizigoToasts.showError(context, 'Failed to generate report after $_maxRetries retries.');
          await Future.delayed(const Duration(seconds: 4));
          if (mounted) setState(() => _downloadStatus = ReportDownloadStatus.idle);
        }
      }
    }
  }

  void _showHelp(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (ctx) => Container(
        height: MediaQuery.of(ctx).size.height * 0.65,
        decoration: BoxDecoration(
          color: StaffPalette.of(context).fg(),
          borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
        ),
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Gap(8),
            Center(
              child: Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: StaffPalette.of(context).fg(0.10),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            const Gap(24),
            Text(
              'Reports Guide',
              style: GoogleFonts.outfit(
                fontSize: 24,
                fontWeight: FontWeight.w800,
                color: StaffPalette.of(context).fg(),
              ),
            ),
            const Gap(32),
            Expanded(
              child: ListView(
                children: [
                  _helpItem(
                    'Stacked Cards',
                    'Swipe up on the cards to cycle between Daily, Weekly, and Monthly parcel volume.',
                    HugeIcons.strokeRoundedLayers01,
                  ),
                  _helpItem(
                    'KPI Cards',
                    'Each metric card has its own period filter — tap D / W / M independently.',
                    HugeIcons.strokeRoundedAnalytics01,
                  ),
                  _helpItem(
                    'Download',
                    'Tap the download icon to export a PDF report with custom type and date range.',
                    kStaffDownloadIcon,
                  ),
                ],
              ),
            ),
            const Gap(16),
            SizedBox(
              width: double.infinity,
              height: 56,
              child: FilledButton(
                onPressed: () => Navigator.pop(ctx),
                style: FilledButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                ),
                child: Text(
                  'Got it',
                  style: GoogleFonts.inter(fontWeight: FontWeight.w800, color: StaffPalette.of(context).fg()),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _helpItem(String title, String desc, dynamic icon) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: StaffPalette.of(context).surface(0.03),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: StaffPalette.of(context).surface(0.05)),
            ),
            child: HugeIcon(icon: icon, color: Theme.of(context).colorScheme.primary, size: 20),
          ),
          const Gap(14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.outfit(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: StaffPalette.of(context).fg(),
                  ),
                ),
                const Gap(3),
                Text(
                  desc,
                  style: GoogleFonts.inter(fontSize: 13, color: StaffPalette.of(context).fg(0.38), height: 1.5),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ─── Stacked Volume Carousel ──────────────────────────────────────────────────

/// Swipeable period cards (today / this week / this month) with the
/// train-bridge artwork, brand colors and a role-relevant breakdown.
class _VolumePageCarousel extends StatefulWidget {
  final Map<String, dynamic> stats;
  final String role;

  const _VolumePageCarousel({
    required this.stats,
    required this.role,
    required this.index,
    required this.onChanged,
    this.compact = false,
  });

  final int index;
  final ValueChanged<int> onChanged;

  final bool compact;

  @override
  State<_VolumePageCarousel> createState() => _VolumePageCarouselState();
}

/// One summary card: switch Today / Week / Month inside it.
class _VolumePageCarouselState extends State<_VolumePageCarousel> {
  static const _periods = [
    ('Today', 'daily', 'today'),
    ('Week', 'weekly', 'this week'),
    ('Month', 'monthly', 'this month'),
  ];

  int _num(Map? m, String k) => (m?[k] as num?)?.toInt() ?? 0;

  /// Breakdown entries that matter for the signed-in role.
  List<(String, int, List<List<dynamic>>)> _breakdown(Map? m) => switch (widget.role) {
    'CLERK' => [
      ('Received', _num(m, 'received'), HugeIcons.strokeRoundedPackageReceive),
      ('Delivered', _num(m, 'delivered'), HugeIcons.strokeRoundedPackageDelivered),
      ('At station', _num(m, 'atWarehouse'), HugeIcons.strokeRoundedBuilding04),
    ],
    'TRAIN_GUARD' => [
      ('Dispatched', _num(m, 'sent'), HugeIcons.strokeRoundedSpeedTrain01),
      ('At station', _num(m, 'atWarehouse'), HugeIcons.strokeRoundedBuilding04),
    ],
    _ => [
      ('Received', _num(m, 'received'), HugeIcons.strokeRoundedPackageReceive),
      ('Dispatched', _num(m, 'sent'), HugeIcons.strokeRoundedSpeedTrain01),
      ('Delivered', _num(m, 'delivered'), HugeIcons.strokeRoundedPackageDelivered),
    ],
  };

  @override
  Widget build(BuildContext context) {
    final (_, key, phrase) = _periods[widget.index];
    final m = widget.stats[key] as Map?;
    final total = _num(m, 'total');
    final parts = _breakdown(m);
    final fmt = intl.NumberFormat.decimalPattern();
    final white70 = Colors.white.withValues(alpha: 0.75);

    return BridgeCard(
      colors: const [Color(0xFF7A1424), Color(0xFF3A060E)],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Period switch.
          Container(
            padding: const EdgeInsets.all(3),
            decoration: BoxDecoration(
              color: Colors.black.withValues(alpha: 0.22),
              borderRadius: BorderRadius.circular(999),
            ),
            child: Row(
              children: [
                for (var i = 0; i < _periods.length; i++)
                  Expanded(
                    child: GestureDetector(
                      onTap: () => widget.onChanged(i),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 180),
                        padding: const EdgeInsets.symmetric(vertical: 7),
                        decoration: BoxDecoration(
                          color: i == widget.index ? kStaffAccent : Colors.transparent,
                          borderRadius: BorderRadius.circular(999),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          _periods[i].$1,
                          style: GoogleFonts.outfit(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: i == widget.index ? Colors.white : white70,
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
          Gap(widget.compact ? 12 : 20),
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 200),
            child: total == 0
                ? Column(
                    key: ValueKey('empty${widget.index}'),
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'No parcels $phrase',
                        style: GoogleFonts.outfit(fontSize: 24, fontWeight: FontWeight.w700, color: Colors.white),
                      ),
                      const Gap(4),
                      Text(
                        'Parcels you handle $phrase will be counted here.',
                        style: GoogleFonts.outfit(fontSize: 14, color: white70),
                      ),
                    ],
                  )
                : Column(
                    key: ValueKey('data${widget.index}'),
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Parcels handled $phrase', style: GoogleFonts.outfit(fontSize: 14, color: white70)),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            fmt.format(total),
                            style: GoogleFonts.outfit(
                              fontSize: widget.compact ? 34 : 44,
                              fontWeight: FontWeight.w800,
                              height: 1.1,
                              color: Colors.white,
                            ),
                          ),
                          const Spacer(),
                          // Today's/this period's delivery rate (not for guards).
                          if (widget.role != 'TRAIN_GUARD' && _num(m, 'received') > 0)
                            Container(
                              margin: const EdgeInsets.only(bottom: 6),
                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                              decoration: BoxDecoration(
                                color: Colors.white.withValues(alpha: 0.16),
                                borderRadius: BorderRadius.circular(999),
                              ),
                              child: Text(
                                '${(_num(m, 'delivered') / _num(m, 'received') * 100).clamp(0, 100).round()}% delivered',
                                style: GoogleFonts.outfit(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                        ],
                      ),
                    ],
                  ),
          ),
          Gap(widget.compact ? 12 : 18),
          // Role-relevant breakdown.
          Container(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 6),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(18),
            ),
            child: Row(
              children: [
                for (var i = 0; i < parts.length; i++) ...[
                  if (i > 0) Container(width: 1, height: 34, color: Colors.white.withValues(alpha: 0.2)),
                  Expanded(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            HugeIcon(icon: parts[i].$3, color: kStaffAccent, size: 16),
                            const Gap(5),
                            Text(
                              parts[i].$2 == 0 ? '–' : fmt.format(parts[i].$2),
                              style: GoogleFonts.outfit(fontSize: 18, fontWeight: FontWeight.w700, color: Colors.white),
                            ),
                          ],
                        ),
                        Text(parts[i].$1, style: GoogleFonts.outfit(fontSize: 12.5, color: white70)),
                      ],
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}

typedef PeriodValueFn = int Function(String key, ReportPeriod period);

class _KpiCard extends StatefulWidget {
  final String title;
  final dynamic icon;
  final String image;
  final Color color;
  final String dataKey;
  final Map<String, dynamic> stats;
  final PeriodValueFn valueForPeriod;
  final ReportPeriod period;

  const _KpiCard({
    required this.period,
    required this.title,
    required this.icon,
    required this.image,
    required this.color,
    required this.dataKey,
    required this.stats,
    required this.valueForPeriod,
  });

  @override
  State<_KpiCard> createState() => _KpiCardState();
}

class _KpiCardState extends State<_KpiCard> {
  ReportPeriod get _period => widget.period;

  void _showDetailSheet() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => KpiDetailsScreen(
          title: widget.title,
          dataKey: widget.dataKey,
          timeframe: _period.label,
          color: widget.color,
          icon: HugeIcon(icon: widget.icon, color: widget.color, size: 28),
          initialPeriod: _period,
        ),
      ),
    ).then((_) {
      if (mounted) setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final palette = StaffPalette.of(context);
    final int value = widget.valueForPeriod(widget.dataKey, _period);
    return StaffActionTile(
      image: widget.image,
      title: widget.title,
      onTap: _showDetailSheet,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (value == 0)
            Text(
              'None yet',
              style: GoogleFonts.outfit(fontSize: 18, height: 1.4, fontWeight: FontWeight.w600, color: palette.fg(0.5)),
            )
          else
            Text(
              intl.NumberFormat.decimalPattern().format(value),
              style: GoogleFonts.outfit(fontSize: 26, height: 1.15, fontWeight: FontWeight.w800, color: palette.fg()),
            ),
          Text(_period.label, style: GoogleFonts.outfit(fontSize: 12.5, color: palette.fg(0.5))),
        ],
      ),
    );
  }
}

class _HeaderBtn extends StatelessWidget {
  final List<List<dynamic>> icon;
  final VoidCallback onTap;
  final String tooltip;

  const _HeaderBtn({required this.icon, required this.onTap, required this.tooltip});

  @override
  Widget build(BuildContext context) {
    final palette = StaffPalette.of(context);
    return Tooltip(
      message: tooltip,
      child: Material(
        color: palette.surface(0.15),
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(12),
          child: SizedBox(
            width: 44,
            height: 44,
            child: Center(
              child: HugeIcon(icon: icon, color: palette.fg(), size: 22),
            ),
          ),
        ),
      ),
    );
  }
}

class _ReportsSkeleton extends StatelessWidget {
  const _ReportsSkeleton();

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(18, 20, 18, 24),
      physics: const NeverScrollableScrollPhysics(),
      children: [
        // Header Skeleton
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const BoxSkeleton(width: 140, height: 40, borderRadius: 8),
            Row(children: [const CircleSkeleton(size: 42), const Gap(8), const CircleSkeleton(size: 42)]),
          ],
        ),
        const Gap(6),
        const BoxSkeleton(width: 220, height: 16),
        const Gap(28),

        // Swiper Skeleton
        const BoxSkeleton(height: 230, borderRadius: 24),
        const Gap(28),

        // KPI Grid Skeletons
        const BoxSkeleton(width: 150, height: 20),
        const Gap(16),
        Row(
          children: [
            Expanded(child: const BoxSkeleton(height: 110, borderRadius: 20)),
            const Gap(16),
            Expanded(child: const BoxSkeleton(height: 110, borderRadius: 20)),
          ],
        ),
        const Gap(16),
        Row(
          children: [
            Expanded(child: const BoxSkeleton(height: 110, borderRadius: 20)),
            const Gap(16),
            Expanded(child: const BoxSkeleton(height: 110, borderRadius: 20)),
          ],
        ),
        const Gap(28),

        // Banner Skeleton
        const BoxSkeleton(height: 100, borderRadius: 24),
      ],
    );
  }
}

/// A kind of report the user can download.
class _ReportKind {
  const _ReportKind(this.type, this.label, this.statsKey, this.image);

  /// Value the server expects.
  final String type;
  final String label;

  /// Key in the stats maps, for the live count (null = not tracked).
  final String? statsKey;
  final String? image;
}

/// Numbered step title used in the download sheet.
class _SheetStep extends StatelessWidget {
  const _SheetStep({required this.number, required this.title});

  final int number;
  final String title;

  @override
  Widget build(BuildContext context) {
    final palette = StaffPalette.of(context);
    return Row(
      children: [
        Container(
          width: 24,
          height: 24,
          decoration: const BoxDecoration(color: kStaffAccent, shape: BoxShape.circle),
          alignment: Alignment.center,
          child: Text(
            '$number',
            style: GoogleFonts.outfit(fontSize: 13, fontWeight: FontWeight.w700, color: Colors.white),
          ),
        ),
        const Gap(10),
        Text(
          title,
          style: GoogleFonts.outfit(fontSize: 17, fontWeight: FontWeight.w700, color: palette.fg()),
        ),
      ],
    );
  }
}

/// Latest generated reports (up to four), or a friendly empty state.
/// Stretches to fill the space left at the bottom of the Reports screen.
class _RecentDownloadsCard extends StatelessWidget {
  const _RecentDownloadsCard({
    required this.items,
    required this.loading,
    required this.onViewAll,
    required this.onDownload,
    this.maxItems = 4,
  });

  final int maxItems;
  final List<dynamic> items;
  final bool loading;
  final VoidCallback onViewAll;
  final VoidCallback onDownload;

  @override
  Widget build(BuildContext context) {
    final palette = StaffPalette.of(context);
    final shown = items.take(maxItems).toList();
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 14, 16, 10),
      decoration: BoxDecoration(
        color: palette.surface(0.10),
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: palette.surface(0.12)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Text(
                'Recent downloads',
                style: GoogleFonts.outfit(fontSize: 17, fontWeight: FontWeight.w700, color: palette.fg()),
              ),
              if (items.isNotEmpty) ...[
                const Gap(8),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  decoration: BoxDecoration(color: kStaffAccent, borderRadius: BorderRadius.circular(999)),
                  child: Text(
                    '${items.length}',
                    style: GoogleFonts.outfit(fontSize: 12.5, fontWeight: FontWeight.w700, color: Colors.white),
                  ),
                ),
              ],
              const Spacer(),
              if (items.isNotEmpty)
                GestureDetector(
                  onTap: onViewAll,
                  child: Text(
                    'View all',
                    style: GoogleFonts.outfit(fontSize: 14.5, fontWeight: FontWeight.w600, color: kStaffAccent),
                  ),
                ),
            ],
          ),
          const Gap(6),
          if (loading)
            const Padding(
              padding: EdgeInsets.all(16),
              child: Center(child: CircularProgressIndicator(strokeWidth: 2, color: kStaffAccent)),
            )
          else if (shown.isEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                children: [
                  Container(
                    width: 42,
                    height: 42,
                    decoration: BoxDecoration(color: kStaffAccent.withValues(alpha: 0.14), shape: BoxShape.circle),
                    child: const Center(
                      child: HugeIcon(icon: HugeIcons.strokeRoundedPdf02, color: kStaffAccent, size: 21),
                    ),
                  ),
                  const Gap(12),
                  Expanded(
                    child: Text(
                      'Reports you download will be listed here.',
                      style: GoogleFonts.outfit(fontSize: 14, height: 1.35, color: palette.fg(0.65)),
                    ),
                  ),
                  TextButton(
                    onPressed: onDownload,
                    child: Text(
                      'Create one',
                      style: GoogleFonts.outfit(fontSize: 14.5, fontWeight: FontWeight.w600, color: kStaffAccent),
                    ),
                  ),
                ],
              ),
            )
          else
            for (var i = 0; i < shown.length; i++) ...[
              if (i > 0) const StaffDivider(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  children: [
                    Container(
                      width: 38,
                      height: 38,
                      decoration: BoxDecoration(
                        color: kStaffAccent.withValues(alpha: 0.14),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Center(
                        child: HugeIcon(icon: HugeIcons.strokeRoundedPdf02, color: kStaffAccent, size: 19),
                      ),
                    ),
                    const Gap(12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${shown[i]['name'] ?? 'Report.pdf'}',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.outfit(fontSize: 14.5, fontWeight: FontWeight.w600, color: palette.fg()),
                          ),
                          Text(
                            [shown[i]['date'], shown[i]['size']].where((x) => x != null && '$x'.isNotEmpty).join(' · '),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.outfit(fontSize: 12.5, color: palette.fg(0.55)),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
        ],
      ),
    );
  }
}
