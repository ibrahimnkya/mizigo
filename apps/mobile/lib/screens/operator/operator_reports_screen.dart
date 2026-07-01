import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:intl/intl.dart' as intl;
import 'package:printing/printing.dart';
import '../../services/api_service.dart';
import '../../widgets/common/shimmer_utils.dart';
import 'kpi_details_screen.dart';

// ─── Period enum ──────────────────────────────────────────────────────────────

enum ReportPeriod {
  today,
  thisWeek,
  thisMonth,
  last30,
  last90,
  custom
}

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

enum ReportDownloadStatus {
  idle,
  downloading,
  success,
  failed,
  paused
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
  List<dynamic> _reportHistory = [];
  bool _historyLoading = false;

  ReportDownloadStatus _downloadStatus = ReportDownloadStatus.idle;
  int _retryCount = 0;
  final int _maxRetries = 5;

  // Volume card data for the swiper
  final List<Map<String, dynamic>> _volumeCards = [
    {
      'timeframe': 'Daily',
      'gradientStart': const Color(0xFF3B82F6),
      'gradientEnd': const Color(0xFF1D4ED8),
    },
    {
      'timeframe': 'Weekly',
      'gradientStart': const Color(0xFF8B5CF6),
      'gradientEnd': const Color(0xFF6D28D9),
    },
    {
      'timeframe': 'Monthly',
      'gradientStart': const Color(0xFF10B981),
      'gradientEnd': const Color(0xFF047857),
    },
  ];

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
      if (mounted) setState(() => _stats = res);
    } catch (e) {
      debugPrint('Error fetching operator stats: $e');
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to fetch statistics: $e'),
            backgroundColor: const Color(0xFFEF4444),
          ),
        );
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

  int _totalForTimeframe(String timeframe) {
    final key = timeframe.toLowerCase();
    final sub = _stats[key];
    if (sub is Map) {
      return [
        (sub['received'] as num?)?.toInt() ?? 0,
        (sub['sent'] as num?)?.toInt() ?? 0,
        (sub['delivered'] as num?)?.toInt() ?? 0,
        (sub['atWarehouse'] as num?)?.toInt() ?? 0,
      ].fold(0, (a, b) => a + b);
    }
    return (_stats[key] as num?)?.toInt() ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final primaryColor = theme.colorScheme.primary;
    final secondaryColor = theme.colorScheme.secondary;
    final isCustomTheme = primaryColor.toARGB32() == 0xFF670E1E;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: SafeArea(
        child: ShimmerLoading(
          isLoading: _loading,
          child: _loading
              ? const _ReportsSkeleton()
              : RefreshIndicator(
                  onRefresh: () async {
                  await _fetchStats(silent: true);
                  await _fetchHistory();
                },
                color: theme.colorScheme.primary,
                child: ListView(
                  padding: const EdgeInsets.fromLTRB(24, 24, 24, 40),
                  children: [
                    // ── Header ───────────────────────────────────────────
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Reports',
                          style: GoogleFonts.outfit(
                            fontSize: 32,
                            fontWeight: FontWeight.w800,
                            color: theme.textTheme.headlineLarge?.color ?? Colors.white,
                          ),
                        ),
                        Row(
                          children: [
                            _HeaderBtn(
                              icon: HugeIcons.strokeRoundedDownload01,
                              onTap: _downloadReport,
                              status: _downloadStatus,
                              tooltip: 'Download',
                            ),
                            const Gap(8),
                            _HeaderBtn(
                              icon: HugeIcons.strokeRoundedHelpCircle,
                              onTap: () => _showHelp(context),
                              tooltip: 'Help',
                            ),
                          ],
                        ),
                      ],
                    ),
                    const Gap(6),
                    Text(
                      'Analyze your operational metrics',
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        color: theme.textTheme.bodyMedium?.color?.withValues(alpha: 0.7) ?? const Color(0xFF94A3B8),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const Gap(28),

                    // ── Stacked swiper cards ──────────────────────────────
                    SizedBox(
                      height: 230,
                      child: CardsSwiperWidget<Map<String, dynamic>>(
                        cardData: _volumeCards,
                        animationDuration: const Duration(milliseconds: 600),
                        downDragDuration: const Duration(milliseconds: 200),
                        maxDragDistance: 200.0,
                        onCardChange: (_) {},
                        onCardCollectionAnimationComplete: (_) {},
                        cardBuilder: (context, index, visibleIndex) {
                          if (index < 0 || index >= _volumeCards.length) {
                            return const SizedBox.shrink();
                          }
                          final card = _volumeCards[index];
                          final timeframe = card['timeframe'] as String;
                          final total = _totalForTimeframe(timeframe);

                          Color startColor = card['gradientStart'] as Color;
                          Color endColor = card['gradientEnd'] as Color;
                          
                          if (isCustomTheme) {
                            if (timeframe == 'Daily') {
                              startColor = primaryColor;
                              endColor = primaryColor.withValues(alpha: 0.7);
                            } else if (timeframe == 'Weekly') {
                              startColor = secondaryColor;
                              endColor = secondaryColor.withValues(alpha: 0.7);
                            } else {
                              startColor = primaryColor;
                              endColor = secondaryColor;
                            }
                          }

                          return _VolumeCard(
                            timeframe: timeframe,
                            total: total,
                            gradientStart: startColor,
                            gradientEnd: endColor,
                          );
                        },
                      ),
                    ),
                    const Gap(8),
                    Center(
                      child: Text(
                        'Swipe up to cycle cards',
                        style: GoogleFonts.inter(
                          fontSize: 12,
                          color: (theme.textTheme.bodySmall?.color ?? Colors.white).withValues(alpha: 0.24),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    const Gap(28),

                    // ── KPI Cards ─────────────────────────────────────────
                    Text(
                      'Operational KPIs',
                      style: GoogleFonts.outfit(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: theme.textTheme.titleMedium?.color ?? Colors.white,
                      ),
                    ),
                    const Gap(4),
                    Text(
                      'Select a period per metric',
                      style: GoogleFonts.inter(
                        fontSize: 13,
                        color: theme.textTheme.bodySmall?.color ?? const Color(0xFF64748B),
                      ),
                    ),
                    const Gap(16),
                    _KpiRow(
                      children: [
                        _KpiCard(
                          title: 'Received',
                          icon: HugeIcons.strokeRoundedPackageReceive,
                          color: isCustomTheme ? primaryColor : const Color(0xFF3B82F6),
                          dataKey: 'received',
                          stats: _stats,
                          valueForPeriod: _valueForPeriod,
                        ),
                        _KpiCard(
                          title: 'Delivered',
                          icon: HugeIcons.strokeRoundedCheckmarkBadge01,
                          color: isCustomTheme ? secondaryColor : const Color(0xFF10B981),
                          dataKey: 'delivered',
                          stats: _stats,
                          valueForPeriod: _valueForPeriod,
                        ),
                      ],
                    ),
                    const Gap(16),
                    _KpiRow(
                      children: [
                        _KpiCard(
                          title: 'Sent',
                          icon: HugeIcons.strokeRoundedSpeedTrain02,
                          color: isCustomTheme ? primaryColor : const Color(0xFFF59E0B),
                          dataKey: 'sent',
                          stats: _stats,
                          valueForPeriod: _valueForPeriod,
                        ),
                        _KpiCard(
                          title: 'At Station',
                          icon: HugeIcons.strokeRoundedDeliveryBox01,
                          color: isCustomTheme ? secondaryColor : const Color(0xFF3B82F6),
                          dataKey: 'atWarehouse',
                          stats: _stats,
                          valueForPeriod: _valueForPeriod,
                        ),
                      ],
                    ),
                    const Gap(28),

                    // ── Performance banner ────────────────────────────────
                    _PerformanceBanner(),
                  ],
                ),
              ),
        ),
      ),
    );
  }

  // ── Download / history ────────────────────────────────────────────────────

  void _downloadReport() {
    String selectedReportType = 'All';
    final List<Map<String, dynamic>> reportTypes = [
      {'name': 'All', 'icon': HugeIcons.strokeRoundedAnalytics01},
      {'name': 'Received', 'icon': HugeIcons.strokeRoundedPackageReceive},
      {'name': 'Sent', 'icon': HugeIcons.strokeRoundedPackageSent},
      {'name': 'Delivered', 'icon': HugeIcons.strokeRoundedDeliveryTruck01},
      {'name': 'At Station', 'icon': HugeIcons.strokeRoundedBuilding04},
      {'name': 'Cancelled', 'icon': HugeIcons.strokeRoundedCancel01},
    ];

    ReportPeriod selectedPeriod = ReportPeriod.thisMonth;
    DateTime? customStart;
    DateTime? customEnd;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (ctx) => DefaultTabController(
        length: 2,
        child: Container(
          decoration: const BoxDecoration(
            color: Color(0xFF0F172A),
            borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Gap(12),
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
              const Gap(8),
              TabBar(
                labelColor: Colors.white,
                unselectedLabelColor: const Color(0xFF94A3B8),
                indicatorColor: const Color(0xFF3B82F6),
                indicatorSize: TabBarIndicatorSize.label,
                dividerColor: Colors.transparent,
                tabs: const [
                  Tab(text: 'Download'),
                  Tab(text: 'History'),
                ],
              ),
              Flexible(
                child: SizedBox(
                  height: 520,
                  child: TabBarView(
                    children: [
                      SingleChildScrollView(
                        padding: const EdgeInsets.all(24),
                        child: StatefulBuilder(
                          builder: (context, setModalState) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Export Report',
                                  style: GoogleFonts.outfit(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white,
                                  ),
                                ),
                                const Gap(8),
                                Text(
                                  'Select parameters to generate your activity report.',
                                  style: GoogleFonts.inter(
                                    fontSize: 14,
                                    color: const Color(0xFF94A3B8),
                                  ),
                                ),
                                const Gap(28),
                                Text(
                                  'Report Type',
                                  style: GoogleFonts.outfit(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  ),
                                ),
                                const Gap(12),
                                Wrap(
                                  spacing: 12,
                                  runSpacing: 12,
                                  children: reportTypes.map((map) {
                                    final String type = map['name'];
                                    final dynamic icon = map['icon'];
                                    final isSelected =
                                        selectedReportType == type;
                                    return GestureDetector(
                                      onTap: () => setModalState(
                                          () => selectedReportType = type),
                                      child: AnimatedContainer(
                                        duration:
                                            const Duration(milliseconds: 200),
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 14,
                                          vertical: 10,
                                        ),
                                        decoration: BoxDecoration(
                                          color: isSelected
                                              ? const Color(0xFF3B82F6)
                                                  .withValues(alpha: 0.15)
                                              : const Color(0xFF1E293B),
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          border: Border.all(
                                            color: isSelected
                                                ? const Color(0xFF3B82F6)
                                                : Colors.transparent,
                                            width: 1.5,
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            HugeIcon(
                                              icon: icon,
                                              size: 16,
                                              color: isSelected
                                                  ? const Color(0xFF3B82F6)
                                                  : const Color(0xFF94A3B8),
                                            ),
                                            const Gap(8),
                                            Text(
                                              type,
                                              style: GoogleFonts.inter(
                                                fontSize: 13,
                                                fontWeight: FontWeight.w600,
                                                color: isSelected
                                                    ? const Color(0xFF3B82F6)
                                                    : const Color(0xFF94A3B8),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                ),
                                const Gap(24),
                                Text(
                                  'Date Range',
                                  style: GoogleFonts.outfit(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  ),
                                ),
                                const Gap(12),
                                Wrap(
                                  spacing: 12,
                                  runSpacing: 12,
                                  children:
                                      ReportPeriod.values.map((period) {
                                    final isSelected =
                                        selectedPeriod == period;
                                    return GestureDetector(
                                      onTap: () async {
                                        setModalState(() {
                                          selectedPeriod = period;
                                          if (period != ReportPeriod.custom) {
                                            customStart = null;
                                            customEnd = null;
                                          }
                                        });
                                      },
                                      child: AnimatedContainer(
                                        duration:
                                            const Duration(milliseconds: 200),
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 16,
                                          vertical: 10,
                                        ),
                                        decoration: BoxDecoration(
                                          color: isSelected
                                              ? const Color(0xFF3B82F6)
                                                  .withValues(alpha: 0.15)
                                              : const Color(0xFF1E293B),
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          border: Border.all(
                                            color: isSelected
                                                ? const Color(0xFF3B82F6)
                                                : Colors.transparent,
                                            width: 1.5,
                                          ),
                                        ),
                                        child: Text(
                                          period.label,
                                          style: GoogleFonts.inter(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w600,
                                            color: isSelected
                                                ? const Color(0xFF3B82F6)
                                                : const Color(0xFF94A3B8),
                                          ),
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                ),
                                if (selectedPeriod ==
                                    ReportPeriod.custom) ...[
                                  const Gap(16),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: _buildDateSelector(
                                          title: 'Start Date',
                                          date: customStart,
                                          onTap: () async {
                                            final selected =
                                                await showDatePicker(
                                              context: context,
                                              initialDate: customStart ??
                                                  DateTime.now(),
                                              firstDate: DateTime(2020),
                                              lastDate: customEnd ??
                                                  DateTime.now(),
                                              builder: _themeDatePicker,
                                            );
                                            if (selected != null) {
                                              setModalState(() =>
                                                  customStart = selected);
                                            }
                                          },
                                        ),
                                      ),
                                      const Gap(16),
                                      Expanded(
                                        child: _buildDateSelector(
                                          title: 'End Date',
                                          date: customEnd,
                                          onTap: () async {
                                            final selected =
                                                await showDatePicker(
                                              context: context,
                                              initialDate: customEnd ??
                                                  customStart ??
                                                  DateTime.now(),
                                              firstDate: customStart ??
                                                  DateTime(2020),
                                              lastDate: DateTime.now(),
                                              builder: _themeDatePicker,
                                            );
                                            if (selected != null) {
                                              setModalState(() =>
                                                  customEnd = selected);
                                            }
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                                const Gap(40),
                                SizedBox(
                                  width: double.infinity,
                                  height: 52,
                                  child: ElevatedButton(
                                    onPressed: () async {
                                      if (selectedPeriod ==
                                              ReportPeriod.custom &&
                                          (customStart == null ||
                                              customEnd == null)) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              'Please select both start and end dates',
                                              style: GoogleFonts.inter(
                                                  fontWeight:
                                                      FontWeight.w500),
                                            ),
                                            backgroundColor:
                                                Colors.red.shade600,
                                            behavior:
                                                SnackBarBehavior.floating,
                                          ),
                                        );
                                        return;
                                      }
                                      Navigator.pop(ctx);
                                      _triggerDownload(
                                        selectedReportType,
                                        selectedPeriod,
                                        start: customStart,
                                        end: customEnd,
                                      );
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor:
                                          const Color(0xFF3B82F6),
                                      foregroundColor: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(14),
                                      ),
                                      elevation: 0,
                                    ),
                                    child: Text(
                                      'Download PDF Report',
                                      style: GoogleFonts.inter(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                                const Gap(12),
                              ],
                            );
                          },
                        ),
                      ),
                      _buildHistoryTab(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _triggerDownload(
    String selectedReportType,
    ReportPeriod period, {
    DateTime? start,
    DateTime? end,
  }) async {
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
      _downloadStatus = _retryCount > 0 
          ? ReportDownloadStatus.paused 
          : ReportDownloadStatus.downloading;
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
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Failed to generate report after $_maxRetries retries.'),
              backgroundColor: const Color(0xFFEF4444),
              behavior: SnackBarBehavior.floating,
            ),
          );
          await Future.delayed(const Duration(seconds: 4));
          if (mounted) setState(() => _downloadStatus = ReportDownloadStatus.idle);
        }
      }
    }
  }

  Widget _buildHistoryTab() {
    if (_historyLoading) {
      return const Center(
        child: CircularProgressIndicator(color: Color(0xFF3B82F6)),
      );
    }
    if (_reportHistory.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const HugeIcon(
              icon: HugeIcons.strokeRoundedPackage,
              color: Color(0xFF334155),
              size: 64,
            ),
            const Gap(16),
            Text(
              'No generated reports found',
              style: GoogleFonts.inter(
                color: const Color(0xFF94A3B8),
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      );
    }
    return ListView.separated(
      padding: const EdgeInsets.all(24),
      itemCount: _reportHistory.length,
      separatorBuilder: (_, _) => const Gap(12),
      itemBuilder: (context, index) {
        final item = _reportHistory[index];
        return Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: const Color(0xFF1E293B),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.white.withValues(alpha: 0.05)),
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: const Color(0xFF3B82F6).withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(Icons.article_rounded,
                    color: Color(0xFF3B82F6), size: 28),
              ),
              const Gap(16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item['name'] ?? 'Report.pdf',
                      style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const Gap(4),
                    Text(
                      '${item['date'] ?? ''} • ${item['size'] ?? ''}',
                      style: GoogleFonts.inter(
                          fontSize: 12, color: const Color(0xFF64748B)),
                    ),
                  ],
                ),
              ),
              const Icon(Icons.check_circle_outline,
                  color: Color(0xFF10B981), size: 24),
            ],
          ),
        );
      },
    );
  }

  Widget _buildDateSelector({
    required String title,
    required DateTime? date,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: GoogleFonts.inter(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF94A3B8)),
          ),
          const Gap(8),
          Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            decoration: BoxDecoration(
              color: const Color(0xFF1E293B),
              borderRadius: BorderRadius.circular(12),
              border:
                  Border.all(color: Colors.white.withValues(alpha: 0.05)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    date != null
                        ? '${date.day}/${date.month}/${date.year}'
                        : 'Select',
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      color: date != null
                          ? Colors.white
                          : const Color(0xFF94A3B8),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const HugeIcon(
                  icon: HugeIcons.strokeRoundedCalendar03,
                  size: 18,
                  color: Color(0xFF64748B),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _themeDatePicker(BuildContext context, Widget? child) {
    return Theme(
      data: ThemeData.dark().copyWith(
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFF3B82F6),
          surface: Color(0xFF1E293B),
          onPrimary: Colors.white,
          onSurface: Colors.white,
        ),
        dialogTheme: const DialogThemeData(backgroundColor: Color(0xFF0F172A)),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
              foregroundColor: const Color(0xFF3B82F6)),
        ),
      ),
      child: child!,
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
                    borderRadius: BorderRadius.circular(2)),
              ),
            ),
            const Gap(24),
            Text(
              'Reports Guide',
              style: GoogleFonts.outfit(
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                  color: Colors.white),
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
                    HugeIcons.strokeRoundedDownload01,
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
                  backgroundColor: const Color(0xFF3B82F6),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                ),
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
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.03),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.white.withValues(alpha: 0.05)),
            ),
            child: HugeIcon(
                icon: icon, color: const Color(0xFF3B82F6), size: 20),
          ),
          const Gap(14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: GoogleFonts.outfit(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: Colors.white)),
                const Gap(3),
                Text(desc,
                    style: GoogleFonts.inter(
                        fontSize: 13,
                        color: Colors.white38,
                        height: 1.5)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ─── Volume Card Widget ────────────────────────────────────────────────────────

class _VolumeCard extends StatelessWidget {
  final String timeframe;
  final int total;
  final Color gradientStart;
  final Color gradientEnd;

  const _VolumeCard({
    required this.timeframe,
    required this.total,
    required this.gradientStart,
    required this.gradientEnd,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        boxShadow: [
          BoxShadow(
            color: gradientStart.withValues(alpha: 0.35),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(28),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [gradientStart, gradientEnd],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ),
            Positioned(
              top: 10,
              right: -20,
              child: HugeIcon(
                icon: HugeIcons.strokeRoundedChartHistogram,
                color: Colors.white.withValues(alpha: 0.12),
                size: 160,
              ),
            ),
            Positioned(
              bottom: -15,
              left: -10,
              child: HugeIcon(
                icon: HugeIcons.strokeRoundedPackage,
                color: Colors.white.withValues(alpha: 0.08),
                size: 80,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            timeframe.toUpperCase(),
                            style: GoogleFonts.inter(
                              fontSize: 12,
                              fontWeight: FontWeight.w800,
                              letterSpacing: 1.2,
                              color: Colors.white.withValues(alpha: 0.8),
                            ),
                          ),
                          const Gap(4),
                          Text(
                            'Parcel Volume',
                            style: GoogleFonts.outfit(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.2),
                          shape: BoxShape.circle,
                        ),
                        child: const HugeIcon(
                          icon: HugeIcons.strokeRoundedChartBarLine,
                          color: Colors.white,
                          size: 22,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        '$total',
                        style: GoogleFonts.outfit(
                          fontSize: 44,
                          fontWeight: FontWeight.w800,
                          color: Colors.white,
                          height: 1,
                        ),
                      ),
                      const Gap(8),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 6),
                        child: Text(
                          'Parcels',
                          style: GoogleFonts.inter(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Colors.white.withValues(alpha: 0.8),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Gap(10),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 5,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.15),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      timeframe == 'Daily'
                          ? "Today's Throughput"
                          : timeframe == 'Weekly'
                              ? 'Week-to-date'
                              : 'MTD Performance',
                      style: GoogleFonts.inter(
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
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
    );
  }
}

// ─── CardsSwiperWidget ────────────────────────────────────────────────────────

class CardsSwiperWidget<T> extends StatefulWidget {
  final List<T> cardData;
  final Duration animationDuration;
  final Duration downDragDuration;
  final Duration collectionDuration;
  final double maxDragDistance;
  final double dragDownLimit;
  final double thresholdValue;
  final void Function(int)? onCardChange;
  final Widget Function(BuildContext context, int index, int visibleIndex)
      cardBuilder;
  final bool shouldStartCardCollectionAnimation;
  final void Function(bool value) onCardCollectionAnimationComplete;

  final double topCardOffsetStart;
  final double topCardOffsetEnd;
  final double topCardScaleStart;
  final double topCardScaleEnd;

  final double secondCardOffsetStart;
  final double secondCardOffsetEnd;
  final double secondCardScaleStart;
  final double secondCardScaleEnd;

  final double thirdCardOffsetStart;
  final double thirdCardOffsetEnd;
  final double thirdCardScaleStart;
  final double thirdCardScaleEnd;

  const CardsSwiperWidget({
    required this.cardData,
    required this.cardBuilder,
    required this.onCardCollectionAnimationComplete,
    this.animationDuration = const Duration(milliseconds: 800),
    this.downDragDuration = const Duration(milliseconds: 300),
    this.collectionDuration = const Duration(milliseconds: 1000),
    this.maxDragDistance = 220.0,
    this.dragDownLimit = -40.0,
    this.thresholdValue = 0.3,
    this.onCardChange,
    this.topCardOffsetStart = 0.0,
    this.topCardOffsetEnd = -15.0,
    this.topCardScaleStart = 1.0,
    this.topCardScaleEnd = 0.9,
    this.secondCardOffsetStart = -15.0,
    this.secondCardOffsetEnd = 0.0,
    this.secondCardScaleStart = 0.95,
    this.secondCardScaleEnd = 1.0,
    this.thirdCardOffsetStart = -30.0,
    this.thirdCardOffsetEnd = -15.0,
    this.thirdCardScaleStart = 0.9,
    this.thirdCardScaleEnd = 0.95,
    this.shouldStartCardCollectionAnimation = false,
    super.key,
  });

  @override
  State<CardsSwiperWidget<T>> createState() =>
      _CardsSwiperWidgetState<T>();
}

class _CardsSwiperWidgetState<T> extends State<CardsSwiperWidget<T>>
    with TickerProviderStateMixin {
  AnimationController? _controller;
  Animation<double>? _yOffsetAnimation;
  Animation<double>? _rotationAnimation;
  Animation<double>? _animation;
  AnimationController? _downDragController;
  Animation<double>? _downDragAnimation;
  AnimationController? _cardCollectionAnimationController;
  Animation<double>? _cardCollectionyOffsetAnimation;

  double _startAnimationValue = 0.0;
  double _dragStartPosition = 0.0;
  double _dragOffset = 0.0;
  bool _isCardSwitched = false;
  bool _hasReachedHalf = false;
  bool _isAnimationBlocked = false;
  bool _shouldPlayVibration = true;

  late List<T> _cardData;

  Timer? _debounceTimer;

  Widget? _topCardWidget;
  int? _topCardIndex;

  Widget? _secondCardWidget;
  int? _secondCardIndex;

  Widget? _thirdCardWidget;
  int? _thirdCardIndex;

  Widget? _poppedCardWidget;
  int? _poppedCardIndex;

  Future<void> _onCardSwitchVibration() async {
    HapticFeedback.lightImpact();
    Future.delayed(const Duration(milliseconds: 250), () {
      HapticFeedback.selectionClick();
    });
  }

  Future<void> _onCardBlockVibration() async {
    HapticFeedback.lightImpact();
    Future.delayed(const Duration(milliseconds: 100),
        () => HapticFeedback.lightImpact());
    Future.delayed(const Duration(milliseconds: 300),
        () => HapticFeedback.mediumImpact());
  }

  @override
  void initState() {
    super.initState();
    _cardData = List.from(widget.cardData);

    _controller = AnimationController(
      duration: widget.animationDuration,
      vsync: this,
    );

    _animation = CurvedAnimation(
      parent: _controller!,
      curve: Curves.easeInOut,
    );

    _yOffsetAnimation = TweenSequence<double>([
      TweenSequenceItem<double>(
        tween: Tween<double>(begin: 0.0, end: 0.5),
        weight: 45.0,
      ),
      TweenSequenceItem<double>(
        tween: Tween<double>(begin: 0.5, end: 0.0),
        weight: 55.0,
      ),
    ]).animate(_animation!);

    _rotationAnimation = Tween<double>(
      begin: 0.0,
      end: -180.0,
    ).animate(_animation!);

    _downDragController = AnimationController(
      duration: widget.downDragDuration,
      vsync: this,
    );

    _downDragAnimation = Tween<double>(begin: 0.0, end: 0.0).animate(
      _downDragController!,
    )..addListener(() {
        _dragOffset = _downDragAnimation?.value ?? 0.0;
      });

    _controller!.addListener(() {
      if (_cardData.length > 1) {
        if (!_isCardSwitched && (_controller!.value) >= 0.5) {
          if (_debounceTimer?.isActive ?? false) {
            _isCardSwitched = true;
            return;
          }
          final firstCard = _cardData.removeAt(0);
          _poppedCardIndex = widget.cardData.indexOf(firstCard);
          _poppedCardWidget =
              widget.cardBuilder(context, _poppedCardIndex ?? 0, -1);
          _cardData.add(firstCard);
          _onCardSwitchVibration();
          _isCardSwitched = true;
          _updateCardWidgets();
          widget.onCardChange
              ?.call(widget.cardData.indexOf(_cardData[0]));
          _debounceTimer =
              Timer(const Duration(milliseconds: 300), () {});
        }
        if (_controller!.value == 1.0) {
          _isCardSwitched = false;
          _controller!.reset();
          _hasReachedHalf = false;
        }
      } else {
        _controller!.reset();
      }
    });

    if (widget.shouldStartCardCollectionAnimation) {
      _cardCollectionAnimationController = AnimationController(
        duration: widget.collectionDuration,
        vsync: this,
      );
      _cardCollectionyOffsetAnimation = Tween<double>(
        begin: 0.0,
        end: 1.0,
      ).animate(CurvedAnimation(
        parent: _cardCollectionAnimationController!,
        curve: Curves.easeOutCubic,
      ));
      _cardCollectionAnimationController!
          .forward()
          .then((_) => widget.onCardCollectionAnimationComplete(false));
    }

    _updateCardWidgets();
  }

  void _updateCardWidgets() {
    if (_cardData.isNotEmpty) {
      _topCardIndex = widget.cardData.indexOf(_cardData[0]);
      _topCardWidget =
          widget.cardBuilder(context, _topCardIndex ?? 0, 0);
    } else {
      _topCardIndex = null;
      _topCardWidget = null;
    }
    if (_cardData.length > 1) {
      _secondCardIndex = widget.cardData.indexOf(_cardData[1]);
      _secondCardWidget =
          widget.cardBuilder(context, _secondCardIndex ?? 0, 1);
    } else {
      _secondCardIndex = null;
      _secondCardWidget = null;
    }
    if (_cardData.length > 2) {
      _thirdCardIndex = widget.cardData.indexOf(_cardData[2]);
      _thirdCardWidget =
          widget.cardBuilder(context, _thirdCardIndex ?? 0, 2);
    } else {
      _thirdCardIndex = null;
      _thirdCardWidget = null;
    }
  }

  @override
  void didUpdateWidget(CardsSwiperWidget<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.cardData != oldWidget.cardData) {
      _controller?.stop();
      _downDragController?.stop();
      _cardData = List.from(widget.cardData);
      _isCardSwitched = false;
      _hasReachedHalf = false;
      _startAnimationValue = 0.0;
      _dragStartPosition = 0.0;
      _dragOffset = 0.0;
      _controller?.reset();
      _downDragController?.reset();
      _updateCardWidgets();
    }

    if (widget.shouldStartCardCollectionAnimation !=
        oldWidget.shouldStartCardCollectionAnimation) {
      if (widget.shouldStartCardCollectionAnimation) {
        _cardCollectionAnimationController = AnimationController(
          duration: const Duration(milliseconds: 1000),
          vsync: this,
        );
        _cardCollectionyOffsetAnimation = Tween<double>(
          begin: 0.0,
          end: 1.0,
        ).animate(CurvedAnimation(
          parent: _cardCollectionAnimationController!,
          curve: Curves.easeOutCubic,
        ));
        _cardCollectionAnimationController!
            .forward()
            .then((_) => widget.onCardCollectionAnimationComplete(false));
      } else {
        _cardCollectionAnimationController?.dispose();
        _cardCollectionAnimationController = null;
        _cardCollectionyOffsetAnimation = null;
      }
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    _downDragController?.dispose();
    _debounceTimer?.cancel();
    _cardCollectionAnimationController?.dispose();
    super.dispose();
  }

  void _onVerticalDragStart(DragStartDetails details) {
    if (_controller!.isAnimating ||
        _downDragController!.isAnimating ||
        widget.shouldStartCardCollectionAnimation ||
        _cardData.length == 1) {
      return;
    }
    _isAnimationBlocked = false;
    _startAnimationValue = _controller!.value;
    _dragStartPosition = details.globalPosition.dy;
    _controller!.stop(canceled: false);
    _downDragController!.stop();
    _hasReachedHalf = false;
  }

  void _onVerticalDragUpdate(DragUpdateDetails details) {
    if (_controller!.isAnimating ||
        _downDragController!.isAnimating ||
        _hasReachedHalf ||
        widget.shouldStartCardCollectionAnimation ||
        _isAnimationBlocked ||
        _cardData.length == 1) {
      return;
    }

    final double dragDistance =
        _dragStartPosition - details.globalPosition.dy;

    if (dragDistance >= 0) {
      final double dragFraction = dragDistance / widget.maxDragDistance;
      final double newValue =
          (_startAnimationValue + dragFraction).clamp(0.0, 1.0);
      _controller!.value = newValue;
      _dragOffset = 0.0;

      if (_controller!.value >= 0.5 && !_hasReachedHalf) {
        _hasReachedHalf = true;
        final double remaining = 1.0 - _controller!.value;
        final int duration =
            (_controller!.duration!.inMilliseconds * remaining).round();
        if (duration > 0) {
          _controller!.animateTo(1.0,
              duration: Duration(milliseconds: duration),
              curve: Curves.easeOut);
          _isAnimationBlocked = true;
        } else {
          _controller!.value = 1.0;
        }
      }
    } else {
      _controller!.value = _startAnimationValue;
      final double downDragOffset =
          dragDistance.clamp(widget.dragDownLimit, 0.0);
      _dragOffset = -downDragOffset;
      if (downDragOffset == widget.dragDownLimit) {
        if (_shouldPlayVibration) {
          _onCardBlockVibration();
          _shouldPlayVibration = false;
        }
      }
    }
  }

  void _onVerticalDragEnd(DragEndDetails details) {
    if (_controller!.isAnimating ||
        _downDragController!.isAnimating ||
        widget.shouldStartCardCollectionAnimation ||
        _isAnimationBlocked ||
        _cardData.length == 1) {
      return;
    }

    if (_dragOffset != 0.0) {
      _downDragAnimation = Tween<double>(
        begin: _dragOffset,
        end: 0.0,
      ).animate(CurvedAnimation(
        parent: _downDragController!,
        curve: Curves.easeOutCubic,
      ));
      _downDragController!.forward(from: 0.0);
    } else if (!_hasReachedHalf) {
      if (_controller!.value >= widget.thresholdValue) {
        final double remaining = 1.0 - _controller!.value;
        final int duration =
            (_controller!.duration!.inMilliseconds * remaining).round();
        if (duration > 0) {
          _controller!.animateTo(1.0,
              duration: Duration(milliseconds: duration),
              curve: Curves.easeOut);
          _isAnimationBlocked = true;
        } else {
          _controller!.value = 1.0;
        }
      } else {
        final int duration =
            (_controller!.duration!.inMilliseconds * _controller!.value)
                .round();
        if (duration > 0) {
          _controller!.animateBack(0.0,
              duration: Duration(milliseconds: duration),
              curve: Curves.easeOut);
        } else {
          _controller!.value = 0.0;
        }
      }
    }
    _shouldPlayVibration = true;
  }

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onVerticalDragStart: _onVerticalDragStart,
        onVerticalDragUpdate: _onVerticalDragUpdate,
        onVerticalDragEnd: _onVerticalDragEnd,
        child: AnimatedBuilder(
          animation: Listenable.merge([
            _controller!,
            _downDragController!,
            if (widget.shouldStartCardCollectionAnimation &&
                _cardCollectionAnimationController != null)
              _cardCollectionAnimationController!,
          ]),
          builder: (context, child) {
            final double yOffsetAnimationValue =
                _yOffsetAnimation?.value ?? 0.0;
            final double rotation = _rotationAnimation?.value ?? 0.0;
            double totalYOffset = -yOffsetAnimationValue *
                    widget.maxDragDistance +
                (_downDragController!.isAnimating
                    ? _downDragAnimation?.value ?? 0.0
                    : _dragOffset);

            if (_controller!.value >= 0.5) {
              totalYOffset += _cardData.length == 2
                  ? widget.secondCardOffsetStart
                  : widget.thirdCardOffsetStart;
            }

            List<Widget> stackChildren = [];

            if (_cardData.length == 1) {
              stackChildren.add(
                  _topCardWidget ?? const SizedBox.shrink());
            } else {
              final int cardCount = min(_cardData.length, 3);

              if (_isCardSwitched) {
                for (int i = 0; i < cardCount; i++) {
                  if (i == 0) {
                    stackChildren.add(_buildTopCard(totalYOffset, rotation));
                  } else {
                    stackChildren.add(_buildCard(cardCount - i));
                  }
                }
              } else {
                for (int i = cardCount - 1; i >= 0; i--) {
                  if (i == 0) {
                    stackChildren.add(_buildTopCard(totalYOffset, rotation));
                  } else {
                    stackChildren.add(_buildCard(i));
                  }
                }
              }
            }

            return Stack(
              alignment: Alignment.center,
              children: stackChildren,
            );
          },
        ),
      ),
    );
  }

  Widget _buildTopCard(double yOffset, double rotation) {
    if (_topCardWidget == null) return const SizedBox.shrink();

    final Widget cardWidget = _isCardSwitched && _cardData.length > 1
        ? (_poppedCardWidget ?? const SizedBox.shrink())
        : (_topCardWidget ?? const SizedBox.shrink());

    return AnimatedBuilder(
      animation: _controller!,
      builder: (context, child) {
        final double controllerValue = _controller!.value;
        double scale;

        if (_cardData.length == 2) {
          if (controllerValue <= 0.5) {
            if (controllerValue >= 0.45) {
              scale = 1.0 - 0.05 * ((controllerValue - 0.45) / 0.05);
            } else {
              scale = 1.0;
            }
          } else {
            scale = 0.95;
          }
        } else {
          if (controllerValue <= 0.5) {
            if (controllerValue >= 0.4) {
              scale = 1.0 - 0.1 * ((controllerValue - 0.4) / 0.1);
            } else {
              scale = 1.0;
            }
          } else {
            scale = 0.9;
          }
        }

        return Transform(
          alignment: Alignment.center,
          transform: Matrix4.identity()
            ..translate(0.0, yOffset)
            ..translate(
              0.0,
              _isCardSwitched
                  ? (-widget.thirdCardOffsetStart) *
                      ((_rotationAnimation?.value ?? 0) + 180) /
                      90
                  : 0.0,
            )
            ..setEntry(3, 2, 0.001)
            ..rotateX(rotation * pi / 180)
            ..scale(scale, scale),
          child: child,
        );
      },
      child: cardWidget,
    );
  }

  Widget _buildCard(int index) {
    if (_cardData.length <= 1 || index >= _cardData.length) {
      return const SizedBox.shrink();
    }

    Widget? cardWidget;
    if (_isCardSwitched) {
      cardWidget = index == 1 ? _topCardWidget : _secondCardWidget;
    } else {
      cardWidget = index == 1 ? _secondCardWidget : _thirdCardWidget;
    }

    if (cardWidget == null) return const SizedBox.shrink();

    return AnimatedBuilder(
      animation: _controller!,
      builder: (context, child) {
        double initialOffset;
        double initialScale;
        double targetScale;

        if (_cardData.length == 2) {
          initialOffset = widget.secondCardOffsetStart;
          initialScale = widget.secondCardScaleStart;
          targetScale = widget.secondCardScaleEnd;
        } else {
          if (index == 1) {
            initialOffset = widget.secondCardOffsetStart;
            initialScale = widget.secondCardScaleStart;
            targetScale = widget.secondCardScaleEnd;
          } else {
            initialOffset = widget.thirdCardOffsetStart;
            initialScale = widget.thirdCardScaleStart;
            targetScale = widget.thirdCardScaleEnd;
          }
        }

        double yOffset = initialOffset;
        double scale = initialScale;
        final double controllerValue = _controller!.value;

        if (controllerValue <= 0.5) {
          final double progress = controllerValue / 0.5;
          yOffset = _cardData.length == 2
              ? initialOffset - widget.secondCardOffsetStart * progress
              : initialOffset - widget.thirdCardOffsetStart * progress;
          scale = initialScale;
        } else {
          final double progress =
              Curves.easeOut.transform((controllerValue - 0.5) / 0.5);
          yOffset = _cardData.length == 2
              ? initialOffset -
                  widget.secondCardOffsetStart +
                  widget.secondCardOffsetEnd * progress
              : initialOffset -
                  widget.thirdCardOffsetStart +
                  widget.thirdCardOffsetEnd * progress;
          scale = initialScale + (targetScale - initialScale) * progress;
        }

        final double translatedY = widget
                    .shouldStartCardCollectionAnimation &&
                _cardCollectionyOffsetAnimation != null
            ? (_cardCollectionyOffsetAnimation!
                    .drive(CurveTween(
                        curve: Interval((0.4 * (index - 1)), 0.9)))
                    .drive(CurveTween(curve: Curves.easeOut))
                    .drive(Tween(begin: yOffset, end: yOffset + 20))
                    .value)
            : yOffset;

        return Transform(
          alignment: Alignment.center,
          transform: Matrix4.identity()
            ..translate(0.0, translatedY)
            ..scale(scale, scale),
          child: child,
        );
      },
      child: cardWidget,
    );
  }
}

// ─── KPI helpers ──────────────────────────────────────────────────────────────

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
  ReportPeriod _period = ReportPeriod.thisMonth;

  static const _pills = [
    (ReportPeriod.today, 'D'),
    (ReportPeriod.thisWeek, 'W'),
    (ReportPeriod.thisMonth, 'M'),
  ];

  void _showDetailSheet() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => KpiDetailsScreen(
          title: widget.title,
          dataKey: widget.dataKey,
          timeframe: _period.label,
          color: widget.color,
          icon: HugeIcon(
            icon: widget.icon,
            color: widget.color,
            size: 28,
          ),
          initialPeriod: _period,
        ),
      ),
    ).then((_) {
      if (mounted) setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final int value = widget.valueForPeriod(widget.dataKey, _period);
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: _showDetailSheet,
      child: Container(
        padding: const EdgeInsets.fromLTRB(18, 18, 18, 12),
        decoration: BoxDecoration(
          color: theme.cardTheme.color ?? theme.colorScheme.surface,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: theme.colorScheme.outline),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
                    size: 12, color: theme.textTheme.bodySmall?.color?.withValues(alpha: 0.3) ?? Colors.white24),
              ],
            ),
            const Gap(14),
            Text(
              value.toString(),
              style: GoogleFonts.outfit(
                  fontSize: 30,
                  fontWeight: FontWeight.w800,
                  color: theme.textTheme.bodyLarge?.color ?? Colors.white,
                  height: 1),
            ),
            const Gap(2),
            Text(
              widget.title,
              style: GoogleFonts.inter(
                  fontSize: 12,
                  color: theme.textTheme.bodyMedium?.color?.withValues(alpha: 0.8) ?? const Color(0xFF94A3B8),
                  fontWeight: FontWeight.w500),
            ),
            const Gap(14),
            Row(
              children: _pills.map((pill) {
                final isSelected = _period == pill.$1;
                return GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () => setState(() => _period = pill.$1),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 180),
                    margin: const EdgeInsets.only(right: 6),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? widget.color.withValues(alpha: 0.15)
                          : theme.textTheme.bodySmall?.color?.withValues(alpha: 0.04) ?? Colors.white.withValues(alpha: 0.04),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: isSelected
                            ? widget.color.withValues(alpha: 0.6)
                            : Colors.transparent,
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
                            : theme.textTheme.bodySmall?.color ?? const Color(0xFF64748B),
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

// ─── KPI Detail Sheet ─────────────────────────────────────────────────────────

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

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFF1E293B),
        borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
      ),
      padding: EdgeInsets.fromLTRB(
        24,
        16,
        24,
        MediaQuery.of(context).padding.bottom + 32,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                  color: Colors.white24,
                  borderRadius: BorderRadius.circular(2)),
            ),
          ),
          const Gap(24),
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
                    child: Text(
                      pill.$2,
                      style: GoogleFonts.inter(
                        fontSize: 13,
                        fontWeight: isSelected
                            ? FontWeight.w700
                            : FontWeight.w500,
                        color: isSelected
                            ? widget.color
                            : const Color(0xFF94A3B8),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          const Gap(28),
          const Gap(28),
          _MiniBar(
              label: 'Completed on time', pct: 0.87, color: widget.color),
          const Gap(10),
          _MiniBar(
              label: 'Delayed',
              pct: 0.09,
              color: const Color(0xFFF59E0B)),
          const Gap(10),
          _MiniBar(
              label: 'Canceled',
              pct: 0.04,
              color: const Color(0xFFEF4444)),
        ],
      ),
    );
  }
}

class _MiniBar extends StatelessWidget {
  final String label;
  final double pct;
  final Color color;

  const _MiniBar({
    required this.label,
    required this.pct,
    required this.color,
  });

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
    final theme = Theme.of(context);
    final isCustomTheme = theme.colorScheme.primary.toARGB32() == 0xFF670E1E;
    final successColor = isCustomTheme ? theme.colorScheme.secondary : const Color(0xFF10B981);

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: theme.cardTheme.color ?? theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: theme.colorScheme.outline),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: successColor.withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.check_circle_outline,
                color: successColor, size: 28),
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
                        color: theme.textTheme.bodyLarge?.color ?? Colors.white)),
                Text(
                    'Parcel processing time improved by 12% this week.',
                    style: GoogleFonts.inter(
                        fontSize: 12, color: theme.textTheme.bodyMedium?.color ?? const Color(0xFF94A3B8))),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ─── Header button ────────────────────────────────────────────────────────────

class _HeaderBtn extends StatelessWidget {
  final dynamic icon;
  final VoidCallback onTap;
  final String tooltip;
  final ReportDownloadStatus status;

  const _HeaderBtn({
    required this.icon,
    required this.onTap,
    required this.tooltip,
    this.status = ReportDownloadStatus.idle,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isCustomTheme = theme.colorScheme.primary.toARGB32() == 0xFF670E1E;
    final successColor = isCustomTheme ? theme.colorScheme.secondary : const Color(0xFF10B981);

    final bool isLoading = status == ReportDownloadStatus.downloading || 
                           status == ReportDownloadStatus.paused;
    final bool isSuccess = status == ReportDownloadStatus.success;

    return Tooltip(
      message: tooltip,
      child: GestureDetector(
        onTap: isLoading ? null : onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          width: 42,
          height: 42,
          decoration: BoxDecoration(
            color: isSuccess
                ? successColor.withValues(alpha: 0.15)
                : (theme.cardTheme.color ?? theme.colorScheme.surface),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: isSuccess
                  ? successColor.withValues(alpha: 0.4)
                  : theme.colorScheme.outline,
            ),
          ),
          child: Center(
            child: isLoading
                ? SizedBox(
                    width: 18,
                    height: 18,
                    child: CircularProgressIndicator(
                        strokeWidth: 2, color: theme.colorScheme.primary),
                  )
                : HugeIcon(
                    icon: icon,
                    color: isSuccess
                        ? successColor
                        : (theme.textTheme.bodyMedium?.color ?? Colors.white).withValues(alpha: 0.6),
                    size: 20,
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
      padding: const EdgeInsets.fromLTRB(24, 24, 24, 40),
      physics: const NeverScrollableScrollPhysics(),
      children: [
        // Header Skeleton
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const BoxSkeleton(width: 140, height: 40, borderRadius: 8),
            Row(
              children: [
                const CircleSkeleton(size: 42),
                const Gap(8),
                const CircleSkeleton(size: 42),
              ],
            ),
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
