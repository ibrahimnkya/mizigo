import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gap/gap.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import '../../models/cargo_model.dart';
import '../../providers/cargo_provider.dart';
import '../../widgets/home/premium_ui_components.dart';

class BookingsScreen extends StatefulWidget {
  final String? filter;
  const BookingsScreen({super.key, this.filter});

  @override
  State<BookingsScreen> createState() => _BookingsScreenState();
}

class _BookingsScreenState extends State<BookingsScreen> {
  late String _selectedFilter;
  final List<String> _filters = [
    'All',
    'Today',
    'Last 30 days',
    'Last Week',
    'Received',
    'Delivered',
    'In Transit',
    'At Station',
    'Canceled',
  ];

  @override
  void initState() {
    super.initState();
    _selectedFilter = widget.filter != null 
        ? (widget.filter!.toLowerCase() == 'today' ? 'Today' : widget.filter!) 
        : 'All';
    if (!_filters.contains(_selectedFilter)) {
      _filters.add(_selectedFilter);
    }
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<CargoProvider>().fetchMyCargo();
    });
  }

  List<CargoModel> _applyFilter(List<CargoModel> all) {
    final now = DateTime.now();
    return all.where((c) {
      switch (_selectedFilter) {
        case 'Today':
          return c.createdAt.year == now.year &&
                 c.createdAt.month == now.month &&
                 c.createdAt.day == now.day;
        case 'Last Week':
          return now.difference(c.createdAt).inDays <= 7;
        case 'Last 30 days':
          return now.difference(c.createdAt).inDays <= 30;
        case 'Received':
          return c.status == CargoStatus.received;
        case 'Delivered':
          return c.status == CargoStatus.delivered;
        case 'In Transit':
          return c.status == CargoStatus.inTransit;
        case 'At Station':
          return c.status == CargoStatus.atStation;
        case 'Canceled':
          return c.status == CargoStatus.canceled;
        default:
          return true;
      }
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(
          'Bookings',
          style: GoogleFonts.outfit(
            fontWeight: FontWeight.w700,
            fontSize: 24,
            color: theme.textTheme.headlineSmall?.color,
          ),
        ),
        backgroundColor: theme.appBarTheme.backgroundColor,
        elevation: 0,
        scrolledUnderElevation: 0,
        surfaceTintColor: Colors.transparent,
        centerTitle: false,
        actions: [
          Consumer<CargoProvider>(
            builder: (context, provider, _) {
              if (provider.cargo.isEmpty) return const SizedBox.shrink();
              return Container(
                margin: const EdgeInsets.symmetric(vertical: 12),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: theme.primaryColor.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                      color: theme.primaryColor.withValues(alpha: 0.2)),
                ),
                child: Text(
                  '${provider.cargo.length} Orders',
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: theme.primaryColor,
                  ),
                ),
              );
            },
          ),
          IconButton(
            onPressed: () => context.push('/bookings/recent'),
            icon: Container(
              width: 38,
              height: 38,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: theme.dividerColor, width: 1.5),
              ),
              child: Center(
                child: HugeIcon(
                  icon: HugeIcons.strokeRoundedHelpCircle,
                  color: theme.brightness == Brightness.dark
                      ? Colors.white
                      : const Color(0xFF1E293B),
                  size: 20,
                ),
              ),
            ),
          ),
          const Gap(4),
        ],
      ),
      body: Consumer<CargoProvider>(
        builder: (context, provider, _) {
          return Column(
            children: [
              // ── Filters ──────────────────────────────────────────────
              Container(
                color: theme.appBarTheme.backgroundColor,
                padding: const EdgeInsets.only(bottom: 20, top: 4),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: _filters.map((filter) {
                      final isSelected = _selectedFilter == filter;
                      return Padding(
                        padding: const EdgeInsets.only(right: 12),
                        child: InkWell(
                          onTap: () =>
                              setState(() => _selectedFilter = filter),
                          borderRadius: BorderRadius.circular(24),
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 12),
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? theme.primaryColor
                                  : theme.cardColor,
                              borderRadius: BorderRadius.circular(24),
                            ),
                            child: Text(
                              filter,
                              style: GoogleFonts.inter(
                                fontSize: 14,
                                fontWeight: isSelected
                                    ? FontWeight.w700
                                    : FontWeight.w600,
                                color: isSelected
                                    ? Colors.white
                                    : const Color(0xFF64748B),
                              ),
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),

              // ── Content ──────────────────────────────────────────────
              Expanded(
                child: _buildContent(provider, theme),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildContent(CargoProvider provider, ThemeData theme) {
    if (provider.loading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (provider.error != null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.cloud_off_rounded,
                size: 56, color: Color(0xFF94A3B8)),
            const Gap(16),
            Text('Could not load bookings',
                style: GoogleFonts.outfit(
                    fontSize: 18, fontWeight: FontWeight.w700,
                    color: const Color(0xFF64748B))),
            const Gap(8),
            Text(provider.error!,
                style: GoogleFonts.inter(
                    fontSize: 13, color: const Color(0xFF94A3B8)),
                textAlign: TextAlign.center),
            const Gap(20),
            ElevatedButton.icon(
              onPressed: provider.fetchMyCargo,
              icon: const Icon(Icons.refresh_rounded),
              label: Text('Retry',
                  style: GoogleFonts.outfit(fontWeight: FontWeight.w700)),
              style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF3B82F6),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 12),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12))),
            ),
          ],
        ),
      );
    }

    final filtered = _applyFilter(provider.cargo);

    if (_selectedFilter == 'Upcoming' && filtered.isEmpty) {
      return const _EmptyBookingsState();
    }

    if (filtered.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.inbox_rounded,
                size: 64,
                color: const Color(0xFF94A3B8).withValues(alpha: 0.5)),
            const Gap(16),
            Text('No bookings found',
                style: GoogleFonts.outfit(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xFF64748B))),
          ],
        ),
      );
    }

    // Group by month
    final grouped = <String, List<CargoModel>>{};
    for (final c in filtered) {
      final key = DateFormat('MMMM yyyy').format(c.createdAt);
      grouped.putIfAbsent(key, () => []).add(c);
    }

    return RefreshIndicator(
      onRefresh: provider.fetchMyCargo,
      child: ListView(
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
        children: [
          for (final entry in grouped.entries) ...[
            Padding(
              padding: const EdgeInsets.only(bottom: 16, top: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    entry.key,
                    style: GoogleFonts.outfit(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: theme.textTheme.titleLarge?.color,
                    ),
                  ),
                  const HugeIcon(
                    icon: HugeIcons.strokeRoundedCalendar03,
                    color: Color(0xFF64748B),
                    size: 20,
                  ),
                ],
              ),
            ),
            for (final cargo in entry.value)
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: _BookingCard(
                  cargo: cargo,
                  onTap: () => context.push(
                    '/bookings/recent/${cargo.id}',
                    extra: cargo,
                  ),
                ),
              ),
          ],
        ],
      ),
    );
  }
}

// ─── Booking Card (real data) ─────────────────────────────────────────────────

class _BookingCard extends StatelessWidget {
  final CargoModel cargo;
  final VoidCallback onTap;

  const _BookingCard({required this.cargo, required this.onTap});

  Color _statusBg(bool isDark) {
    return switch (cargo.status) {
      CargoStatus.delivered =>
        isDark ? const Color(0xFF052E16) : const Color(0xFFF0FDF4),
      CargoStatus.inTransit || CargoStatus.atStation =>
        isDark ? const Color(0xFF1E3A5F) : const Color(0xFFEFF6FF),
      CargoStatus.canceled =>
        isDark ? const Color(0xFF3B0764) : const Color(0xFFFFF1F2),
      CargoStatus.received =>
        isDark ? const Color(0xFF1C1917) : const Color(0xFFF1F5F9),
    };
  }

  Color _statusFg() {
    return switch (cargo.status) {
      CargoStatus.delivered => const Color(0xFF16A34A),
      CargoStatus.inTransit || CargoStatus.atStation => const Color(0xFF2563EB),
      CargoStatus.canceled => const Color(0xFFE11D48),
      CargoStatus.received => const Color(0xFF64748B),
    };
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: theme.cardColor,
          borderRadius: BorderRadius.circular(22),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: isDark ? 0.2 : 0.06),
              blurRadius: 24,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Row(
              children: [
                const ParcelIcon(),
                const Gap(12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            cargo.cargoType.isEmpty
                                ? cargo.serviceType
                                : cargo.cargoType,
                            style: GoogleFonts.outfit(
                              fontSize: 17,
                              fontWeight: FontWeight.w700,
                              color: theme.textTheme.titleLarge?.color,
                            ),
                          ),
                          const Gap(4),
                          if (cargo.status == CargoStatus.inTransit)
                            const HugeIcon(
                              icon: HugeIcons.strokeRoundedFire,
                              color: Color(0xFFEF4444),
                              size: 16,
                            ),
                        ],
                      ),
                      Text(
                        '#${cargo.id.toUpperCase().substring(0, cargo.id.length.clamp(0, 9))}',
                        style: GoogleFonts.inter(
                          fontSize: 13,
                          color: const Color(0xFF94A3B8),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: _statusBg(isDark),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        cargo.status.displayLabel,
                        style: GoogleFonts.inter(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: _statusFg(),
                        ),
                      ),
                    ),
                    const Gap(4),
                    Text(
                      DateFormat('d MMM • h:mm a').format(cargo.createdAt),
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        color: const Color(0xFF94A3B8),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const Gap(20),
            const DashedDivider(),
            const Gap(20),

            // Details
            _buildRow(context, 'From', cargo.fromAddress),
            const Gap(12),
            _buildRow(context, 'To', cargo.toAddress),
            const Gap(12),
            _buildRow(context, 'Size', cargo.cargoSize.isEmpty ? '—' : cargo.cargoSize),
            const Gap(12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Fee',
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    color: const Color(0xFF94A3B8),
                  ),
                ),
                Text(
                  cargo.amount != null
                      ? 'TZS ${NumberFormat('#,###').format(cargo.amount!.toInt())}'
                      : cargo.receiverPays ? 'Receiver Pays' : '—',
                  style: GoogleFonts.outfit(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: theme.textTheme.titleLarge?.color,
                  ),
                ),
              ],
            ),
            const Gap(20),
            const DashedDivider(),
            const Gap(20),

            // Actions
            Row(
              children: [
                Expanded(
                  child: _ActionButton(
                    label: 'Share',
                    icon: HugeIcons.strokeRoundedShare08,
                    onTap: onTap,
                  ),
                ),
                const Gap(16),
                Expanded(
                  child: _ActionButton(
                    label: cargo.status == CargoStatus.received
                        ? 'Cancel'
                        : 'Details',
                    icon: cargo.status == CargoStatus.received
                        ? HugeIcons.strokeRoundedCancelCircle
                        : HugeIcons.strokeRoundedInformationCircle,
                    onTap: onTap,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRow(BuildContext context, String label, String value) {
    final theme = Theme.of(context);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 80,
          child: Text(
            label,
            style: GoogleFonts.inter(
              fontSize: 14,
              color: const Color(0xFF94A3B8),
            ),
          ),
        ),
        Expanded(
          child: Text(
            value,
            textAlign: TextAlign.right,
            style: GoogleFonts.inter(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: theme.textTheme.bodyLarge?.color,
            ),
          ),
        ),
      ],
    );
  }
}

class _ActionButton extends StatelessWidget {
  final String label;
  final dynamic icon;
  final VoidCallback onTap;

  const _ActionButton(
      {required this.label, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(30),
      child: Container(
        height: 52,
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0xFFE2E8F0), width: 1.5),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            HugeIcon(
                icon: icon,
                color: Theme.of(context).primaryColor,
                size: 18),
            const Gap(8),
            Text(
              label,
              style: GoogleFonts.inter(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Theme.of(context).textTheme.bodyLarge?.color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _EmptyBookingsState extends StatelessWidget {
  const _EmptyBookingsState();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/upcoming_empty.png',
              width: 240,
              height: 240,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) => Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  color: const Color(0xFFEFF6FF),
                  shape: BoxShape.circle,
                  border: Border.all(color: const Color(0xFF3B82F6), width: 2),
                ),
                child: const Icon(Icons.inbox_rounded,
                    size: 56, color: Color(0xFF3B82F6)),
              ),
            ),
            const Gap(12),
            Text(
              'No Upcoming Deliveries',
              textAlign: TextAlign.center,
              style: GoogleFonts.outfit(
                fontSize: 22,
                fontWeight: FontWeight.w800,
                color: Theme.of(context).textTheme.headlineMedium?.color,
              ),
            ),
            const Gap(10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'You don\'t have any deliveries planned at the moment. Create a new booking to get started.',
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFF64748B),
                  height: 1.6,
                ),
              ),
            ),
            const Gap(32),
            SizedBox(
              width: double.infinity,
              height: 58,
              child: ElevatedButton(
                onPressed: () => context.push('/send-package'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF3B82F6),
                  foregroundColor: Colors.white,
                  elevation: 0,
                  shape: const StadiumBorder(),
                  textStyle: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                child: const Text('Book a Delivery'),
              ),
            ),
            const Gap(40),
          ],
        ),
      ),
    );
  }
}
