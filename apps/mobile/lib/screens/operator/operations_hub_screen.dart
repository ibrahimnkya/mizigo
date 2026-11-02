import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:intl/intl.dart' as intl;
import 'package:provider/provider.dart';

import '../../models/operation_model.dart';
import '../../models/parcel_model.dart';
import '../../providers/auth_provider.dart';
import '../../providers/parcel_provider.dart';
import '../../providers/printer_provider.dart';
import '../../services/api_service.dart';
import '../../theme/app_theme.dart';
import '../../theme/staff_palette.dart';
import '../../widgets/common/station_header_art.dart';
import '../../widgets/staff/action_cards.dart';
import '../../widgets/staff/bridge_card.dart';
import '../../widgets/staff/parcel_badges.dart';
import '../../widgets/staff/staff_settings.dart';
import 'needs_attention_screen.dart';

/// One operation the signed-in role can perform.
class _HubAction {
  const _HubAction({
    required this.title,
    required this.subtitle,
    required this.image,
    required this.route,
    this.pending,
    this.pendingLabel = '',
  });

  final String title;
  final String subtitle;
  final String image;
  final String route;

  /// Parcels waiting for this action (null = not applicable).
  final int? pending;
  final String pendingLabel;
}

class OperationsHubScreen extends StatefulWidget {
  const OperationsHubScreen({super.key});

  @override
  State<OperationsHubScreen> createState() => _OperationsHubScreenState();
}

class _OperationsHubScreenState extends State<OperationsHubScreen> {
  bool _loading = true;
  Map<String, dynamic> _today = {};

  @override
  void initState() {
    super.initState();
    _loadStats();
    // Pending counts and "Needs attention" come from the loaded parcels.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final parcels = context.read<ParcelProvider>();
      if (mounted && parcels.parcels.isEmpty) parcels.fetchMyParcels();
    });
  }

  Future<void> _loadStats() async {
    try {
      final raw = await ApiService.getOperatorStats();
      final data = (raw['data'] as Map<String, dynamic>?) ?? raw;
      final daily = data['daily'];
      if (mounted) setState(() => _today = daily is Map ? Map<String, dynamic>.from(daily) : data);
    } catch (_) {
      // Keep whatever we had; the card shows its empty state.
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  Future<void> _refresh() async {
    await Future.wait([_loadStats(), context.read<ParcelProvider>().fetchMyParcels()]);
  }

  int _n(String key) => (_today[key] as num?)?.toInt() ?? 0;

  List<_HubAction> _actions(String role, List<ParcelModel> parcels) {
    int count(bool Function(ParcelStatus s) test) => parcels.where((p) => test(p.status)).length;
    final readyToDispatch = count((s) => s == ParcelStatus.received);
    final inTransit = count((s) => s == ParcelStatus.inTransit || s == ParcelStatus.dispatched);
    final awaitingPickup = count((s) => s == ParcelStatus.atStation || s == ParcelStatus.offloaded);

    const receive = _HubAction(
      title: 'Receive',
      subtitle: 'Book a parcel a customer brings in',
      image: 'assets/images/staff_receive.png',
      route: '/receive-parcel',
    );
    final dispatch = _HubAction(
      title: 'Dispatch',
      subtitle: 'Load received parcels on a wagon',
      image: 'assets/images/staff_parcel.png',
      route: '/send-parcel',
      pending: readyToDispatch,
      pendingLabel: 'ready',
    );
    final offload = _HubAction(
      title: 'Offload',
      subtitle: 'Mark arriving parcels at station',
      image: 'assets/images/staff_receive.png',
      route: '/offload-parcel',
      pending: inTransit,
      pendingLabel: 'in transit',
    );
    final deliver = _HubAction(
      title: 'Deliver',
      subtitle: 'Hand over with the receiver’s code',
      image: 'assets/images/staff_deliver.png',
      route: '/deliver-parcel',
      pending: awaitingPickup,
      pendingLabel: 'waiting',
    );
    const reports = _HubAction(
      title: 'Reports',
      subtitle: 'Your numbers and PDF reports',
      image: 'assets/images/staff_reports.png',
      route: '/operator-reports',
    );

    return switch (role) {
      'CLERK' => [receive, deliver, reports],
      'TRAIN_GUARD' => [dispatch, offload, reports],
      _ => [receive, dispatch, offload, deliver],
    };
  }

  @override
  Widget build(BuildContext context) {
    final auth = context.watch<AuthProvider>();
    final parcels = context.watch<ParcelProvider>().parcels;
    final role = auth.user?.role?.toUpperCase() ?? '';
    final station = auth.user?.station;
    final actions = _actions(role, parcels);
    final isMaster = role == 'STATION_MASTER';
    final palette = StaffPalette.of(context);
    final topInset = MediaQuery.of(context).padding.top;
    final summary = switch (role) {
      'CLERK' => 'Receive and deliver parcels',
      'TRAIN_GUARD' => 'Dispatch and offload train cargo',
      'STATION_MASTER' => 'Oversee your station’s operations',
      _ => 'Manage your daily parcel work',
    };

    // Station masters get all four actions as a 2×2 grid; other roles get
    // their main action full width plus the rest in one row.
    final primary = isMaster ? null : actions.first;
    final gridActions = isMaster ? actions : actions.skip(1).toList();

    Widget tile(_HubAction a) => StaffActionTile(
      image: a.image,
      title: a.title,
      subtitle: a.subtitle,
      badge: _badge(a),
      onTap: () => a.route == '/operator-reports' ? context.go(a.route) : context.push(a.route),
    );

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: palette.overlayStyle,
      child: Scaffold(
        backgroundColor: palette.background,
        body: Stack(
          children: [
            const StationHeaderArt(blur: 8),
            LayoutBuilder(
              builder: (context, box) {
                final compact = box.maxHeight < 760;
                return RefreshIndicator(
                  onRefresh: _refresh,
                  color: AppTheme.tecOrange,
                  backgroundColor: palette.navBackground,
                  edgeOffset: topInset,
                  // Fits one screen; it only scrolls (still allowing pull to
                  // refresh) if a very small screen can't hold the essentials.
                  child: SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    child: SizedBox(
                      // Exactly one screen tall; very small screens get a
                      // minimum height and scroll instead of overflowing.
                      height: math.max(box.maxHeight, 600),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(18, topInset + (compact ? 12 : 20), 18, 14),
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
                                        'Operations',
                                        style: GoogleFonts.outfit(
                                          fontSize: 24,
                                          fontWeight: FontWeight.w700,
                                          color: palette.fg(),
                                        ),
                                      ),
                                      const Gap(4),
                                      Text(summary, style: GoogleFonts.outfit(fontSize: 15, color: palette.fg(0.65))),
                                    ],
                                  ),
                                ),
                                Consumer<PrinterProvider>(
                                  builder: (context, printer, _) => _HeaderButton(
                                    icon: HugeIcons.strokeRoundedPrinter,
                                    tooltip: printer.isConnected ? 'Printer connected' : 'Printer not connected',
                                    dotColor: printer.isConnected ? kStaffSuccess : palette.fg(0.4),
                                    onTap: () => context.push('/profile/printer-settings'),
                                  ),
                                ),
                                const Gap(8),
                                _HeaderButton(
                                  icon: HugeIcons.strokeRoundedHelpCircle,
                                  tooltip: 'Help',
                                  onTap: () => _showHubHelp(context),
                                ),
                              ],
                            ),
                            Gap(compact ? 14 : 20),

                            // ── Today ──
                            _TodayCard(
                              loading: _loading,
                              station: station,
                              total: _n('total'),
                              breakdown: switch (role) {
                                'CLERK' => [
                                  ('Received', _n('received'), HugeIcons.strokeRoundedPackageReceive),
                                  ('Delivered', _n('delivered'), HugeIcons.strokeRoundedPackageDelivered),
                                ],
                                'TRAIN_GUARD' => [
                                  ('Dispatched', _n('sent'), HugeIcons.strokeRoundedSpeedTrain01),
                                  ('At station', _n('atWarehouse'), HugeIcons.strokeRoundedBuilding04),
                                ],
                                _ => [
                                  ('Received', _n('received'), HugeIcons.strokeRoundedPackageReceive),
                                  ('Dispatched', _n('sent'), HugeIcons.strokeRoundedSpeedTrain01),
                                  ('Delivered', _n('delivered'), HugeIcons.strokeRoundedPackageDelivered),
                                ],
                              },
                              compact: compact,
                              onTap: () => context.go('/operator-reports'),
                            ),
                            Gap(compact ? 14 : 20),

                            // ── Actions ──
                            if (primary != null) ...[
                              StaffPrimaryActionCard(
                                image: primary.image,
                                title: primary.title,
                                subtitle: primary.subtitle,
                                badge: _badge(primary),
                                onTap: () => primary.route == '/operator-reports' ? context.go(primary.route) : context.push(primary.route),
                              ),
                              const Gap(10),
                            ],
                            StaffTileGrid(minRowHeight: 0, children: [for (final a in gridActions) tile(a)]),
                            const Gap(10),

                            // ── Quick tools ──
                            Row(
                              children: [
                                Expanded(
                                  child: _ToolTile(
                                    icon: HugeIcons.strokeRoundedQrCode,
                                    label: 'Scan parcel',
                                    onTap: () => context.push('/scanner', extra: ParcelOperation.view),
                                  ),
                                ),
                                const Gap(10),
                                Expanded(
                                  child: _ToolTile(
                                    icon: HugeIcons.strokeRoundedSearch01,
                                    label: 'Track parcel',
                                    onTap: () => context.go('/track'),
                                  ),
                                ),
                              ],
                            ),

                            // ── Needs attention: takes whatever height is left ──
                            Expanded(
                              child: LayoutBuilder(
                                builder: (context, c) {
                                  final waiting = _attention(role, parcels);
                                  // ~70 for the card header, ~62 per parcel row.
                                  final fit = ((c.maxHeight - 16 - 70) / 62).floor().clamp(0, 3);
                                  final needed = waiting.isEmpty ? 140.0 : 16 + 70 + 62.0;
                                  if (c.maxHeight < needed) return const SizedBox.shrink();
                                  return Align(
                                    alignment: Alignment.topCenter,
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 16),
                                      child: _AttentionCard(
                                        parcels: waiting,
                                        maxItems: fit,
                                        onSeeAll: () => Navigator.of(
                                          context,
                                        ).push(MaterialPageRoute(builder: (_) => const NeedsAttentionScreen())),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  List<ParcelModel> _attention(String role, List<ParcelModel> parcels) => parcelsNeedingAttention(role, parcels);

  Widget? _badge(_HubAction a) => (a.pending ?? 0) > 0 ? StaffCountPill('${a.pending} ${a.pendingLabel}') : null;

  void _showHubHelp(BuildContext context) {
    showStaffSheet<void>(
      context,
      title: 'Operations',
      builder: (_) => const Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          StaffSheetTile(
            icon: HugeIcons.strokeRoundedPackageReceive,
            label: 'Receive',
            subtitle: 'Register a parcel a customer brings to the station',
            onTap: null,
          ),
          StaffSheetTile(
            icon: HugeIcons.strokeRoundedSpeedTrain02,
            label: 'Dispatch',
            subtitle: 'Load received parcels onto a wagon',
            onTap: null,
          ),
          StaffSheetTile(
            icon: HugeIcons.strokeRoundedDeliveryBox01,
            label: 'Offload',
            subtitle: 'Mark arriving parcels as at the station',
            onTap: null,
          ),
          StaffSheetTile(
            icon: HugeIcons.strokeRoundedCheckmarkBadge01,
            label: 'Deliver',
            subtitle: 'Hand over to the receiver with their code',
            onTap: null,
          ),
        ],
      ),
    );
  }
}

class _HeaderButton extends StatelessWidget {
  const _HeaderButton({required this.icon, required this.tooltip, required this.onTap, this.dotColor});

  final List<List<dynamic>> icon;
  final String tooltip;
  final VoidCallback onTap;
  final Color? dotColor;

  @override
  Widget build(BuildContext context) {
    final palette = StaffPalette.of(context);
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Tooltip(
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
        ),
        if (dotColor != null)
          Positioned(
            top: -3,
            right: -3,
            child: Container(
              width: 12,
              height: 12,
              decoration: BoxDecoration(
                color: dotColor,
                shape: BoxShape.circle,
                border: Border.all(color: palette.background, width: 2),
              ),
            ),
          ),
      ],
    );
  }
}

/// Today's activity on the train-bridge card.
class _TodayCard extends StatelessWidget {
  const _TodayCard({
    required this.loading,
    required this.station,
    required this.total,
    required this.breakdown,
    required this.onTap,
    this.compact = false,
  });

  final bool compact;
  final bool loading;
  final String? station;
  final int total;
  final List<(String, int, List<List<dynamic>>)> breakdown;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final white75 = Colors.white.withValues(alpha: 0.75);
    final fmt = intl.NumberFormat.decimalPattern();
    return GestureDetector(
      onTap: onTap,
      child: BridgeCard(
        colors: const [Color(0xFF7A1424), Color(0xFF3A060E)],
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.18),
                    borderRadius: BorderRadius.circular(999),
                  ),
                  child: Text(
                    'Today',
                    style: GoogleFonts.outfit(fontSize: 13, fontWeight: FontWeight.w600, color: Colors.white),
                  ),
                ),
                if (station != null && station!.isNotEmpty) ...[
                  const Gap(8),
                  Expanded(
                    child: Text(
                      station!,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.outfit(fontSize: 14, color: white75),
                    ),
                  ),
                ] else
                  const Spacer(),
                Text(
                  'Reports',
                  style: GoogleFonts.outfit(fontSize: 14, fontWeight: FontWeight.w600, color: kStaffAccent),
                ),
                const HugeIcon(icon: HugeIcons.strokeRoundedArrowRight01, color: kStaffAccent, size: 18),
              ],
            ),
            Gap(compact ? 10 : 16),
            if (loading)
              SizedBox(
                height: compact ? 80 : 96,
                child: const Center(child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2)),
              )
            else ...[
              if (total == 0) ...[
                Text(
                  'No parcels yet today',
                  style: GoogleFonts.outfit(fontSize: 22, fontWeight: FontWeight.w700, color: Colors.white),
                ),
                const Gap(2),
                Text('Your work today will be counted here.', style: GoogleFonts.outfit(fontSize: 14, color: white75)),
              ] else ...[
                Text('Parcels handled today', style: GoogleFonts.outfit(fontSize: 14, color: white75)),
                Text(
                  fmt.format(total),
                  style: GoogleFonts.outfit(
                    fontSize: compact ? 32 : 40,
                    fontWeight: FontWeight.w800,
                    height: 1.1,
                    color: Colors.white,
                  ),
                ),
              ],
              Gap(compact ? 10 : 14),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 6),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  children: [
                    for (var i = 0; i < breakdown.length; i++) ...[
                      if (i > 0) Container(width: 1, height: 32, color: Colors.white.withValues(alpha: 0.2)),
                      Expanded(
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                HugeIcon(icon: breakdown[i].$3, color: kStaffAccent, size: 15),
                                const Gap(5),
                                Text(
                                  breakdown[i].$2 == 0 ? '–' : fmt.format(breakdown[i].$2),
                                  style: GoogleFonts.outfit(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            Text(breakdown[i].$1, style: GoogleFonts.outfit(fontSize: 12.5, color: white75)),
                          ],
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _ToolTile extends StatelessWidget {
  const _ToolTile({required this.icon, required this.label, required this.onTap});

  final List<List<dynamic>> icon;
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final palette = StaffPalette.of(context);
    return Material(
      color: palette.surface(0.10),
      borderRadius: BorderRadius.circular(18),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(18),
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            border: Border.all(color: palette.surface(0.12)),
          ),
          child: Row(
            children: [
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(color: kStaffAccent.withValues(alpha: 0.16), shape: BoxShape.circle),
                child: Center(
                  child: HugeIcon(icon: icon, color: kStaffAccent, size: 19),
                ),
              ),
              const Gap(10),
              Expanded(
                child: Text(
                  label,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.outfit(fontSize: 14.5, fontWeight: FontWeight.w600, color: palette.fg(0.9)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Up to three parcels waiting on the user, or an "all caught up" note.
class _AttentionCard extends StatelessWidget {
  const _AttentionCard({required this.parcels, required this.onSeeAll, this.maxItems = 3});

  final List<ParcelModel> parcels;
  final int maxItems;
  final VoidCallback onSeeAll;

  static String _city(String address) {
    final first = address.split(',').first.trim();
    return first.isEmpty ? '—' : first;
  }

  @override
  Widget build(BuildContext context) {
    final palette = StaffPalette.of(context);
    final shown = parcels.take(maxItems).toList();
    return StaffGlassCard(
      title: 'Needs attention',
      subtitle: parcels.isEmpty ? null : '${parcels.length} parcel${parcels.length == 1 ? '' : 's'} waiting on you',
      titleAction: parcels.isNotEmpty
          ? GestureDetector(
              onTap: onSeeAll,
              child: Text(
                parcels.length > shown.length ? 'View all ${parcels.length}' : 'View all',
                style: GoogleFonts.outfit(fontSize: 15, fontWeight: FontWeight.w600, color: kStaffAccent),
              ),
            )
          : null,
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
      child: shown.isEmpty
          ? Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                children: [
                  Container(
                    width: 42,
                    height: 42,
                    decoration: BoxDecoration(color: kStaffSuccess.withValues(alpha: 0.16), shape: BoxShape.circle),
                    child: const Center(
                      child: HugeIcon(icon: HugeIcons.strokeRoundedCheckmarkCircle02, color: kStaffSuccess, size: 22),
                    ),
                  ),
                  const Gap(12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'All caught up',
                          style: GoogleFonts.outfit(fontSize: 16, fontWeight: FontWeight.w700, color: palette.fg()),
                        ),
                        Text(
                          'Parcels that need your next step will show here.',
                          style: GoogleFonts.outfit(fontSize: 13.5, color: palette.fg(0.6)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          : Column(
              children: [
                for (var i = 0; i < shown.length; i++) ...[
                  if (i > 0) const StaffDivider(),
                  InkWell(
                    onTap: () => context.push('/operator/scanned-details', extra: shown[i]),
                    borderRadius: BorderRadius.circular(12),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        children: [
                          Image.asset('assets/images/staff_parcel.png', width: 32, height: 32, fit: BoxFit.contain),
                          const Gap(12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  shown[i].trackingNumber ?? 'Parcel',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.outfit(
                                    fontSize: 15.5,
                                    fontWeight: FontWeight.w700,
                                    color: palette.fg(),
                                  ),
                                ),
                                Text(
                                  '${_city(shown[i].fromAddress)} → ${_city(shown[i].toAddress)}',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.outfit(fontSize: 13.5, color: palette.fg(0.6)),
                                ),
                              ],
                            ),
                          ),
                          const Gap(8),
                          ParcelStatusBadge(status: shown[i].status, small: true),
                        ],
                      ),
                    ),
                  ),
                ],
              ],
            ),
    );
  }
}
