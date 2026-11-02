import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../../models/operation_model.dart';
import '../../models/parcel_model.dart';
import '../../providers/auth_provider.dart';
import '../../providers/parcel_provider.dart';
import '../../providers/printer_provider.dart';
import '../../services/api_service.dart';
import '../../theme/app_theme.dart';
import '../../theme/staff_palette.dart';
import '../../widgets/staff/parcel_badges.dart';
import '../../widgets/staff/parcel_number_field.dart';
import '../../widgets/staff/parcel_search_suggestions.dart';
import '../../utils/parcel_search.dart';
import '../../widgets/profile/premium_settings_components.dart';
import '../../widgets/common/station_header_art.dart';
import 'bookings_screen.dart';

/// Staff home — Figma "4 Home 1".
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

// Role display metadata
const _kRoleLabels = {'CLERK': 'Station Clerk', 'TRAIN_GUARD': 'Train Guard', 'STATION_MASTER': 'Station Master'};

const _kHeaderArtHeight = 290.0;
const _kPagePadding = 16.0;
const _kRecentLimit = 5; // keeps the home page within one screen

class _StaffCard {
  final String label;
  final String image;
  final VoidCallback onTap;
  const _StaffCard(this.label, this.image, this.onTap);
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _searchFocus = FocusNode();
  bool _searchLoading = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _refreshData());
  }

  @override
  void dispose() {
    _searchController.dispose();
    _searchFocus.dispose();
    super.dispose();
  }

  Future<void> _refreshData() async {
    final parcel = context.read<ParcelProvider>();
    final auth = context.read<AuthProvider>();

    await Future.wait([parcel.fetchMyParcels(), if (auth.user?.isStaff ?? false) parcel.fetchOperatorStats()]);
  }

  /// Staff get the parcel details/actions screen (same as after a scan);
  /// other users keep the booking details page.
  void _openParcel(ParcelModel parcel) {
    final isStaff = context.read<AuthProvider>().user?.isStaff ?? false;
    if (isStaff) {
      context.push('/operator/scanned-details', extra: parcel);
    } else {
      context.push('/bookings/recent/${parcel.id}', extra: parcel);
    }
  }

  Future<void> _handleSearch(String value) async {
    if (value.trim().isEmpty) return;
    _searchFocus.unfocus();
    // Smart search over loaded parcels first; the server only if nothing matches.
    final local = searchParcels(context.read<ParcelProvider>().parcels, value);
    if (local.isNotEmpty) {
      _openParcel(local.first);
      return;
    }
    final query = value.trim().toUpperCase();

    setState(() => _searchLoading = true);
    try {
      final results = await ApiService.searchParcel(query);
      if (!mounted) return;
      if (results.isEmpty) {
        MizigoToasts.showError(context, 'No parcel found for "$query"');
      } else {
        final parcelData = results[0]['data'] ?? results[0];
        final parcel = ParcelModel.fromJson(parcelData);
        _openParcel(parcel);
      }
    } catch (e) {
      if (mounted) MizigoToasts.showError(context, 'Search error: $e');
    } finally {
      if (mounted) setState(() => _searchLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final auth = context.watch<AuthProvider>();
    final parcel = context.watch<ParcelProvider>();
    final printer = context.watch<PrinterProvider>();
    final isOperator = auth.user?.isStaff ?? false;
    final role = auth.user?.role?.toUpperCase() ?? '';
    final topInset = MediaQuery.of(context).padding.top;
    final statsLoading = parcel.loading && parcel.operatorStats.isEmpty;
    final parcelsLoading = parcel.loading && parcel.parcels.isEmpty;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: StaffPalette.of(context).overlayStyle,
      child: Scaffold(
        backgroundColor: StaffPalette.of(context).background,
        body: RefreshIndicator(
          onRefresh: _refreshData,
          color: AppTheme.tecOrange,
          backgroundColor: StaffPalette.of(context).background,
          edgeOffset: topInset,
          child: Stack(
            children: [
              const StationHeaderArt(height: _kHeaderArtHeight),
              // Fits exactly one screen: recent parcels take the remaining
              // height and show only as many cards as fit. Not scrollable,
              // but the pull-down still triggers RefreshIndicator.
              LayoutBuilder(
                builder: (context, viewport) {
                  final compact = viewport.maxHeight < 720;
                  return SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(parent: ClampingScrollPhysics()),
                    child: SizedBox(
                      height: viewport.maxHeight,
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(_kPagePadding, topInset + (compact ? 12 : 20), _kPagePadding, 12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            _Greeting(
                              name: _shortName(auth.user?.name ?? 'User'),
                              roleLabel: isOperator ? _kRoleLabels[role] : null,
                              onProfileTap: () => context.go('/profile'),
                              printerConnected: printer.isConnected,
                              printerLoading: printer.isLoading,
                              onPrinterTap: () => context.push('/profile/printer-settings'),
                            ),
                            const Gap(16),
                            Row(
                              children: [
                                Expanded(
                                  // Live suggestions from loaded parcels; Enter still searches the server.
                                  child: ParcelSearchSuggestions(
                                    controller: _searchController,
                                    focusNode: _searchFocus,
                                    onParcelSelected: _openParcel,
                                    fieldBuilder: (_) => _SearchField(
                                      controller: _searchController,
                                      focusNode: _searchFocus,
                                      loading: _searchLoading,
                                      onSubmitted: _handleSearch,
                                    ),
                                  ),
                                ),
                                const Gap(6),
                                _SquareButton(
                                  color: AppTheme.tecOrange,
                                  tooltip: 'Scan parcel QR',
                                  onTap: () => context.push('/scanner', extra: ParcelOperation.view),
                                  child: HugeIcon(
                                    icon: HugeIcons.strokeRoundedQrCode,
                                    color: AppTheme.tecMaroon,
                                    size: 24,
                                  ),
                                ),
                              ],
                            ),
                            if (isOperator) ...[
                              Gap(compact ? 36 : 88),
                              _StatsRow(
                                loading: statsLoading,
                                received: parcel.operatorStats['received'] ?? 0,
                                inTransit: parcel.operatorStats['in_transit'] ?? 0,
                                delivered: parcel.operatorStats['delivered'] ?? 0,
                              ),
                              Gap(compact ? 18 : 32),
                              _SectionTitle(title: _roleActionTitle(role)),
                              const Gap(12),
                              _ActionRow(
                                items: [
                                  for (final c in _buildStaffCards(role))
                                    _ActionItem(
                                      label: c.label,
                                      icon: Image.asset(c.image, width: 28, height: 28, fit: BoxFit.contain),
                                      onTap: c.onTap,
                                    ),
                                ],
                              ),
                            ] else ...[
                              Gap(compact ? 48 : 120),
                              const _SectionTitle(title: 'Quick Actions'),
                              const Gap(12),
                              _ActionRow(
                                items: [
                                  _ActionItem(
                                    label: 'Track',
                                    icon: HugeIcon(
                                      icon: HugeIcons.strokeRoundedSearch01,
                                      color: StaffPalette.of(context).fg(),
                                      size: 24,
                                    ),
                                    onTap: () => context.go('/track'),
                                  ),
                                  _ActionItem(
                                    label: 'Rates',
                                    icon: HugeIcon(
                                      icon: HugeIcons.strokeRoundedMoney02,
                                      color: StaffPalette.of(context).fg(),
                                      size: 24,
                                    ),
                                    onTap: () => context.push('/rates-calculator'),
                                  ),
                                  _ActionItem(
                                    label: 'Support',
                                    icon: HugeIcon(
                                      icon: HugeIcons.strokeRoundedCustomerService,
                                      color: StaffPalette.of(context).fg(),
                                      size: 24,
                                    ),
                                    onTap: () => context.push('/support'),
                                  ),
                                ],
                              ),
                            ],
                            Gap(compact ? 20 : 36),
                            _SectionTitle(
                              title: _recentSectionTitle(role, isOperator),
                              actionLabel: 'View All',
                              // Bookings is a tab for customers; staff don't have it as a
                              // tab, so open it over Home and keep Home highlighted.
                              onAction: isOperator
                                  ? () => Navigator.of(context).push(
                                        MaterialPageRoute(builder: (_) => const BookingsScreen()),
                                      )
                                  : () => context.go('/bookings'),
                            ),
                            const Gap(12),
                            Expanded(
                              child: LayoutBuilder(
                                builder: (context, box) {
                                  const cardExtent = 68.0 + 10.0;
                                  final fit = ((box.maxHeight + 10) / cardExtent).floor().clamp(0, _kRecentLimit);
                                  if (parcelsLoading) {
                                    return Column(
                                      children: [
                                        for (var i = 0; i < fit; i++) ...[
                                          if (i > 0) const Gap(10),
                                          const _Skeleton(height: 68, radius: 15),
                                        ],
                                      ],
                                    );
                                  }
                                  if (parcel.parcels.isEmpty) {
                                  return const Center(child: FittedBox(fit: BoxFit.scaleDown, child: _EmptyState()));
                                }
                                  final shown = parcel.parcels.take(fit).toList();
                                  return Column(
                                    children: [
                                      for (var i = 0; i < shown.length; i++) ...[
                                        if (i > 0) const Gap(10),
                                        _RecentParcelCard(parcel: shown[i], onTap: () => _openParcel(shown[i])),
                                      ],
                                    ],
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// "Ibrahim Nkya" → "Ibrahim N."
  String _shortName(String full) {
    final parts = full.trim().split(RegExp(r'\s+'));
    if (parts.length < 2 || parts.last.isEmpty) return full;
    return '${parts.first} ${parts.last[0].toUpperCase()}.';
  }

  String _roleActionTitle(String role) {
    switch (role) {
      case 'TRAIN_GUARD':
        return 'Train Operations';
      case 'STATION_MASTER':
        return 'Station Control';
      default:
        return 'Staff Actions';
    }
  }

  String _recentSectionTitle(String role, bool isOperator) {
    if (!isOperator) return 'Track Parcels';
    switch (role) {
      case 'TRAIN_GUARD':
        return 'Transit Parcels';
      case 'STATION_MASTER':
        return 'Station Activity';
      default:
        return 'Recent Parcels';
    }
  }

  List<_StaffCard> _buildStaffCards(String role) {
    switch (role) {
      case 'TRAIN_GUARD':
        return [
          _StaffCard('Dispatch', 'assets/images/staff_parcel.png', () => context.push('/send-parcel')),
          _StaffCard('Offload', 'assets/images/staff_receive.png', () => context.push('/offload-parcel')),
          _StaffCard('Reports', 'assets/images/staff_reports.png', () => context.go('/operator-reports')),
        ];
      case 'STATION_MASTER':
        return [
          _StaffCard('Receive', 'assets/images/staff_receive.png', () => context.push('/receive-parcel')),
          _StaffCard('Dispatch', 'assets/images/staff_parcel.png', () => context.push('/send-parcel')),
          _StaffCard('Reports', 'assets/images/staff_reports.png', () => context.go('/operator-reports')),
        ];
      case 'CLERK':
      default:
        return [
          _StaffCard('Receive', 'assets/images/staff_receive.png', () => context.push('/receive-parcel')),
          _StaffCard('Deliver', 'assets/images/staff_deliver.png', () => context.push('/deliver-parcel')),
          _StaffCard('Reports', 'assets/images/staff_reports.png', () => context.go('/operator-reports')),
        ];
    }
  }
}

class _Greeting extends StatelessWidget {
  const _Greeting({
    required this.name,
    required this.roleLabel,
    required this.onProfileTap,
    required this.printerConnected,
    required this.printerLoading,
    required this.onPrinterTap,
  });

  final String name;
  final String? roleLabel;
  final VoidCallback onProfileTap;
  final bool printerConnected;
  final bool printerLoading;
  final VoidCallback onPrinterTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: onProfileTap,
            behavior: HitTestBehavior.opaque,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome Back 👋',
                  style: GoogleFonts.outfit(fontSize: 14, color: StaffPalette.of(context).fg(0.6)),
                ),
                const Gap(2),
                Row(
                  children: [
                    Flexible(
                      child: Text(
                        name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.outfit(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: StaffPalette.of(context).fg(),
                        ),
                      ),
                    ),
                    if (roleLabel != null) ...[
                      const Gap(6),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                        decoration: BoxDecoration(
                          color: StaffPalette.of(context).surface(0.15),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          roleLabel!,
                          style: GoogleFonts.outfit(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: StaffPalette.of(context).fg(),
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
              ],
            ),
          ),
        ),
        // Status dot sits on the button's top-right corner: green = connected, gray = not.
        Stack(
          clipBehavior: Clip.none,
          children: [
            _SquareButton(
              color: StaffPalette.of(context).surface(0.15),
              tooltip: printerConnected ? 'Printer connected' : 'Printer not connected',
              onTap: onPrinterTap,
              child: printerLoading
                  ? SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(strokeWidth: 2, color: StaffPalette.of(context).fg()),
                    )
                  : HugeIcon(icon: HugeIcons.strokeRoundedPrinter, color: StaffPalette.of(context).fg(), size: 22),
            ),
            Positioned(
              top: -3,
              right: -3,
              child: IgnorePointer(
                child: Container(
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: printerConnected ? AppTheme.success : const Color(0xFF9CA3AF),
                    border: Border.all(color: StaffPalette.of(context).background, width: 2),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _SquareButton extends StatelessWidget {
  const _SquareButton({required this.color, required this.child, required this.onTap, required this.tooltip});

  final Color color;
  final Widget child;
  final VoidCallback onTap;
  final String tooltip;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: tooltip,
      child: Material(
        color: color,
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(12),
          child: SizedBox(width: 44, height: 44, child: Center(child: child)),
        ),
      ),
    );
  }
}

class _SearchField extends StatelessWidget {
  const _SearchField({
    required this.controller,
    required this.focusNode,
    required this.loading,
    required this.onSubmitted,
  });

  final TextEditingController controller;
  final FocusNode focusNode;
  final bool loading;
  final ValueChanged<String> onSubmitted;

  @override
  Widget build(BuildContext context) =>
      ParcelNumberField(
        controller: controller,
        focusNode: focusNode,
        loading: loading,
        onSubmitted: onSubmitted,
        freeText: true,
      );
}

class _IconTile extends StatelessWidget {
  const _IconTile({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      alignment: Alignment.center,
      decoration: BoxDecoration(color: StaffPalette.of(context).surface(0.15), borderRadius: BorderRadius.circular(12)),
      child: child,
    );
  }
}

class _StatsRow extends StatelessWidget {
  const _StatsRow({required this.loading, required this.received, required this.inTransit, required this.delivered});

  final bool loading;
  final int received;
  final int inTransit;
  final int delivered;

  @override
  Widget build(BuildContext context) {
    final format = NumberFormat.decimalPattern();
    Widget stat(dynamic icon, int value, String label) => Expanded(
      child: Column(
        children: [
          _IconTile(
            child: HugeIcon(icon: icon, color: StaffPalette.of(context).fg(), size: 24),
          ),
          const Gap(8),
          loading
              ? const _Skeleton(width: 48, height: 22, radius: 6)
              : Text(
                  format.format(value),
                  style: GoogleFonts.outfit(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: StaffPalette.of(context).fg(),
                  ),
                ),
          Text(label, style: GoogleFonts.outfit(fontSize: 14, color: StaffPalette.of(context).fg(0.5))),
        ],
      ),
    );

    return Row(
      children: [
        stat(HugeIcons.strokeRoundedPackageReceive, received, 'Received'),
        stat(HugeIcons.strokeRoundedSpeedTrain01, inTransit, 'In Transit'),
        stat(HugeIcons.strokeRoundedPackageDelivered, delivered, 'Delivered'),
      ],
    );
  }
}

class _ActionItem {
  const _ActionItem({required this.label, required this.icon, required this.onTap});

  final String label;
  final Widget icon;
  final VoidCallback onTap;
}

class _ActionRow extends StatelessWidget {
  const _ActionRow({required this.items});

  final List<_ActionItem> items;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (final item in items)
          Expanded(
            child: InkWell(
              onTap: item.onTap,
              borderRadius: BorderRadius.circular(12),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Column(
                  children: [
                    _IconTile(child: item.icon),
                    const Gap(8),
                    Text(item.label, style: GoogleFonts.outfit(fontSize: 15, color: StaffPalette.of(context).fg(0.8))),
                  ],
                ),
              ),
            ),
          ),
      ],
    );
  }
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle({required this.title, this.actionLabel, this.onAction});

  final String title;
  final String? actionLabel;
  final VoidCallback? onAction;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: GoogleFonts.outfit(fontSize: 17, fontWeight: FontWeight.w500, color: StaffPalette.of(context).fg()),
          ),
        ),
        if (actionLabel != null)
          GestureDetector(
            onTap: onAction,
            child: Text(
              actionLabel!,
              style: GoogleFonts.outfit(fontSize: 17, fontWeight: FontWeight.w600, color: AppTheme.tecOrange),
            ),
          ),
      ],
    );
  }
}

class _RecentParcelCard extends StatelessWidget {
  const _RecentParcelCard({required this.parcel, required this.onTap});

  final ParcelModel parcel;
  final VoidCallback onTap;

  static String _city(String address) {
    final first = address.split(',').first.trim();
    return first.isEmpty ? '—' : first;
  }

  bool get _isUrgent {
    final u = parcel.urgency.toLowerCase();
    return u.contains('express') || u.contains('urgent') || u == 'mgr';
  }

  @override
  Widget build(BuildContext context) {
    final title = (parcel.trackingNumber?.isNotEmpty ?? false) ? parcel.trackingNumber! : 'Parcel';

    return Material(
      color: StaffPalette.of(context).surface(0.10),
      borderRadius: BorderRadius.circular(15),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(15),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              Image.asset('assets/images/staff_parcel.png', width: 32, height: 32, fit: BoxFit.contain),
              const Gap(12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Flexible(
                          child: Text(
                            title,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.outfit(
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                              color: StaffPalette.of(context).fg(),
                            ),
                          ),
                        ),
                        if (_isUrgent) ...[const Gap(6), const ExpressBadge(small: true)],
                      ],
                    ),
                    const Gap(2),
                    Text(
                      '${_city(parcel.fromAddress)}  -  ${_city(parcel.toAddress)}',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.outfit(fontSize: 14, color: StaffPalette.of(context).fg(0.5)),
                    ),
                  ],
                ),
              ),
              const Gap(8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  ParcelStatusBadge(status: parcel.status, small: true),
                  const Gap(4),
                  Text(
                    DateFormat('h:mm a').format(parcel.updatedAt.toLocal()),
                    style: GoogleFonts.outfit(fontSize: 14, color: StaffPalette.of(context).fg(0.5)),
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

class _Skeleton extends StatelessWidget {
  const _Skeleton({this.width, required this.height, required this.radius});

  final double? width;
  final double height;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: StaffPalette.of(context).surface(0.08),
        borderRadius: BorderRadius.circular(radius),
      ),
    );
  }
}

class _EmptyState extends StatelessWidget {
  const _EmptyState();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 32),
      child: Column(
        children: [
          HugeIcon(icon: HugeIcons.strokeRoundedPackage, color: StaffPalette.of(context).fg(0.25), size: 48),
          const Gap(12),
          Text(
            'No recent parcels',
            style: GoogleFonts.outfit(fontSize: 16, fontWeight: FontWeight.w600, color: StaffPalette.of(context).fg()),
          ),
          const Gap(4),
          Text(
            'Parcels you handle will show up here',
            style: GoogleFonts.outfit(fontSize: 14, color: StaffPalette.of(context).fg(0.5)),
          ),
        ],
      ),
    );
  }
}
