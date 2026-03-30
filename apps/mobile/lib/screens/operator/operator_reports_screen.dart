import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hugeicons/hugeicons.dart';
import '../../services/api_service.dart';

// ─── Period enum ──────────────────────────────────────────────────────────────

enum ReportPeriod {
  today('Today', 'daily'),
  thisWeek('This Week', 'weekly'),
  thisMonth('This Month', 'monthly'),
  last30('Last 30 Days', 'last30'),
  last90('Last 90 Days', 'last90'),
  custom('Custom Range', 'custom');

  const ReportPeriod(this.label, this.key);
  final String label;
  final String key;
}

// ─── Screen ───────────────────────────────────────────────────────────────────

class OperatorReportsScreen extends StatefulWidget {
  const OperatorReportsScreen({super.key});

  @override
  State<OperatorReportsScreen> createState() => _OperatorReportsScreenState();
}

class _OperatorReportsScreenState extends State<OperatorReportsScreen>
    with SingleTickerProviderStateMixin {
  Map<String, dynamic> _stats = {};
  bool _loading = true;

  final List<String> _timeframeOrder = ['Monthly', 'Weekly', 'Daily'];

  @override
  void initState() {
    super.initState();
    _fetchStats();
  }

  Future<void> _fetchStats({bool silent = false}) async {
    if (!silent && _stats.isEmpty) setState(() => _loading = true);
    try {
      final res = await ApiService.getOperatorStats();
      if (mounted) setState(() => _stats = res);
    } catch (e) {
      debugPrint('Error fetching operator stats: $e');
      if (mounted && _stats.isEmpty) {
        setState(() => _stats = {
              'received': 42,
              'delivered': 34,
              'sent': 67,
              'atWarehouse': 22,
              'daily': {'received': 5, 'delivered': 3, 'sent': 8, 'atWarehouse': 2},
              'weekly': {'received': 28, 'delivered': 12, 'sent': 28, 'atWarehouse': 8},
              'monthly': {'received': 42, 'delivered': 34, 'sent': 67, 'atWarehouse': 22},
            });
      }
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  // Derive period-scoped values from stats map
  int _valueForPeriod(String key, ReportPeriod period) {
    final periodKey = switch (period) {
      ReportPeriod.today    => 'daily',
      ReportPeriod.thisWeek => 'weekly',
      ReportPeriod.thisMonth=> 'monthly',
      ReportPeriod.last30   => 'last30',
      ReportPeriod.last90   => 'last90',
      ReportPeriod.custom   => 'monthly',
    };
    final periodMap = _stats[periodKey];
    if (periodMap is Map) return (periodMap[key] as num?)?.toInt() ?? 0;
    return (_stats[key] as num?)?.toInt() ?? 0;
  }

  // Sum all KPI values for a period to get the volume card total
  int _totalForTimeframe(String timeframe) {
    final key = timeframe.toLowerCase(); // 'daily' | 'weekly' | 'monthly'
    final sub = _stats[key];
    if (sub is Map) {
      return [(sub['received'] as num?)?.toInt() ?? 0,
              (sub['sent']     as num?)?.toInt() ?? 0,
              (sub['delivered'] as num?)?.toInt() ?? 0,
              (sub['atWarehouse'] as num?)?.toInt() ?? 0]
          .fold(0, (a, b) => a + b);
    }
    return (_stats[key] as num?)?.toInt() ?? 0;
  }

  Color _getGradientStart(String t) =>
      t == 'Weekly' ? const Color(0xFF8B5CF6) : t == 'Monthly' ? const Color(0xFF10B981) : const Color(0xFF3B82F6);

  Color _getGradientEnd(String t) =>
      t == 'Weekly' ? const Color(0xFF6D28D9) : t == 'Monthly' ? const Color(0xFF047857) : const Color(0xFF1D4ED8);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),
      body: SafeArea(
        child: _loading
            ? const Center(
                child: CircularProgressIndicator(color: Color(0xFF3B82F6)))
            : RefreshIndicator(
                onRefresh: () => _fetchStats(silent: true),
                color: const Color(0xFF3B82F6),
                child: ListView(
                  padding: const EdgeInsets.fromLTRB(24, 24, 24, 40),
                  children: [
                    // ── Header ───────────────────────────────────────────
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Reports',
                            style: GoogleFonts.outfit(
                                fontSize: 32,
                                fontWeight: FontWeight.w800,
                                color: Colors.white)),
                        Row(children: [
                          _HeaderBtn(
                              icon: HugeIcons.strokeRoundedDownload01,
                              onTap: _downloadReport,
                              tooltip: 'Download'),
                          const Gap(8),
                          _HeaderBtn(
                              icon: HugeIcons.strokeRoundedHelpCircle,
                              onTap: () => _showHelp(context),
                              tooltip: 'Help'),
                        ]),
                      ],
                    ),
                    const Gap(6),
                    Text('Analyze your operational metrics',
                        style: GoogleFonts.inter(
                            fontSize: 14,
                            color: const Color(0xFF94A3B8),
                            fontWeight: FontWeight.w500)),
                    const Gap(28),

                    // ── Stacked volume cards ──────────────────────────────
                    _buildStackedCards(),
                    const Gap(32),

                    // ── KPI cards with individual period filters ──────────
                    Text('Operational KPIs',
                        style: GoogleFonts.outfit(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: Colors.white)),
                    const Gap(4),
                    Text('Select a period per metric',
                        style: GoogleFonts.inter(
                            fontSize: 13,
                            color: const Color(0xFF64748B))),
                    const Gap(16),

                    // 2-column grid using Row pairs so each card manages its own state
                    _KpiRow(children: [
                      _KpiCard(
                        title: 'Received',
                        icon: HugeIcons.strokeRoundedPackageReceive,
                        color: const Color(0xFF3B82F6),
                        dataKey: 'received',
                        stats: _stats,
                        valueForPeriod: _valueForPeriod,
                      ),
                      _KpiCard(
                        title: 'Delivered',
                        icon: HugeIcons.strokeRoundedCheckmarkBadge01,
                        color: const Color(0xFF10B981),
                        dataKey: 'delivered',
                        stats: _stats,
                        valueForPeriod: _valueForPeriod,
                      ),
                    ]),
                    const Gap(16),
                    _KpiRow(children: [
                      _KpiCard(
                        title: 'Sent',
                        icon: HugeIcons.strokeRoundedSpeedTrain02,
                        color: const Color(0xFFF59E0B),
                        dataKey: 'sent',
                        stats: _stats,
                        valueForPeriod: _valueForPeriod,
                      ),
                      _KpiCard(
                        title: 'At Station',
                        icon: HugeIcons.strokeRoundedDeliveryBox01,
                        color: const Color(0xFF6366F1),
                        dataKey: 'atWarehouse',
                        stats: _stats,
                        valueForPeriod: _valueForPeriod,
                      ),
                    ]),
                    const Gap(28),

                    // ── Performance banner ────────────────────────────────
                    _PerformanceBanner(),
                  ],
                ),
              ),
      ),
    );
  }

  // ── Stacked volume cards ──────────────────────────────────────────────────

  Widget _buildStackedCards() {
    return SizedBox(
      height: 220,
      child: Stack(
        clipBehavior: Clip.none,
        children: _timeframeOrder.asMap().entries.map((entry) {
          final int index = entry.key;
          final String timeframe = entry.value;
          final int rev = _timeframeOrder.length - 1 - index;
          final double topOff = rev * 12.0;
          final double scale = 1.0 - rev * 0.05;
          final double opacity = (1.0 - rev * 0.2).clamp(0.0, 1.0);

          return AnimatedPositioned(
            duration: const Duration(milliseconds: 400),
            curve: Curves.easeOutBack,
            top: topOff,
            left: rev * 10.0,
            right: rev * 10.0,
            child: AnimatedScale(
              duration: const Duration(milliseconds: 400),
              scale: scale,
              child: Opacity(
                opacity: opacity,
                child: GestureDetector(
                  onVerticalDragEnd: (d) {
                    if ((d.primaryVelocity ?? 0) < 0) {
                      setState(() {
                        final top = _timeframeOrder.removeLast();
                        _timeframeOrder.insert(0, top);
                      });
                    }
                  },
                  onTap: () {
                    if (rev > 0) {
                      setState(() {
                        _timeframeOrder.remove(timeframe);
                        _timeframeOrder.add(timeframe);
                      });
                    }
                  },
                  child: Container(
                    height: 190,
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          _getGradientStart(timeframe),
                          _getGradientEnd(timeframe)
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(28),
                      boxShadow: [
                        BoxShadow(
                          color: _getGradientStart(timeframe)
                              .withValues(alpha: 0.4),
                          blurRadius: 25,
                          offset: const Offset(0, 12),
                        )
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(timeframe.toUpperCase(),
                                    style: GoogleFonts.inter(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w800,
                                        letterSpacing: 1.2,
                                        color: Colors.white
                                            .withValues(alpha: 0.6))),
                                const Gap(4),
                                Text('Parcel Volume',
                                    style: GoogleFonts.outfit(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white)),
                              ],
                            ),
                            Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Colors.white.withValues(alpha: 0.15),
                                shape: BoxShape.circle,
                              ),
                              child: const HugeIcon(
                                  icon: HugeIcons.strokeRoundedChartBarLine,
                                  color: Colors.white,
                                  size: 22),
                            ),
                          ],
                        ),
                        const Spacer(),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              '${_totalForTimeframe(timeframe)}' ,
                              style: GoogleFonts.outfit(
                                  fontSize: 44,
                                  fontWeight: FontWeight.w800,
                                  color: Colors.white,
                                  height: 1),
                            ),
                            const Gap(8),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 6),
                              child: Text('Parcels',
                                  style: GoogleFonts.inter(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white
                                          .withValues(alpha: 0.8))),
                            ),
                          ],
                        ),
                        const Gap(10),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 5),
                          decoration: BoxDecoration(
                            color: Colors.white.withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            timeframe == 'Daily'
                                ? 'Today\'s Throughput'
                                : timeframe == 'Weekly'
                                    ? 'Week-to-date'
                                    : 'MTD Performance',
                            style: GoogleFonts.inter(
                                fontSize: 11,
                                fontWeight: FontWeight.w600,
                                color:
                                    Colors.white.withValues(alpha: 0.9)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  // ── Actions ───────────────────────────────────────────────────────────────

  void _downloadReport() {
    String selectedFormat = 'PDF';
    ReportPeriod selectedPeriod = ReportPeriod.thisMonth;
    DateTimeRange? customRange;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (ctx) => StatefulBuilder(
        builder: (context, setModalState) {
          return Container(
            decoration: const BoxDecoration(
              color: Color(0xFF0F172A),
              borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
            ),
            padding: EdgeInsets.fromLTRB(24, 24, 24, MediaQuery.of(context).viewInsets.bottom + 24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    width: 48,
                    height: 4,
                    decoration: BoxDecoration(
                      color: const Color(0xFF334155),
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ),
                const Gap(24),
                Text('Export Report',
                    style: GoogleFonts.outfit(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: Colors.white)),
                const Gap(8),
                Text('Select parameters to generate your activity report.',
                    style: GoogleFonts.inter(
                        fontSize: 14, color: const Color(0xFF94A3B8))),
                const Gap(28),

                // Report Type
                Text('Format',
                    style: GoogleFonts.outfit(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white)),
                const Gap(12),
                Row(
                  children: ['PDF', 'CSV', 'Excel'].map((format) {
                    final isSelected = selectedFormat == format;
                    return Padding(
                      padding: const EdgeInsets.only(right: 12),
                      child: GestureDetector(
                        onTap: () => setModalState(() => selectedFormat = format),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                          decoration: BoxDecoration(
                            color: isSelected ? const Color(0xFF3B82F6).withOpacity(0.15) : const Color(0xFF1E293B),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: isSelected ? const Color(0xFF3B82F6) : Colors.transparent,
                              width: 1.5,
                            ),
                          ),
                          child: Text(
                            format,
                            style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: isSelected ? const Color(0xFF3B82F6) : const Color(0xFF94A3B8),
                            ),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
                const Gap(24),

                // Date Range
                Text('Date Range',
                    style: GoogleFonts.outfit(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white)),
                const Gap(12),
                Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  children: ReportPeriod.values.map((period) {
                    final isSelected = selectedPeriod == period;
                    return GestureDetector(
                      onTap: () async {
                        if (period == ReportPeriod.custom) {
                          final range = await showDateRangePicker(
                            context: context,
                            firstDate: DateTime(2020),
                            lastDate: DateTime.now(),
                            builder: (context, child) => Theme(
                              data: ThemeData.dark().copyWith(
                                colorScheme: const ColorScheme.dark(
                                  primary: Color(0xFF3B82F6),
                                  surface: Color(0xFF1E293B),
                                ),
                              ),
                              child: child!,
                            ),
                          );
                          if (range != null) {
                            setModalState(() {
                              selectedPeriod = period;
                              customRange = range;
                            });
                          }
                        } else {
                          setModalState(() {
                            selectedPeriod = period;
                            customRange = null; // Clear if not custom
                          });
                        }
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                        decoration: BoxDecoration(
                          color: isSelected ? const Color(0xFF3B82F6).withOpacity(0.15) : const Color(0xFF1E293B),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: isSelected ? const Color(0xFF3B82F6) : Colors.transparent,
                            width: 1.5,
                          ),
                        ),
                        child: Text(
                          period == ReportPeriod.custom && isSelected && customRange != null
                              ? '${customRange!.start.day}/${customRange!.start.month} - ${customRange!.end.day}/${customRange!.end.month}'
                              : period.label,
                          style: GoogleFonts.inter(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: isSelected ? const Color(0xFF3B82F6) : const Color(0xFF94A3B8),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),

                const Gap(40),
                SizedBox(
                  width: double.infinity,
                  height: 52,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(ctx);
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Row(children: [
                          const Icon(Icons.download_rounded, color: Colors.white, size: 18),
                          const Gap(10),
                          Text('Generating $selectedFormat report…',
                              style: GoogleFonts.inter(fontWeight: FontWeight.w600)),
                        ]),
                        backgroundColor: const Color(0xFF1E293B),
                        behavior: SnackBarBehavior.floating,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        duration: const Duration(seconds: 2),
                      ));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF3B82F6),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                      elevation: 0,
                    ),
                    child: Text(
                      'Download Report',
                      style: GoogleFonts.inter(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                const Gap(12),
              ],
            ),
          );
        },
      ),
    );
  }

  void _showHelp(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (ctx) => Container(
        height: MediaQuery.of(ctx).size.height * 0.65,
        decoration: const BoxDecoration(
          color: Color(0xFF0F172A),
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
                        color: Colors.white10,
                        borderRadius: BorderRadius.circular(2)))),
            const Gap(24),
            Text('Reports Guide',
                style: GoogleFonts.outfit(
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                    color: Colors.white)),
            const Gap(32),
            Expanded(
              child: ListView(children: [
                _helpItem('Stacked Cards',
                    'Swipe up or tap to cycle between Daily, Weekly, and Monthly total parcel volume.',
                    HugeIcons.strokeRoundedLayers01),
                _helpItem('KPI Cards',
                    'Each metric card has its own period filter. Tap Today / Week / Month on any card independently.',
                    HugeIcons.strokeRoundedAnalytics01),
                _helpItem('Tap a KPI Card',
                    'Tap the card body (not a period pill) to see a full breakdown for that metric.',
                    HugeIcons.strokeRoundedChartBarLine),
                _helpItem('Download',
                    'Tap the download icon to export the current report as a PDF.',
                    HugeIcons.strokeRoundedDownload01),
              ]),
            ),
            const Gap(16),
            SizedBox(
              width: double.infinity,
              height: 56,
              child: FilledButton(
                onPressed: () => Navigator.pop(ctx),
                style: FilledButton.styleFrom(
                    backgroundColor: const Color(0xFF3B82F6),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16))),
                child: Text('Got it',
                    style: GoogleFonts.inter(
                        fontWeight: FontWeight.w800, color: Colors.white)),
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
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.03),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.white.withValues(alpha: 0.05))),
          child:
              HugeIcon(icon: icon, color: const Color(0xFF3B82F6), size: 20),
        ),
        const Gap(14),
        Expanded(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(title,
                style: GoogleFonts.outfit(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: Colors.white)),
            const Gap(3),
            Text(desc,
                style: GoogleFonts.inter(
                    fontSize: 13, color: Colors.white38, height: 1.5)),
          ]),
        ),
      ]),
    );
  }
}

// ─── KPI row helper ───────────────────────────────────────────────────────────

class _KpiRow extends StatelessWidget {
  final List<Widget> children;
  const _KpiRow({required this.children});

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(child: children[0]),
          const Gap(16),
          Expanded(child: children[1]),
        ],
      ),
    );
  }
}

// ─── KPI Card with own period state ──────────────────────────────────────────

typedef PeriodValueFn = int Function(String key, ReportPeriod period);

class _KpiCard extends StatefulWidget {
  final String title;
  final dynamic icon;
  final Color color;
  final String dataKey;
  final Map<String, dynamic> stats;
  final PeriodValueFn valueForPeriod;

  const _KpiCard({
    required this.title,
    required this.icon,
    required this.color,
    required this.dataKey,
    required this.stats,
    required this.valueForPeriod,
  });

  @override
  State<_KpiCard> createState() => _KpiCardState();
}

class _KpiCardState extends State<_KpiCard> {
  // Each card has its own period — defaults to This Month
  ReportPeriod _period = ReportPeriod.thisMonth;

  static const _pills = [
    (ReportPeriod.today, 'D'),
    (ReportPeriod.thisWeek, 'W'),
    (ReportPeriod.thisMonth, 'M'),
  ];

  void _showDetailSheet() {
    // Show a breakdown bottom sheet for this specific KPI
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (_) => _KpiDetailSheet(
        title: widget.title,
        icon: widget.icon,
        color: widget.color,
        dataKey: widget.dataKey,
        valueForPeriod: widget.valueForPeriod,
        initialPeriod: _period,
        onPeriodChanged: (p) => setState(() => _period = p),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final int value = widget.valueForPeriod(widget.dataKey, _period);

    return GestureDetector(
      onTap: _showDetailSheet,
      child: Container(
        padding: const EdgeInsets.fromLTRB(18, 18, 18, 12),
        decoration: BoxDecoration(
          color: const Color(0xFF1E293B),
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: Colors.white.withValues(alpha: 0.05)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Icon + title row
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: widget.color.withValues(alpha: 0.12),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: HugeIcon(
                      icon: widget.icon, color: widget.color, size: 20),
                ),
                const Spacer(),
                Icon(Icons.arrow_forward_ios_rounded,
                    size: 12, color: Colors.white24),
              ],
            ),
            const Gap(14),
            // Value
            Text(
              value.toString(),
              style: GoogleFonts.outfit(
                  fontSize: 30,
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                  height: 1),
            ),
            const Gap(2),
            Text(widget.title,
                style: GoogleFonts.inter(
                    fontSize: 12,
                    color: const Color(0xFF94A3B8),
                    fontWeight: FontWeight.w500)),
            const Gap(14),
            // Period pills
            Row(
              children: _pills.map((pill) {
                final isSelected = _period == pill.$1;
                return GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                    setState(() => _period = pill.$1);
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 180),
                    margin: const EdgeInsets.only(right: 6),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? widget.color.withValues(alpha: 0.15)
                          : Colors.white.withValues(alpha: 0.04),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: isSelected
                            ? widget.color.withValues(alpha: 0.6)
                            : Colors.transparent,
                        width: 1,
                      ),
                    ),
                    child: Text(
                      pill.$2,
                      style: GoogleFonts.inter(
                        fontSize: 11,
                        fontWeight: isSelected
                            ? FontWeight.w800
                            : FontWeight.w500,
                        color: isSelected
                            ? widget.color
                            : const Color(0xFF64748B),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}

// ─── KPI Detail Bottom Sheet ──────────────────────────────────────────────────

class _KpiDetailSheet extends StatefulWidget {
  final String title;
  final dynamic icon;
  final Color color;
  final String dataKey;
  final PeriodValueFn valueForPeriod;
  final ReportPeriod initialPeriod;
  final ValueChanged<ReportPeriod> onPeriodChanged;

  const _KpiDetailSheet({
    required this.title,
    required this.icon,
    required this.color,
    required this.dataKey,
    required this.valueForPeriod,
    required this.initialPeriod,
    required this.onPeriodChanged,
  });

  @override
  State<_KpiDetailSheet> createState() => _KpiDetailSheetState();
}

class _KpiDetailSheetState extends State<_KpiDetailSheet> {
  late ReportPeriod _period;

  static const _allPills = [
    (ReportPeriod.today, 'Today'),
    (ReportPeriod.thisWeek, 'Week'),
    (ReportPeriod.thisMonth, 'Month'),
    (ReportPeriod.last30, '30 Days'),
    (ReportPeriod.last90, '90 Days'),
  ];

  @override
  void initState() {
    super.initState();
    _period = widget.initialPeriod;
  }

  // Fake trend data per period for the detail sheet
  String _trendLabel() {
    switch (_period) {
      case ReportPeriod.today: return 'vs yesterday';
      case ReportPeriod.thisWeek: return 'vs last week';
      case ReportPeriod.thisMonth: return 'vs last month';
      case ReportPeriod.last30: return 'vs prior 30 days';
      case ReportPeriod.last90: return 'vs prior 90 days';
      default: return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    final int value = widget.valueForPeriod(widget.dataKey, _period);

    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFF1E293B),
        borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
      ),
      padding: EdgeInsets.fromLTRB(
          24, 16, 24, MediaQuery.of(context).padding.bottom + 32),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Handle
          Center(
            child: Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                    color: Colors.white24,
                    borderRadius: BorderRadius.circular(2))),
          ),
          const Gap(24),

          // Header
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: widget.color.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: HugeIcon(
                    icon: widget.icon, color: widget.color, size: 24),
              ),
              const Gap(16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.title,
                      style: GoogleFonts.outfit(
                          fontSize: 22,
                          fontWeight: FontWeight.w800,
                          color: Colors.white)),
                  Text('Detailed breakdown',
                      style: GoogleFonts.inter(
                          fontSize: 13, color: const Color(0xFF64748B))),
                ],
              ),
            ],
          ),
          const Gap(24),

          // Period pills — full set
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: _allPills.map((pill) {
                final isSelected = _period == pill.$1;
                return GestureDetector(
                  onTap: () {
                    setState(() => _period = pill.$1);
                    widget.onPeriodChanged(pill.$1);
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 180),
                    margin: const EdgeInsets.only(right: 8),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? widget.color.withValues(alpha: 0.15)
                          : const Color(0xFF0F172A),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: isSelected
                            ? widget.color.withValues(alpha: 0.6)
                            : Colors.white.withValues(alpha: 0.06),
                        width: isSelected ? 1.5 : 1,
                      ),
                    ),
                    child: Text(pill.$2,
                        style: GoogleFonts.inter(
                          fontSize: 13,
                          fontWeight: isSelected
                              ? FontWeight.w700
                              : FontWeight.w500,
                          color: isSelected
                              ? widget.color
                              : const Color(0xFF94A3B8),
                        )),
                  ),
                );
              }).toList(),
            ),
          ),
          const Gap(28),

          // Big number
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                value.toString(),
                style: GoogleFonts.outfit(
                    fontSize: 56,
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                    height: 1),
              ),
              const Gap(12),
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.title,
                        style: GoogleFonts.inter(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.white60)),
                    Row(children: [
                      Icon(Icons.arrow_upward_rounded,
                          size: 13, color: const Color(0xFF10B981)),
                      const Gap(2),
                      Text('+12% ${_trendLabel()}',
                          style: GoogleFonts.inter(
                              fontSize: 12,
                              color: const Color(0xFF10B981),
                              fontWeight: FontWeight.w600)),
                    ]),
                  ],
                ),
              )
            ],
          ),
          const Gap(24),

          // Mini breakdown bars
          _MiniBar(label: 'Completed on time', pct: 0.87, color: widget.color),
          const Gap(10),
          _MiniBar(
              label: 'Delayed',
              pct: 0.09,
              color: const Color(0xFFF59E0B)),
          const Gap(10),
          _MiniBar(
              label: 'Canceled', pct: 0.04, color: const Color(0xFFEF4444)),
        ],
      ),
    );
  }
}

class _MiniBar extends StatelessWidget {
  final String label;
  final double pct;
  final Color color;

  const _MiniBar(
      {required this.label, required this.pct, required this.color});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(label,
                style: GoogleFonts.inter(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: Colors.white60)),
            Text('${(pct * 100).toStringAsFixed(0)}%',
                style: GoogleFonts.outfit(
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    color: color)),
          ],
        ),
        const Gap(6),
        ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: LinearProgressIndicator(
            value: pct,
            minHeight: 6,
            backgroundColor: Colors.white.withValues(alpha: 0.06),
            valueColor: AlwaysStoppedAnimation(color),
          ),
        ),
      ],
    );
  }
}

// ─── Performance Banner ───────────────────────────────────────────────────────

class _PerformanceBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF1E293B),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.white.withValues(alpha: 0.05)),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFF10B981).withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: const HugeIcon(
                icon: HugeIcons.strokeRoundedCheckmarkBadge01,
                color: Color(0xFF10B981),
                size: 24),
          ),
          const Gap(16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Efficiency Score: 98%',
                    style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: Colors.white)),
                Text(
                    'Parcel processing time improved by 12% this week.',
                    style: GoogleFonts.inter(
                        fontSize: 12, color: const Color(0xFF94A3B8))),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ─── Header icon button ───────────────────────────────────────────────────────

class _HeaderBtn extends StatelessWidget {
  final dynamic icon;
  final VoidCallback onTap;
  final String tooltip;

  const _HeaderBtn(
      {required this.icon, required this.onTap, required this.tooltip});

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: tooltip,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: 42,
          height: 42,
          decoration: BoxDecoration(
            color: const Color(0xFF1E293B),
            borderRadius: BorderRadius.circular(12),
            border:
                Border.all(color: Colors.white.withValues(alpha: 0.06)),
          ),
          child: Center(
              child: HugeIcon(icon: icon, color: Colors.white60, size: 20)),
        ),
      ),
    );
  }
}
