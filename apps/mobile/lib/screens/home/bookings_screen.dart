import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gap/gap.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import '../../models/parcel_model.dart';
import '../../providers/parcel_provider.dart';
import '../../theme/app_theme.dart';
import '../../providers/auth_provider.dart';
import '../../theme/staff_palette.dart';
import '../../utils/parcel_search.dart';
import '../../services/api_service.dart';
import '../../widgets/profile/premium_settings_components.dart';
import '../../widgets/staff/parcel_search_suggestions.dart';
import '../../widgets/staff/date_range_sheet.dart';
import 'package:printing/printing.dart';
import '../../widgets/common/station_header_art.dart';
import '../../widgets/staff/parcel_badges.dart';
import '../../widgets/staff/staff_settings.dart';

class BookingsScreen extends StatefulWidget {
  final String? filter;
  const BookingsScreen({super.key, this.filter});

  @override
  State<BookingsScreen> createState() => _BookingsScreenState();
}

class _BookingsScreenState extends State<BookingsScreen> {
  // Status tab + period, applied together with the search.
  static const _statuses = ['All', 'Received', 'In Transit', 'At Station', 'Delivered', 'Canceled'];
  static const _periods = ['Any time', 'Today', 'Last 7 days', 'Last 30 days'];
  String _status = 'All';
  String _period = 'Any time';
  DateTimeRange? _customRange; // set when _period == 'Custom'

  /// Label for the period button.
  String get _periodLabel => _period == 'Custom' && _customRange != null
      ? '${DateFormat('d MMM').format(_customRange!.start)} – ${DateFormat('d MMM').format(_customRange!.end)}'
      : _period;

  /// Lets the user pick a date range (inclusive of both days).
  Future<DateTimeRange?> _pickRange() => showStaffDateRangeSheet(context, initial: _customRange);

  int _pageSize = 20;
  final _searchController = TextEditingController();
  final _searchFocus = FocusNode();
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    // Incoming filter (e.g. "today" or a status name from Home).
    final incoming = widget.filter?.toLowerCase();
    if (incoming == 'today') {
      _period = 'Today';
    } else {
      for (final st in _statuses) {
        if (st.toLowerCase() == incoming) _status = st;
      }
    }
    _searchController.addListener(() {
      setState(() {
        _searchQuery = _searchController.text.trim().toLowerCase();
        _pageSize = 20;
      });
    });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ParcelProvider>().fetchMyParcels();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    _searchFocus.dispose();
    super.dispose();
  }

  bool _inPeriod(ParcelModel c) {
    final now = DateTime.now();
    final created = c.createdAt.toLocal();
    switch (_period) {
      case 'Today':
        return created.year == now.year && created.month == now.month && created.day == now.day;
      case 'Last 7 days':
        return now.difference(created).inDays <= 7;
      case 'Last 30 days':
        return now.difference(created).inDays <= 30;
      case 'Custom':
        final r = _customRange;
        if (r == null) return true;
        final day = DateTime(created.year, created.month, created.day);
        return !day.isBefore(r.start) && !day.isAfter(r.end);
      default:
        return true;
    }
  }

  static bool _hasStatus(ParcelModel c, String status) => switch (status) {
        'Received' => c.status == ParcelStatus.received,
        'In Transit' => c.status == ParcelStatus.inTransit || c.status == ParcelStatus.dispatched,
        'At Station' => c.status == ParcelStatus.atStation || c.status == ParcelStatus.offloaded,
        'Delivered' => c.status == ParcelStatus.delivered,
        'Canceled' => c.status == ParcelStatus.canceled,
        _ => true,
      };

  /// Period + search (before the status tab), used for the tab counts.
  List<ParcelModel> _searchedInPeriod(List<ParcelModel> all) =>
      searchParcels(all.where(_inPeriod).toList(), _searchQuery);

  List<ParcelModel> _applyFilter(List<ParcelModel> all) =>
      _searchedInPeriod(all).where((c) => _hasStatus(c, _status)).toList();

  bool _downloading = false;

  /// Report type follows the selected status tab (server names).
  String get _reportType => switch (_status) {
        'In Transit' => 'Sent',
        'Canceled' => 'Cancelled',
        _ => _status,
      };

  void _downloadReport() {
    if (_downloading) return;
    const periods = [('Today', 'daily'), ('This week', 'weekly'), ('Last 30 days', 'last30'), ('Last 90 days', 'last90')];
    showStaffSheet<void>(
      context,
      title: 'Download ${_status == 'All' ? '' : '$_status '}report',
      builder: (sheetContext) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          for (final (label, key) in periods)
            StaffSheetTile(
              icon: HugeIcons.strokeRoundedCalendar03,
              label: label,
              subtitle: 'PDF',
              onTap: () {
                Navigator.pop(sheetContext);
                _generateReport(key, label);
              },
            ),
          StaffSheetTile(
            icon: HugeIcons.strokeRoundedCalendarSetting01,
            label: 'Custom range…',
            subtitle: 'PDF for the dates you pick',
            onTap: () async {
              Navigator.pop(sheetContext);
              final range = await _pickRange();
              if (range == null || !mounted) return;
              final label = '${DateFormat('d MMM').format(range.start)} – ${DateFormat('d MMM').format(range.end)}';
              _generateReport('custom', label, start: range.start, end: range.end);
            },
          ),
        ],
      ),
    );
  }

  Future<void> _generateReport(String period, String label, {DateTime? start, DateTime? end}) async {
    setState(() => _downloading = true);
    MizigoToasts.showSuccess(context, 'Preparing $label report…');
    try {
      final bytes = await ApiService.generateOperatorReport(type: _reportType, period: period, start: start, end: end);
      final stamp = DateFormat('yyyyMMdd_HHmm').format(DateTime.now());
      await Printing.sharePdf(
        bytes: bytes,
        filename: 'mizigo_${_reportType.toLowerCase().replaceAll(' ', '_')}_report_$stamp.pdf',
      );
    } catch (_) {
      if (mounted) MizigoToasts.showError(context, 'Couldn’t generate the report. Try again.');
    } finally {
      if (mounted) setState(() => _downloading = false);
    }
  }

  void _pickPeriod() {
    showStaffSheet<void>(
      context,
      title: 'Show bookings from',
      builder: (sheetContext) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          for (final period in _periods)
            StaffSheetTile(
              icon: HugeIcons.strokeRoundedCalendar03,
              label: period,
              selected: _period == period,
              onTap: () {
                setState(() {
                  _period = period;
                  _pageSize = 20;
                });
                Navigator.pop(sheetContext);
              },
            ),
          StaffSheetTile(
            icon: HugeIcons.strokeRoundedCalendarSetting01,
            label: 'Custom range…',
            subtitle: _period == 'Custom' ? _periodLabel : 'Pick start and end dates',
            selected: _period == 'Custom',
            onTap: () async {
              Navigator.pop(sheetContext);
              final range = await _pickRange();
              if (range == null || !mounted) return;
              setState(() {
                _customRange = range;
                _period = 'Custom';
                _pageSize = 20;
              });
            },
          ),
        ],
      ),
    );
  }

  void _open(ParcelModel parcel) {
    final isStaff = context.read<AuthProvider>().user?.isStaff ?? false;
    if (isStaff) {
      context.push('/operator/scanned-details', extra: parcel);
    } else {
      context.push('/bookings/recent/${parcel.id}', extra: parcel);
    }
  }

  @override
  Widget build(BuildContext context) {
    final palette = StaffPalette.of(context);
    final provider = context.watch<ParcelProvider>();
    final filtered = provider.loading || provider.error != null ? <ParcelModel>[] : _applyFilter(provider.parcels);
    final paged = filtered.take(_pageSize).toList();
    final hasMore = filtered.length > paged.length;
    final topInset = MediaQuery.of(context).padding.top;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: palette.overlayStyle,
      child: Scaffold(
        backgroundColor: palette.background,
        body: Stack(
          children: [
            const StationHeaderArt(blur: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(18, topInset + 20, 18, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          // Staff open this from Home (it isn't one of their
                          // tabs), so give them a way back.
                          if (Navigator.of(context).canPop()) ...[
                            IconButton(
                              tooltip: 'Back',
                              onPressed: () => Navigator.of(context).pop(),
                              style: IconButton.styleFrom(padding: EdgeInsets.zero, minimumSize: const Size(36, 36)),
                              icon: HugeIcon(icon: HugeIcons.strokeRoundedArrowLeft01, color: palette.fg(), size: 26),
                            ),
                            const Gap(4),
                          ],
                          Text(
                            'My Bookings',
                            style: GoogleFonts.outfit(fontSize: 24, fontWeight: FontWeight.w700, color: palette.fg()),
                          ),
                          const Gap(10),
                          if (!provider.loading && provider.parcels.isNotEmpty)
                            StaffBadge(
                              label: '${provider.parcels.length}',
                              color: AppTheme.tecOrange,
                              small: true,
                            ),
                          const Spacer(),
                          // Download a PDF report for the selected status tab.
                          Tooltip(
                            message: 'Download report',
                            child: Material(
                              color: palette.surface(0.15),
                              borderRadius: BorderRadius.circular(12),
                              child: InkWell(
                                onTap: _downloadReport,
                                borderRadius: BorderRadius.circular(12),
                                child: SizedBox(
                                  width: 44,
                                  height: 44,
                                  child: Center(
                                    child: _downloading
                                        ? const SizedBox(
                                            width: 20,
                                            height: 20,
                                            child: CircularProgressIndicator(strokeWidth: 2, color: AppTheme.tecOrange),
                                          )
                                        : HugeIcon(
                                            icon: kStaffDownloadIcon,
                                            color: palette.fg(),
                                            size: 22,
                                          ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Gap(4),
                      Text(
                        'Every parcel you’ve booked or handled.',
                        style: GoogleFonts.outfit(fontSize: 15, color: palette.fg(0.65)),
                      ),
                      const Gap(16),
                      ParcelSearchSuggestions(
                        controller: _searchController,
                        focusNode: _searchFocus,
                        phrases: true,
                        onParcelSelected: _open,
                        fieldBuilder: (_) => _SearchField(controller: _searchController, focusNode: _searchFocus),
                      ),
                    ],
                  ),
                ),
                const Gap(12),
                _FilterBar(
                  statuses: _statuses,
                  selected: _status,
                  counts: {
                    for (final st in _statuses)
                      st: provider.loading ? null : _searchedInPeriod(provider.parcels).where((c) => _hasStatus(c, st)).length,
                  },
                  period: _periodLabel,
                  onStatus: (st) => setState(() {
                    _status = st;
                    _pageSize = 20;
                  }),
                  onPeriod: _pickPeriod,
                ),
                const Gap(8),
                Expanded(
                  child: RefreshIndicator(
                    color: AppTheme.tecOrange,
                    backgroundColor: palette.navBackground,
                    onRefresh: () async {
                      setState(() => _pageSize = 20);
                      await provider.fetchMyParcels();
                    },
                    child: _buildList(palette, provider, filtered, paged, hasMore),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _message({
    required StaffPalette palette,
    required List<List<dynamic>> icon,
    required String title,
    required String body,
    Widget? action,
  }) {
    return ListView(
      physics: const AlwaysScrollableScrollPhysics(),
      padding: const EdgeInsets.fromLTRB(32, 60, 32, 24),
      children: [
        HugeIcon(icon: icon, color: palette.fg(0.3), size: 52),
        const Gap(14),
        Text(
          title,
          textAlign: TextAlign.center,
          style: GoogleFonts.outfit(fontSize: 18, fontWeight: FontWeight.w600, color: palette.fg()),
        ),
        const Gap(6),
        Text(
          body,
          textAlign: TextAlign.center,
          style: GoogleFonts.outfit(fontSize: 15, height: 1.4, color: palette.fg(0.6)),
        ),
        if (action != null) ...[const Gap(20), Center(child: SizedBox(width: 200, child: action))],
      ],
    );
  }

  Widget _buildList(
    StaffPalette palette,
    ParcelProvider provider,
    List<ParcelModel> filtered,
    List<ParcelModel> paged,
    bool hasMore,
  ) {
    if (provider.loading) {
      return ListView.separated(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.fromLTRB(18, 8, 18, 24),
        itemCount: 4,
        separatorBuilder: (_, _) => const Gap(10),
        itemBuilder: (_, _) => Container(
          height: 130,
          decoration: BoxDecoration(color: palette.surface(0.08), borderRadius: BorderRadius.circular(24)),
        ),
      );
    }
    if (provider.error != null) {
      return _message(
        palette: palette,
        icon: HugeIcons.strokeRoundedAlert02,
        title: 'Couldn’t load bookings',
        body: 'Check your connection and pull down to try again.',
        action: StaffButton(label: 'Retry', icon: HugeIcons.strokeRoundedRefresh, onPressed: provider.fetchMyParcels),
      );
    }
    if (filtered.isEmpty) {
      final isStaff = context.read<AuthProvider>().user?.isStaff ?? false;
      final searching = _searchQuery.isNotEmpty;
      final all = _status == 'All' && _period == 'Any time' && !searching;
      return _message(
        palette: palette,
        icon: searching ? HugeIcons.strokeRoundedSearch01 : HugeIcons.strokeRoundedPackage,
        title: searching ? 'No results' : (all ? 'No bookings yet' : 'Nothing here'),
        body: searching
            ? 'No bookings match “${_searchController.text.trim()}”.'
            : (all ? 'Parcels you book or handle will show up here.' : 'No $_status bookings for “$_periodLabel”.'.replaceAll('No All ', 'No ')),
        action: all && !isStaff
            ? StaffButton(
                label: 'Send a Parcel',
                icon: HugeIcons.strokeRoundedPackageAdd,
                onPressed: () => context.push('/send-package'),
              )
            : null,
      );
    }

    // Group by month
    final grouped = <String, List<ParcelModel>>{};
    for (final c in paged) {
      grouped.putIfAbsent(DateFormat('MMMM yyyy').format(c.createdAt.toLocal()), () => []).add(c);
    }

    return ListView(
      physics: const AlwaysScrollableScrollPhysics(),
      padding: const EdgeInsets.fromLTRB(18, 4, 18, 32),
      children: [
        for (final entry in grouped.entries) ...[
          Padding(
            padding: const EdgeInsets.only(top: 12, bottom: 10, left: 4),
            child: Row(
              children: [
                Text(
                  entry.key,
                  style: GoogleFonts.outfit(fontSize: 17, fontWeight: FontWeight.w700, color: palette.fg()),
                ),
                const Gap(8),
                Text('${entry.value.length}', style: GoogleFonts.outfit(fontSize: 15, color: palette.fg(0.5))),
              ],
            ),
          ),
          for (final parcel in entry.value)
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: _BookingCard(parcel: parcel, onTap: () => _open(parcel)),
            ),
        ],
        if (hasMore)
          Padding(
            padding: const EdgeInsets.only(top: 6),
            child: StaffButton(
              label: 'Load more · ${filtered.length - paged.length} left',
              icon: HugeIcons.strokeRoundedArrowDown01,
              color: palette.fg(0.8),
              outlined: true,
              onPressed: () => setState(() => _pageSize += 20),
            ),
          ),
      ],
    );
  }
}

class _SearchField extends StatelessWidget {
  const _SearchField({required this.controller, required this.focusNode});

  final TextEditingController controller;
  final FocusNode focusNode;

  @override
  Widget build(BuildContext context) {
    final palette = StaffPalette.of(context);
    OutlineInputBorder border(Color c, [double w = 1]) =>
        OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide(color: c, width: w));
    return SizedBox(
      height: 48,
      child: TextField(
        controller: controller,
        focusNode: focusNode,
        textInputAction: TextInputAction.search,
        cursorColor: AppTheme.tecOrange,
        style: GoogleFonts.outfit(fontSize: 16, color: palette.fg()),
        decoration: InputDecoration(
          filled: true,
          fillColor: palette.surface(0.06),
          hintText: 'Try “dar to dodoma”, a name or phone',
          hintStyle: GoogleFonts.outfit(fontSize: 16, color: palette.fg(0.5)),
          prefixIcon: Padding(
            padding: const EdgeInsets.only(left: 12, right: 10),
            child: HugeIcon(icon: HugeIcons.strokeRoundedSearch01, color: palette.fg(0.85), size: 22),
          ),
          prefixIconConstraints: const BoxConstraints(minWidth: 0, minHeight: 0),
          suffixIcon: controller.text.isEmpty
              ? null
              : IconButton(
                  tooltip: 'Clear',
                  onPressed: controller.clear,
                  icon: HugeIcon(icon: HugeIcons.strokeRoundedCancel01, color: palette.fg(0.6), size: 20),
                ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 12),
          border: border(palette.fg(0.4)),
          enabledBorder: border(palette.fg(0.4)),
          focusedBorder: border(AppTheme.tecOrange, 1.5),
        ),
      ),
    );
  }
}

class _BookingCard extends StatelessWidget {
  const _BookingCard({required this.parcel, required this.onTap});

  final ParcelModel parcel;
  final VoidCallback onTap;

  static String _city(String address) {
    final first = address.split(',').first.trim();
    return first.isEmpty ? '—' : first;
  }

  @override
  Widget build(BuildContext context) {
    final palette = StaffPalette.of(context);
    final reference = (parcel.trackingNumber?.isNotEmpty ?? false) ? parcel.trackingNumber! : 'Parcel';

    return Material(
      color: palette.surface(0.10),
      borderRadius: BorderRadius.circular(24),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(24),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Image.asset('assets/images/staff_parcel.png', width: 32, height: 32),
                  const Gap(12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Flexible(
                              child: Text(
                                reference,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.outfit(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 0.5,
                                  color: palette.fg(),
                                ),
                              ),
                            ),
                            if (isExpressUrgency(parcel.urgency)) ...[
                              const Gap(6),
                              const ExpressBadge(small: true),
                            ],
                          ],
                        ),
                        Text(
                          DateFormat('d MMM · HH:mm').format(parcel.createdAt.toLocal()),
                          style: GoogleFonts.outfit(fontSize: 13, color: palette.fg(0.55)),
                        ),
                      ],
                    ),
                  ),
                  ParcelStatusBadge(status: parcel.status, small: true),
                ],
              ),
              const Gap(14),
              _RouteRow(from: _city(parcel.fromAddress), to: _city(parcel.toAddress)),
              const Gap(10),
              Row(
                children: [
                  HugeIcon(icon: HugeIcons.strokeRoundedUser, color: palette.fg(0.55), size: 16),
                  const Gap(6),
                  Expanded(
                    child: Text(
                      parcel.receiverName.isNotEmpty ? parcel.receiverName : 'Receiver not set',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.outfit(fontSize: 14, color: palette.fg(0.7)),
                    ),
                  ),
                  if (parcel.amount != null)
                    Text(
                      'TSh ${NumberFormat('#,###').format(parcel.amount)}',
                      style: GoogleFonts.outfit(fontSize: 15, fontWeight: FontWeight.w600, color: AppTheme.tecOrange),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Origin on the left, destination on the right, joined by a dashed track
/// with a train in the middle.
class _RouteRow extends StatelessWidget {
  const _RouteRow({required this.from, required this.to});

  final String from;
  final String to;

  @override
  Widget build(BuildContext context) {
    final palette = StaffPalette.of(context);
    Widget stop(String label, String city, CrossAxisAlignment align) => Column(
          crossAxisAlignment: align,
          children: [
            Text(label, style: GoogleFonts.outfit(fontSize: 12, color: palette.fg(0.5))),
            const Gap(2),
            Text(
              city,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.outfit(fontSize: 17, fontWeight: FontWeight.w700, color: palette.fg()),
            ),
          ],
        );

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(color: palette.surface(0.06), borderRadius: BorderRadius.circular(16)),
      child: Row(
        children: [
          Expanded(child: stop('From', from, CrossAxisAlignment.start)),
          Expanded(
            child: Row(
              children: [
                Container(
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: AppTheme.tecOrange, width: 2),
                  ),
                ),
                Expanded(child: _Dashes(color: palette.fg(0.3))),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: HugeIcon(icon: HugeIcons.strokeRoundedSpeedTrain01, color: AppTheme.tecOrange, size: 18),
                ),
                Expanded(child: _Dashes(color: palette.fg(0.3))),
                const HugeIcon(icon: HugeIcons.strokeRoundedLocation01, color: AppTheme.tecOrange, size: 14),
              ],
            ),
          ),
          Expanded(child: stop('To', to, CrossAxisAlignment.end)),
        ],
      ),
    );
  }
}

class _Dashes extends StatelessWidget {
  const _Dashes({required this.color});

  final Color color;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, c) {
        final count = (c.maxWidth / 6).floor().clamp(1, 40);
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(
            count,
            (_) => Container(width: 3, height: 1.5, color: color),
          ),
        );
      },
    );
  }
}

/// Status tabs with live counts + a period button.
class _FilterBar extends StatelessWidget {
  const _FilterBar({
    required this.statuses,
    required this.selected,
    required this.counts,
    required this.period,
    required this.onStatus,
    required this.onPeriod,
  });

  final List<String> statuses;
  final String selected;
  final Map<String, int?> counts;
  final String period;
  final ValueChanged<String> onStatus;
  final VoidCallback onPeriod;

  @override
  Widget build(BuildContext context) {
    final palette = StaffPalette.of(context);
    final periodActive = period != 'Any time';
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Row(
            children: [
              Text('Status', style: GoogleFonts.outfit(fontSize: 14, color: palette.fg(0.6))),
              const Spacer(),
              Material(
                color: periodActive ? AppTheme.tecOrange.withValues(alpha: 0.18) : palette.surface(0.08),
                borderRadius: BorderRadius.circular(999),
                child: InkWell(
                  onTap: onPeriod,
                  borderRadius: BorderRadius.circular(999),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        HugeIcon(
                          icon: HugeIcons.strokeRoundedCalendar03,
                          color: periodActive ? AppTheme.tecOrange : palette.fg(0.8),
                          size: 16,
                        ),
                        const Gap(6),
                        Text(
                          period,
                          style: GoogleFonts.outfit(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: periodActive ? AppTheme.tecOrange : palette.fg(0.85),
                          ),
                        ),
                        const Gap(2),
                        HugeIcon(
                          icon: HugeIcons.strokeRoundedArrowDown01,
                          color: periodActive ? AppTheme.tecOrange : palette.fg(0.6),
                          size: 16,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const Gap(10),
        SizedBox(
          height: 40,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 18),
            itemCount: statuses.length,
            separatorBuilder: (_, _) => const Gap(8),
            itemBuilder: (_, i) {
              final st = statuses[i];
              final active = st == selected;
              final count = counts[st];
              return Semantics(
                selected: active,
                button: true,
                child: GestureDetector(
                  onTap: () => onStatus(st),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 150),
                    padding: const EdgeInsets.only(left: 14, right: 6),
                    decoration: BoxDecoration(
                      color: active ? AppTheme.tecOrange : palette.surface(0.08),
                      borderRadius: BorderRadius.circular(999),
                      border: Border.all(color: active ? AppTheme.tecOrange : palette.fg(0.15)),
                    ),
                    child: Row(
                      children: [
                        Text(
                          st,
                          style: GoogleFonts.outfit(
                            fontSize: 14,
                            fontWeight: active ? FontWeight.w700 : FontWeight.w500,
                            color: active ? Colors.white : palette.fg(0.85),
                          ),
                        ),
                        const Gap(6),
                        Container(
                          constraints: const BoxConstraints(minWidth: 24),
                          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                          decoration: BoxDecoration(
                            color: active ? Colors.white.withValues(alpha: 0.25) : palette.surface(0.12),
                            borderRadius: BorderRadius.circular(999),
                          ),
                          child: Text(
                            count == null ? '–' : '$count',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.outfit(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              color: active ? Colors.white : palette.fg(0.7),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
