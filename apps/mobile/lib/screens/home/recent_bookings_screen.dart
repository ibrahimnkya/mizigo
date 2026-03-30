import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gap/gap.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import '../../models/cargo_model.dart';
import '../../providers/cargo_provider.dart';
import '../../widgets/home/premium_ui_components.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

// ─── Status helpers ───────────────────────────────────────────────────────────

Color _statusBg(CargoStatus status, bool isDark) {
  return switch (status) {
    CargoStatus.delivered =>
      isDark ? const Color(0xFF052E16) : const Color(0xFFF0FDF4),
    CargoStatus.inTransit || CargoStatus.atStation =>
      isDark ? const Color(0xFF1E3A5F) : const Color(0xFFEFF6FF),
    CargoStatus.canceled =>
      isDark ? const Color(0xFF3B0764) : const Color(0xFFFFF1F2),
    CargoStatus.received =>
      isDark ? const Color(0xFF1C1917) : const Color(0xFFF8FAFC),
  };
}

Color _statusFg(CargoStatus status) {
  return switch (status) {
    CargoStatus.delivered => const Color(0xFF16A34A),
    CargoStatus.inTransit || CargoStatus.atStation => const Color(0xFF2563EB),
    CargoStatus.canceled => const Color(0xFFE11D48),
    CargoStatus.received => const Color(0xFF64748B),
  };
}

String _statusLabel(CargoStatus status) => status.displayLabel;

// ─── Recent Bookings Screen ──────────────────────────────────────────────────

class RecentBookingsScreen extends StatefulWidget {
  const RecentBookingsScreen({super.key});

  @override
  State<RecentBookingsScreen> createState() => _RecentBookingsScreenState();
}

class _RecentBookingsScreenState extends State<RecentBookingsScreen>
    with SingleTickerProviderStateMixin {
  String _filter = 'All';
  late AnimationController _animCtrl;

  final _filters = ['All', 'Received', 'Delivered', 'In Transit', 'At Station', 'Canceled'];

  @override
  void initState() {
    super.initState();
    _animCtrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    )..forward();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<CargoProvider>().fetchMyCargo();
    });
  }

  @override
  void dispose() {
    _animCtrl.dispose();
    super.dispose();
  }

  List<CargoModel> _applyFilter(List<CargoModel> all) {
    if (_filter == 'All') return all;
    return all.where((c) {
      if (_filter == 'Received') return c.status == CargoStatus.received;
      if (_filter == 'Delivered') return c.status == CargoStatus.delivered;
      if (_filter == 'In Transit') return c.status == CargoStatus.inTransit;
      if (_filter == 'At Station') return c.status == CargoStatus.atStation;
      if (_filter == 'Canceled') return c.status == CargoStatus.canceled;
      return true;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: theme.appBarTheme.backgroundColor,
        elevation: 0,
        scrolledUnderElevation: 0,
        surfaceTintColor: Colors.transparent,
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: Icon(Icons.arrow_back_ios_new_rounded, size: 20,
              color: isDark ? Colors.white : const Color(0xFF1E293B)),
        ),
        title: Text(
          'Recent Bookings',
          style: GoogleFonts.outfit(
            fontSize: 22,
            fontWeight: FontWeight.w700,
            color: theme.textTheme.headlineSmall?.color,
          ),
        ),
        centerTitle: false,
        actions: [
          Consumer<CargoProvider>(
            builder: (context, provider, _) {
              if (provider.cargo.isEmpty) return const SizedBox.shrink();
              return Container(
                margin: const EdgeInsets.only(right: 16),
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  color: theme.primaryColor.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: theme.primaryColor.withValues(alpha: 0.2)),
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
        ],
      ),
      body: Consumer<CargoProvider>(
        builder: (context, provider, _) {
          if (provider.loading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (provider.error != null) {
            return _buildError(provider.error!, () => provider.fetchMyCargo());
          }

          final all = provider.cargo.take(20).toList();
          final filtered = _applyFilter(all);

          return Column(
            children: [
              // ── Filters ─────────────────────────────────────────
              Container(
                color: theme.appBarTheme.backgroundColor,
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      // Count badge
                      Container(
                        margin: const EdgeInsets.only(right: 12),
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(
                          color: isDark ? const Color(0xFF1E3A5F) : const Color(0xFFEFF6FF),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        // child: Text(
                        //   '${filtered.length} orders',
                        //   style: GoogleFonts.inter(
                        //     fontSize: 12,
                        //     fontWeight: FontWeight.w600,
                        //     color: const Color(0xFF2563EB),
                        //   ),
                        // ),
                      ),
                      ..._filters.map((f) {
                        final isSel = _filter == f;
                        return Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: GestureDetector(
                            onTap: () {
                              setState(() => _filter = f);
                              _animCtrl.reset();
                              _animCtrl.forward();
                            },
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 200),
                              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                              decoration: BoxDecoration(
                                color: isSel
                                    ? theme.primaryColor
                                    : (isDark ? const Color(0xFF1E293B) : const Color(0xFFF8FAFC)),
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: isSel
                                      ? theme.primaryColor
                                      : (isDark ? Colors.white10 : const Color(0xFFE2E8F0)),
                                ),
                              ),
                              child: Text(
                                f,
                                style: GoogleFonts.inter(
                                  fontSize: 13,
                                  fontWeight: isSel ? FontWeight.w700 : FontWeight.w500,
                                  color: isSel ? Colors.white : const Color(0xFF64748B),
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                    ],
                  ),
                ),
              ),

              // ── List ────────────────────────────────────────────
              Expanded(
                child: filtered.isEmpty
                    ? _buildEmpty()
                    : RefreshIndicator(
                        onRefresh: () => provider.fetchMyCargo(),
                        child: ListView.builder(
                          padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
                          itemCount: filtered.length,
                          itemBuilder: (context, index) {
                            final cargo = filtered[index];
                            return _buildStaggered(
                              index,
                              Padding(
                                padding: const EdgeInsets.only(bottom: 14),
                                child: _BookingListCard(
                                  cargo: cargo,
                                  isDark: isDark,
                                  onTap: () => context.push(
                                    '/bookings/recent/${cargo.id}',
                                    extra: cargo,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildStaggered(int index, Widget child) {
    return AnimatedBuilder(
      animation: _animCtrl,
      builder: (context, c) {
        final delay = (index * 0.04).clamp(0.0, 0.7);
        final val = ((_animCtrl.value - delay) / (1 - delay)).clamp(0.0, 1.0);
        final curve = Curves.easeOutCubic.transform(val);
        return Opacity(
          opacity: val,
          child: Transform.translate(offset: Offset(0, 24 * (1 - curve)), child: c),
        );
      },
      child: child,
    );
  }

  Widget _buildEmpty() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.inbox_rounded, size: 64,
              color: const Color(0xFF94A3B8).withValues(alpha: 0.5)),
          const Gap(16),
          Text('No bookings found',
              style: GoogleFonts.outfit(fontSize: 18, fontWeight: FontWeight.w700,
                  color: const Color(0xFF64748B))),
          const Gap(8),
          Text('Try a different filter',
              style: GoogleFonts.inter(fontSize: 14, color: const Color(0xFF94A3B8))),
        ],
      ),
    );
  }

  Widget _buildError(String message, VoidCallback onRetry) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.cloud_off_rounded, size: 64, color: Color(0xFF94A3B8)),
            const Gap(16),
            Text('Could not load bookings',
                style: GoogleFonts.outfit(fontSize: 18, fontWeight: FontWeight.w700,
                    color: const Color(0xFF64748B))),
            const Gap(8),
            Text(message,
                style: GoogleFonts.inter(fontSize: 13, color: const Color(0xFF94A3B8)),
                textAlign: TextAlign.center),
            const Gap(20),
            ElevatedButton.icon(
              onPressed: onRetry,
              icon: const Icon(Icons.refresh_rounded),
              label: Text('Retry', style: GoogleFonts.outfit(fontWeight: FontWeight.w700)),
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF3B82F6),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
            ),
          ],
        ),
      ),
    );
  }
}

// ─── Booking List Card (Confirm-Order minimized style) ───────────────────────

class _BookingListCard extends StatelessWidget {
  final CargoModel cargo;
  final bool isDark;
  final VoidCallback onTap;

  const _BookingListCard(
      {required this.cargo, required this.isDark, required this.onTap});

  String _short(String addr) {
    final parts = addr.split(',');
    return parts.first.trim();
  }

  @override
  Widget build(BuildContext context) {
    final fgColor = _statusFg(cargo.status);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: isDark ? const Color(0xFF1E293B) : Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: isDark ? 0.2 : 0.06),
              blurRadius: 14,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          children: [
            // ── Header: icon · cargo type / id · status badge ──
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 18, 20, 0),
              child: Row(
                children: [
                  Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _statusBg(cargo.status, isDark),
                    ),
                    child: Center(
                      child: HugeIcon(
                        icon: HugeIcons.strokeRoundedPackage,
                        size: 22,
                        color: fgColor,
                      ),
                    ),
                  ),
                  const Gap(14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          cargo.cargoType.isEmpty ? cargo.serviceType : cargo.cargoType,
                          style: GoogleFonts.outfit(
                            fontSize: 16,
                            fontWeight: FontWeight.w800,
                            color: isDark ? Colors.white : const Color(0xFF1E293B),
                          ),
                        ),
                        Text(
                          '#${cargo.id.toUpperCase().substring(0, cargo.id.length.clamp(0, 8))}',
                          style: GoogleFonts.inter(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: isDark ? Colors.white38 : const Color(0xFF94A3B8),
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
                            horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(
                          color: _statusBg(cargo.status, isDark),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          _statusLabel(cargo.status),
                          style: GoogleFonts.inter(
                            fontSize: 11,
                            fontWeight: FontWeight.w700,
                            color: fgColor,
                          ),
                        ),
                      ),
                      const Gap(4),
                      Text(
                        cargo.serviceType,
                        style: GoogleFonts.inter(
                          fontSize: 11,
                          color: isDark ? Colors.white38 : const Color(0xFF94A3B8),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // ── Route bar (confirm-order style) ────────────────
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 14,
                        height: 14,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: isDark ? const Color(0xFF1E293B) : Colors.white,
                          border: Border.all(color: const Color(0xFF3B82F6), width: 4),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 3,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                const Color(0xFF3B82F6),
                                cargo.status == CargoStatus.canceled
                                    ? const Color(0xFFE11D48)
                                    : const Color(0xFF10B981),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 14,
                        height: 14,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: isDark ? const Color(0xFF1E293B) : Colors.white,
                          border: Border.all(
                            color: cargo.status == CargoStatus.canceled
                                ? const Color(0xFFE11D48)
                                : const Color(0xFF10B981),
                            width: 4,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Gap(10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              DateFormat('HH:mm').format(cargo.createdAt),
                              style: GoogleFonts.inter(
                                fontSize: 11,
                                fontWeight: FontWeight.w600,
                                color: isDark ? Colors.white38 : const Color(0xFF94A3B8),
                              ),
                            ),
                            Text(
                              _short(cargo.fromAddress),
                              style: GoogleFonts.outfit(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                color: isDark ? Colors.white : const Color(0xFF1E293B),
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                      // Price pill
                      if (cargo.amount != null)
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 4),
                          decoration: BoxDecoration(
                            color: isDark
                                ? const Color(0xFF0F172A)
                                : const Color(0xFFF1F5F9),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            'TZS ${NumberFormat('#,###').format(cargo.amount!.toInt())}',
                            style: GoogleFonts.outfit(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              color: isDark ? Colors.white70 : const Color(0xFF1E293B),
                            ),
                          ),
                        ),
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              DateFormat('d MMM').format(cargo.createdAt),
                              style: GoogleFonts.inter(
                                fontSize: 11,
                                fontWeight: FontWeight.w600,
                                color: isDark ? Colors.white38 : const Color(0xFF94A3B8),
                              ),
                            ),
                            Text(
                              _short(cargo.toAddress),
                              style: GoogleFonts.outfit(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                color: isDark ? Colors.white : const Color(0xFF1E293B),
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.end,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // ── Receiver footer + view details link ─────────────
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 14, 20, 0),
              child: Container(
                height: 1,
                color: isDark
                    ? Colors.white.withValues(alpha: 0.07)
                    : const Color(0xFFF1F5F9),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 12, 20, 18),
              child: Row(
                children: [
                  Icon(Icons.person_outline_rounded,
                      size: 14,
                      color: isDark ? Colors.white38 : const Color(0xFF94A3B8)),
                  const Gap(6),
                  Text(
                    cargo.receiverName,
                    style: GoogleFonts.inter(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: isDark ? Colors.white54 : const Color(0xFF64748B),
                    ),
                  ),
                  if (cargo.receiverPays) ...[
                    const Gap(6),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                        color: isDark
                            ? const Color(0xFF1C1917)
                            : const Color(0xFFFFFBEB),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        'Receiver Pays',
                        style: GoogleFonts.inter(
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFFD97706),
                        ),
                      ),
                    ),
                  ],
                  const Spacer(),
                  Text(
                    'View Details',
                    style: GoogleFonts.inter(
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFF3B82F6),
                    ),
                  ),
                  const Gap(2),
                  const Icon(Icons.chevron_right_rounded,
                      size: 16, color: Color(0xFF3B82F6)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ─── Booking Detail Screen ────────────────────────────────────────────────────

class BookingDetailScreen extends StatelessWidget {
  final CargoModel cargo;
  const BookingDetailScreen({super.key, required this.cargo});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: CustomScrollView(
        slivers: [
          // ── Collapsible AppBar ────────────────────────────────
          SliverAppBar(
            expandedHeight: 180,
            pinned: true,
            backgroundColor: theme.appBarTheme.backgroundColor,
            surfaceTintColor: Colors.transparent,
            leading: IconButton(
              onPressed: () => context.pop(),
              icon: Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: isDark ? Colors.white12 : Colors.white,
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.arrow_back_ios_new_rounded,
                    size: 16,
                    color: isDark ? Colors.white : const Color(0xFF1E293B)),
              ),
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      isDark ? const Color(0xFF0F172A) : const Color(0xFFEFF6FF),
                      isDark ? const Color(0xFF1E293B) : Colors.white,
                    ],
                  ),
                ),
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 56, 20, 16),
                    child: Row(
                      children: [
                        Container(
                          width: 64,
                          height: 64,
                          decoration: BoxDecoration(
                            color: _statusBg(cargo.status, isDark),
                            borderRadius: BorderRadius.circular(18),
                          ),
                          child: Center(
                            child: HugeIcon(
                              icon: HugeIcons.strokeRoundedPackage,
                              color: _statusFg(cargo.status),
                              size: 32,
                            ),
                          ),
                        ),
                        const Gap(16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                cargo.cargoType.isEmpty
                                    ? cargo.serviceType
                                    : cargo.cargoType,
                                style: GoogleFonts.outfit(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w800,
                                    color: theme.textTheme.headlineSmall?.color),
                              ),
                              const Gap(4),
                              Text(
                                '#${cargo.id.toUpperCase().substring(0, cargo.id.length.clamp(0, 10))}',
                                style: GoogleFonts.inter(
                                    fontSize: 13,
                                    color: const Color(0xFF94A3B8)),
                              ),
                              const Gap(8),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 4),
                                decoration: BoxDecoration(
                                  color: _statusBg(cargo.status, isDark),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Text(
                                  _statusLabel(cargo.status),
                                  style: GoogleFonts.inter(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700,
                                      color: _statusFg(cargo.status)),
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

          // ── Content ──────────────────────────────────────────
          SliverPadding(
            padding: const EdgeInsets.all(20),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                // Route Card
                _InfoCard(
                  isDark: isDark,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _sectionTitle('Route', isDark),
                      const Gap(16),
                      Row(
                        children: [
                          Column(
                            children: [
                              Container(
                                  width: 10,
                                  height: 10,
                                  decoration: const BoxDecoration(
                                      color: Color(0xFF3B82F6),
                                      shape: BoxShape.circle)),
                              Container(
                                  width: 1.5,
                                  height: 40,
                                  color: const Color(0xFFE2E8F0)),
                              Container(
                                  width: 10,
                                  height: 10,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: const Color(0xFF10B981),
                                          width: 2.5),
                                      shape: BoxShape.circle)),
                            ],
                          ),
                          const Gap(14),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _RouteLabel('From', cargo.fromAddress, theme),
                                const Gap(16),
                                _RouteLabel('To', cargo.toAddress, theme),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const Gap(16),

                // Booking Details
                _InfoCard(
                  isDark: isDark,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _sectionTitle('Shipment Details', isDark),
                      const Gap(12),
                      _DetailRow('Cargo Type', cargo.cargoType, theme),
                      _DetailRow('Package Size', cargo.cargoSize, theme),
                      _DetailRow('Service', cargo.serviceType, theme),
                      _DetailRow('Pickup Type', cargo.pickupType, theme),
                      _DetailRow('Receiver', cargo.receiverName, theme),
                      _DetailRow('Receiver Phone', cargo.receiverPhone, theme),
                      _DetailRow(
                          'Payment By',
                          cargo.receiverPays ? 'Receiver' : 'Sender',
                          theme),
                      _DetailRow(
                          'Booked',
                          DateFormat('d MMM yyyy · HH:mm')
                              .format(cargo.createdAt),
                          theme),
                    ],
                  ),
                ),
                const Gap(16),

                // Payment Summary
                if (cargo.amount != null)
                  _InfoCard(
                    isDark: isDark,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _sectionTitle('Payment', isDark),
                        const Gap(12),
                        if (cargo.payment != null) ...[
                          _DetailRow(
                              'Method',
                              cargo.payment!.paymentMethod ?? '—',
                              theme),
                          _DetailRow(
                              'Transaction',
                              cargo.payment!.transactionReference ?? 'Pending',
                              theme),
                          _DetailRow(
                              'Paid On',
                              cargo.payment!.paidAt != null
                                  ? DateFormat('d MMM yyyy')
                                      .format(cargo.payment!.paidAt!)
                                  : '—',
                              theme),
                          const Gap(8),
                          const DashedDivider(),
                          const Gap(8),
                        ],
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Total',
                                style: GoogleFonts.inter(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    color: const Color(0xFF64748B))),
                            Text(
                                'TZS ${NumberFormat('#,###').format(cargo.amount!.toInt())}',
                                style: GoogleFonts.outfit(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w800,
                                    color:
                                        theme.textTheme.titleLarge?.color)),
                          ],
                        ),
                      ],
                    ),
                  ),

                if (cargo.amount != null) const Gap(16),

                // Timeline
                _InfoCard(
                  isDark: isDark,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _sectionTitle('Timeline', isDark),
                      const Gap(16),
                      _TimelineEntry(
                          label: 'Received',
                          time: DateFormat('d MMM · HH:mm')
                              .format(cargo.createdAt),
                          done: true,
                          theme: theme),
                      _TimelineEntry(
                          label: 'In Transit',
                          time: DateFormat('d MMM').format(cargo.updatedAt),
                          done: cargo.status != CargoStatus.received &&
                              cargo.status != CargoStatus.canceled,
                          theme: theme),
                      _TimelineEntry(
                          label: 'At Station',
                          time: DateFormat('d MMM').format(cargo.updatedAt),
                          done: cargo.status == CargoStatus.atStation ||
                              cargo.status == CargoStatus.delivered,
                          theme: theme),
                      _TimelineEntry(
                          label: cargo.status == CargoStatus.canceled
                              ? 'Canceled'
                              : 'Delivered',
                          time: cargo.status == CargoStatus.delivered
                              ? DateFormat('d MMM').format(cargo.updatedAt)
                              : 'Pending',
                          done: cargo.status == CargoStatus.delivered,
                          isLast: true,
                          isFailed: cargo.status == CargoStatus.canceled,
                          theme: theme),
                    ],
                  ),
                ),
                const Gap(24),

                // Actions
                Row(
                  children: [
                    Expanded(
                      child: _ActionChip(
                        label: 'PDF Receipt',
                        icon: HugeIcons.strokeRoundedInvoice01,
                        onTap: () => _generateAndSharePdf(context),
                        isDark: isDark,
                        isPrimary: true,
                      ),
                    ),
                    const Gap(14),
                    Expanded(
                      child: _ActionChip(
                        label: 'Share Info',
                        icon: HugeIcons.strokeRoundedShare08,
                        onTap: () => _shareBooking(context),
                        isDark: isDark,
                      ),
                    ),
                      Expanded(
                        child: _ActionChip(
                          label: 'Receipt',
                          icon: HugeIcons.strokeRoundedInvoice01,
                          onTap: () =>
                              context.push('/cargo/${cargo.id}/receipt'),
                          isDark: isDark,
                          isPrimary: true,
                        ),
                      ),
                  ],
                ),

                // If receiver pays and booking is received, show an info note
                if (cargo.receiverPays &&
                    cargo.status == CargoStatus.received) ...[
                  const Gap(16),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: isDark
                          ? const Color(0xFF2D1B01)
                          : const Color(0xFFFFFBEB),
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(
                          color: const Color(0xFFD97706).withValues(alpha: 0.3)),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.info_outline_rounded,
                            color: Color(0xFFD97706), size: 20),
                        const Gap(12),
                        Expanded(
                          child: Text(
                            'The receiver (${cargo.receiverName}) will receive a payment request for this shipment.',
                            style: GoogleFonts.inter(
                              fontSize: 13,
                              color: const Color(0xFFD97706),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],

                const Gap(32),
              ]),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _generateAndSharePdf(BuildContext context) async {
    final pdf = pw.Document();

    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Header(
                level: 0,
                child: pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Text('Mizigo Booking Receipt',
                        style: pw.TextStyle(
                            fontSize: 24, fontWeight: pw.FontWeight.bold)),
                    pw.Text('#${cargo.id.toUpperCase().substring(0, 8)}',
                        style: const pw.TextStyle(fontSize: 16)),
                  ],
                ),
              ),
              pw.SizedBox(height: 20),
              pw.Text('Booking Details',
                  style: pw.TextStyle(
                      fontSize: 18, fontWeight: pw.FontWeight.bold)),
              pw.Divider(),
              _pdfRow('From:', cargo.fromAddress),
              _pdfRow('To:', cargo.toAddress),
              _pdfRow('Service:', cargo.serviceType),
              _pdfRow('Cargo Size:', cargo.cargoSize),
              _pdfRow('Cargo Type:',
                  cargo.cargoType.isEmpty ? 'General' : cargo.cargoType),
              _pdfRow('Receiver:', cargo.receiverName),
              _pdfRow('Receiver Phone:', cargo.receiverPhone),
              _pdfRow('Payment By:', cargo.receiverPays ? 'Receiver' : 'Sender'),
              _pdfRow('Status:', cargo.status.displayLabel),
              _pdfRow('Date:', DateFormat('d MMM yyyy HH:mm').format(cargo.createdAt)),
              pw.SizedBox(height: 20),
              if (cargo.amount != null)
                pw.Container(
                  alignment: pw.Alignment.centerRight,
                  child: pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.end,
                    children: [
                      pw.Text('Total Amount',
                          style: pw.TextStyle(
                              fontSize: 14, fontWeight: pw.FontWeight.bold)),
                      pw.Text(
                          'TZS ${NumberFormat('#,###').format(cargo.amount!.toInt())}',
                          style: pw.TextStyle(
                              fontSize: 20,
                              fontWeight: pw.FontWeight.bold,
                              color: PdfColors.blue900)),
                    ],
                  ),
                ),
              pw.Spacer(),
              pw.Divider(),
              pw.Align(
                alignment: pw.Alignment.center,
                child: pw.Text('Thank you for choosing Mizigo!',
                    style: const pw.TextStyle(fontSize: 12)),
              ),
            ],
          );
        },
      ),
    );

    await Printing.sharePdf(
        bytes: await pdf.save(), filename: 'mizigo_receipt_${cargo.id}.pdf');
  }

  pw.Widget _pdfRow(String label, String value) {
    return pw.Padding(
      padding: const pw.EdgeInsets.symmetric(vertical: 4),
      child: pw.Row(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.SizedBox(width: 120, child: pw.Text(label, style: pw.TextStyle(fontWeight: pw.FontWeight.bold))),
          pw.Expanded(child: pw.Text(value)),
        ],
      ),
    );
  }

  void _shareBooking(BuildContext context) {
    final msg = '''
📦 Mizigo Booking Confirmation
━━━━━━━━━━━━━━━━━━━━
Order: #${cargo.id.toUpperCase().substring(0, cargo.id.length.clamp(0, 8))}
Type: ${cargo.cargoType.isEmpty ? cargo.serviceType : cargo.cargoType}
From: ${cargo.fromAddress}
To: ${cargo.toAddress}
Receiver: ${cargo.receiverName} (${cargo.receiverPhone})
Payment: ${cargo.receiverPays ? 'Handled by Receiver' : 'Paid by Sender'}
Status: ${_statusLabel(cargo.status)}
Date: ${DateFormat('d MMM yyyy').format(cargo.createdAt)}
━━━━━━━━━━━━━━━━━━━━
Powered by Mizigo Logistics''';

    Clipboard.setData(ClipboardData(text: msg));

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Booking details copied!',
            style: GoogleFonts.inter(fontWeight: FontWeight.w600)),
        backgroundColor: const Color(0xFF10B981),
        duration: const Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}

// ─── Small helpers ────────────────────────────────────────────────────────────

Widget _sectionTitle(String label, bool isDark) => Text(
      label,
      style: GoogleFonts.outfit(
          fontSize: 16,
          fontWeight: FontWeight.w700,
          color: isDark ? Colors.white : const Color(0xFF1E293B)),
    );

class _RouteLabel extends StatelessWidget {
  final String label;
  final String value;
  final ThemeData theme;
  const _RouteLabel(this.label, this.value, this.theme);

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label,
              style: GoogleFonts.inter(
                  fontSize: 11, color: const Color(0xFF94A3B8))),
          const Gap(2),
          Text(value,
              style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: theme.textTheme.bodyLarge?.color),
              maxLines: 2),
        ],
      );
}

class _DetailRow extends StatelessWidget {
  final String label;
  final String value;
  final ThemeData theme;
  const _DetailRow(this.label, this.value, this.theme);

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(label,
                style: GoogleFonts.inter(
                    fontSize: 14, color: const Color(0xFF94A3B8))),
            Flexible(
                child: Text(value,
                    textAlign: TextAlign.right,
                    style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: theme.textTheme.bodyLarge?.color))),
          ],
        ),
      );
}

// ─── _InfoCard ────────────────────────────────────────────────────────────────

class _InfoCard extends StatelessWidget {
  final Widget child;
  final bool isDark;
  const _InfoCard({required this.child, required this.isDark});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF1E293B) : Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: isDark ? 0.15 : 0.05),
            blurRadius: 14,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: child,
    );
  }
}

// ─── _TimelineEntry ───────────────────────────────────────────────────────────

class _TimelineEntry extends StatelessWidget {
  final String label;
  final String time;
  final bool done;
  final bool isLast;
  final bool isFailed;
  final ThemeData theme;

  const _TimelineEntry({
    required this.label,
    required this.time,
    required this.done,
    required this.theme,
    this.isLast = false,
    this.isFailed = false,
  });

  @override
  Widget build(BuildContext context) {
    final color = isFailed
        ? const Color(0xFFE11D48)
        : done
            ? const Color(0xFF10B981)
            : const Color(0xFFCBD5E1);
    final isDark = theme.brightness == Brightness.dark;

    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            width: 32,
            child: Column(
              children: [
                Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: color,
                  ),
                  child: done
                      ? Icon(
                          isFailed ? Icons.close : Icons.check,
                          color: Colors.white,
                          size: 12,
                        )
                      : null,
                ),
                if (!isLast)
                  Expanded(
                    child: Container(
                      width: 2,
                      color: isDark ? Colors.white12 : const Color(0xFFE2E8F0),
                      margin: const EdgeInsets.symmetric(vertical: 4),
                    ),
                  ),
              ],
            ),
          ),
          const Gap(12),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(bottom: isLast ? 0 : 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    label,
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: done ? FontWeight.w600 : FontWeight.w500,
                      color: done
                          ? (isDark ? Colors.white : const Color(0xFF1E293B))
                          : const Color(0xFF94A3B8),
                    ),
                  ),
                  Text(
                    time,
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      color: const Color(0xFF94A3B8),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ─── _ActionChip ──────────────────────────────────────────────────────────────

class _ActionChip extends StatelessWidget {
  final String label;
  final dynamic icon;
  final VoidCallback onTap;
  final bool isDark;
  final bool isPrimary;

  const _ActionChip({
    required this.label,
    required this.icon,
    required this.onTap,
    required this.isDark,
    this.isPrimary = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14),
        decoration: BoxDecoration(
          color: isPrimary
              ? const Color(0xFF3B82F6)
              : (isDark ? const Color(0xFF1E293B) : const Color(0xFFF8FAFC)),
          borderRadius: BorderRadius.circular(14),
          border: isPrimary
              ? null
              : Border.all(
                  color: isDark ? Colors.white12 : const Color(0xFFE2E8F0),
                ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            HugeIcon(
              icon: icon,
              size: 18,
              color: isPrimary
                  ? Colors.white
                  : (isDark ? Colors.white70 : const Color(0xFF475569)),
            ),
            const Gap(8),
            Text(
              label,
              style: GoogleFonts.outfit(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: isPrimary
                    ? Colors.white
                    : (isDark ? Colors.white70 : const Color(0xFF475569)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

