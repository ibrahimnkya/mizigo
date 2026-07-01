import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gap/gap.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:intl/intl.dart' as intl;
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../../models/parcel_model.dart';
import '../../providers/parcel_provider.dart';
import '../../services/api_service.dart';
import '../../theme/app_theme.dart';
import '../../widgets/common/shimmer_utils.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import '../../utils/receipt_pdf_generator.dart';

// ─── Status helpers ───────────────────────────────────────────────────────────

Color _statusBg(ParcelStatus status) {
  return switch (status) {
    ParcelStatus.delivered => const Color(0xFFF0FDF4),
    ParcelStatus.inTransit || ParcelStatus.atStation || ParcelStatus.dispatched || ParcelStatus.offloaded => const Color(0xFFEFF6FF),
    ParcelStatus.canceled => const Color(0xFFFFF1F2),
    ParcelStatus.received => const Color(0xFFF8FAFC),
  };
}

Color _statusFg(ParcelStatus status) {
  return switch (status) {
    ParcelStatus.delivered => const Color(0xFF16A34A),
    ParcelStatus.inTransit || ParcelStatus.atStation || ParcelStatus.dispatched || ParcelStatus.offloaded => const Color(0xFF2563EB),
    ParcelStatus.canceled => const Color(0xFFE11D48),
    ParcelStatus.received => const Color(0xFF64748B),
  };
}

String _statusLabel(ParcelStatus status) => status.displayLabel;

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
      context.read<ParcelProvider>().fetchMyParcels();
    });
  }

  @override
  void dispose() {
    _animCtrl.dispose();
    super.dispose();
  }

  List<ParcelModel> _applyFilter(List<ParcelModel> all) {
    if (_filter == 'All') return all;
    return all.where((c) {
      if (_filter == 'Received') return c.status == ParcelStatus.received;
      if (_filter == 'Delivered') return c.status == ParcelStatus.delivered;
      if (_filter == 'In Transit') return c.status == ParcelStatus.inTransit;
      if (_filter == 'At Station') return c.status == ParcelStatus.atStation;
      if (_filter == 'Canceled') return c.status == ParcelStatus.canceled;
      return true;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: theme.appBarTheme.backgroundColor,
        elevation: 0,
        scrolledUnderElevation: 0,
        surfaceTintColor: Colors.transparent,
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: const HugeIcon(icon: HugeIcons.strokeRoundedArrowLeft01, size: 20,
              color: Colors.white),
        ),
        title: Text(
          'Recent Bookings',
          style: GoogleFonts.outfit(
            fontSize: 22,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
        centerTitle: false,
        actions: [
          Consumer<ParcelProvider>(
            builder: (context, provider, _) {
              if (provider.parcels.isEmpty) return const SizedBox.shrink();
              return Container(
                margin: const EdgeInsets.only(right: 16),
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  color: theme.primaryColor.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: theme.primaryColor.withValues(alpha: 0.2)),
                ),
                child: Text(
                  '${provider.parcels.length} Orders',
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
      body: Consumer<ParcelProvider>(
        builder: (context, provider, _) {
          if (provider.loading && provider.parcels.isEmpty) {
            return ShimmerLoading(
              isLoading: true,
              child: const ListSkeleton(height: 140, padding: 20),
            );
          }
          if (provider.error != null) {
            return _buildError(provider.error!, () => provider.fetchMyParcels());
          }

          final all = provider.parcels.take(20).toList();
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
                          color: const Color(0xFFEFF6FF),
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
                                    : AppTheme.background,
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: isSel
                                      ? theme.primaryColor
                                      : AppTheme.border,
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
                        onRefresh: () => provider.fetchMyParcels(),
                        child: ListView.builder(
                          padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
                          itemCount: filtered.length,
                          itemBuilder: (context, index) {
                            final parcel = filtered[index];
                            return _buildStaggered(
                              index,
                              Padding(
                                padding: const EdgeInsets.only(bottom: 14),
                                child: BookingListCard(
                                  parcel: parcel,
                                  onTap: () => context.push(
                                    '/bookings/recent/${parcel.id}',
                                    extra: parcel,
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
          Text('No data is available',
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

class BookingListCard extends StatelessWidget {
  final ParcelModel parcel;
  final VoidCallback onTap;

  const BookingListCard(
      {super.key, required this.parcel, required this.onTap});

  String _short(String addr) {
    final parts = addr.split(',');
    return parts.first.trim();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final fgColor = _statusFg(parcel.status);
    final bgColor = _statusBg(parcel.status);
    
    // Calculate progress fraction
    double progress = 0.2;
    switch (parcel.status) {
      case ParcelStatus.delivered:
        progress = 1.0;
        break;
      case ParcelStatus.inTransit:
      case ParcelStatus.dispatched:
        progress = 0.75;
        break;
      case ParcelStatus.received:
      case ParcelStatus.atStation:
      case ParcelStatus.offloaded:
        progress = 0.45;
        break;
      case ParcelStatus.canceled:
        progress = 0.0;
        break;
    }

    final trackingNum = (parcel.trackingNumber != null && parcel.trackingNumber!.isNotEmpty)
        ? parcel.trackingNumber!
        : '#${parcel.id.toUpperCase().substring(0, parcel.id.length.clamp(0, 8))}';

    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: AppTheme.surface,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: AppTheme.border,
            width: 1.5,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.04),
              blurRadius: 16,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          children: [
            // ── Header: Icon, Parcel Info, Status Badge ──
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 18, 20, 0),
              child: Row(
                children: [
                  Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: bgColor,
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
                          parcel.parcelType.isEmpty ? parcel.serviceType : parcel.parcelType,
                          style: GoogleFonts.outfit(
                            fontSize: 16,
                            fontWeight: FontWeight.w800,
                            color: AppTheme.textPrimary,
                          ),
                        ),
                        const Gap(2),
                        Text(
                          trackingNum,
                          style: GoogleFonts.inter(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: AppTheme.textMuted,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                      color: bgColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      _statusLabel(parcel.status),
                      style: GoogleFonts.inter(
                        fontSize: 11,
                        fontWeight: FontWeight.w700,
                        color: fgColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // ── Route Visualizer ──
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Origin',
                              style: GoogleFonts.inter(
                                fontSize: 11,
                                fontWeight: FontWeight.w600,
                                color: AppTheme.textMuted,
                              ),
                            ),
                            const Gap(4),
                            Text(
                              _short(parcel.fromAddress),
                              style: GoogleFonts.outfit(
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                                color: AppTheme.textPrimary,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                      const Gap(16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              'Destination',
                              style: GoogleFonts.inter(
                                fontSize: 11,
                                fontWeight: FontWeight.w600,
                                color: AppTheme.textMuted,
                              ),
                            ),
                            const Gap(4),
                            Text(
                              _short(parcel.toAddress),
                              style: GoogleFonts.outfit(
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                                color: AppTheme.textPrimary,
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
                  const Gap(16),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        height: 4,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: AppTheme.border,
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: FractionallySizedBox(
                          widthFactor: progress,
                          child: Container(
                            height: 4,
                            decoration: BoxDecoration(
                              color: parcel.status == ParcelStatus.canceled ? const Color(0xFFE11D48) : const Color(0xFF3B82F6),
                              borderRadius: BorderRadius.circular(2),
                            ),
                          ),
                        ),
                      ),
                      if (parcel.status != ParcelStatus.canceled)
                        Align(
                          alignment: Alignment(progress * 2 - 1, 0),
                          child: Container(
                            padding: const EdgeInsets.all(6),
                            decoration: BoxDecoration(
                              color: const Color(0xFF3B82F6),
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: const Color(0xFF3B82F6).withValues(alpha: 0.3),
                                  blurRadius: 6,
                                  spreadRadius: 1,
                                ),
                              ],
                            ),
                            child: const HugeIcon(
                              icon: HugeIcons.strokeRoundedSpeedTrain02,
                              color: Colors.white,
                              size: 12,
                            ),
                          ),
                        )
                      else
                        Align(
                          alignment: const Alignment(-1.0, 0),
                          child: Container(
                            padding: const EdgeInsets.all(5),
                            decoration: const BoxDecoration(
                              color: Color(0xFFE11D48),
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.close_rounded,
                              color: Colors.white,
                              size: 10,
                            ),
                          ),
                        ),
                    ],
                  ),
                  const Gap(14),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        intl.DateFormat('d MMM · HH:mm').format(parcel.createdAt),
                        style: GoogleFonts.inter(
                          fontSize: 11,
                          fontWeight: FontWeight.w500,
                          color: AppTheme.textMuted,
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          if (parcel.receiverPays) ...[
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                              decoration: BoxDecoration(
                                color: const Color(0xFFFFFBEB),
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
                            const Gap(8),
                          ],
                          if (parcel.amount != null)
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                              decoration: BoxDecoration(
                                color: const Color(0xFFF1F5F9),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                'TZS ${intl.NumberFormat('#,###').format(parcel.amount!.toInt())}',
                                style: GoogleFonts.outfit(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                  color: AppTheme.textPrimary,
                                ),
                              ),
                            ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // ── Sender & Receiver Info Row ──
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 12, 20, 0),
              child: Row(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        const Icon(
                          Icons.arrow_upward_rounded,
                          size: 13,
                          color: Color(0xFF10B981),
                        ),
                        const Gap(4),
                        Expanded(
                          child: Text(
                            'From: ${parcel.senderName ?? "Sender"}',
                            style: GoogleFonts.inter(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: AppTheme.textSecondary,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Gap(12),
                  Icon(
                    Icons.arrow_right_alt_rounded,
                    size: 14,
                    color: Colors.grey.shade400,
                  ),
                  const Gap(12),
                  Expanded(
                    child: Row(
                      children: [
                        const Icon(
                          Icons.arrow_downward_rounded,
                          size: 13,
                          color: Color(0xFF3B82F6),
                        ),
                        const Gap(4),
                        Expanded(
                          child: Text(
                            'To: ${parcel.receiverName}',
                            style: GoogleFonts.inter(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: AppTheme.textSecondary,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // ── Divider ──
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 12, 20, 0),
              child: Container(
                height: 1,
                color: AppTheme.border,
              ),
            ),

            // ── Footer: Agent Responsible & View Details ──
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 12, 20, 18),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: theme.primaryColor.withValues(alpha: 0.08),
                      shape: BoxShape.circle,
                    ),
                    child: HugeIcon(
                      icon: HugeIcons.strokeRoundedUser,
                      color: theme.primaryColor,
                      size: 12,
                    ),
                  ),
                  const Gap(8),
                  Text(
                    'Agent: ',
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: AppTheme.textMuted,
                    ),
                  ),
                  Text(
                    parcel.additionalServices?['agentName'] ?? 'Milton Juma',
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: AppTheme.textSecondary,
                    ),
                  ),
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
                  const HugeIcon(
                    icon: HugeIcons.strokeRoundedArrowRight01,
                    size: 16,
                    color: Color(0xFF3B82F6),
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

// ─── Booking Detail Screen ────────────────────────────────────────────────────

class BookingDetailScreen extends StatefulWidget {
  final ParcelModel parcel;
  const BookingDetailScreen({super.key, required this.parcel});

  @override
  State<BookingDetailScreen> createState() => _BookingDetailScreenState();
}

class _BookingDetailScreenState extends State<BookingDetailScreen> {
  ParcelModel? _parcel;
  bool _isLoading = false;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _fetchFullParcel();
  }

  Future<void> _fetchFullParcel() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });
    try {
      final json = await ApiService.getParcelById(widget.parcel.id);
      if (mounted) {
        setState(() {
          _parcel = ParcelModel.fromJson(json);
          _isLoading = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _errorMessage = e.toString();
          _isLoading = false;
        });
      }
    }
  }

  ParcelModel get _currentParcel => _parcel ?? widget.parcel;

  bool get _canCancel {
    return _currentParcel.status == ParcelStatus.received;
  }

  Future<void> _cancelBooking() async {
    final reasonController = TextEditingController();
    final shouldCancel = await showDialog<bool>(
      context: context,
      builder: (context) {
        final theme = Theme.of(context);
        return AlertDialog(
          backgroundColor: theme.colorScheme.surface,
          title: Text(
            'Cancel Booking',
            style: GoogleFonts.outfit(fontWeight: FontWeight.bold),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Are you sure you want to cancel this booking?',
                style: GoogleFonts.inter(color: theme.textTheme.bodyMedium?.color),
              ),
              const Gap(16),
              TextField(
                controller: reasonController,
                decoration: InputDecoration(
                  labelText: 'Reason for cancellation',
                  labelStyle: GoogleFonts.inter(fontSize: 13),
                  alignLabelWithHint: true,
                  border: const OutlineInputBorder(),
                ),
                maxLines: 3,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: Text(
                'Go Back',
                style: GoogleFonts.inter(color: theme.textTheme.bodySmall?.color),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: theme.colorScheme.error,
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              ),
              onPressed: () => Navigator.pop(context, true),
              child: Text(
                'Confirm Cancel',
                style: GoogleFonts.inter(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        );
      },
    );

    if (shouldCancel == true) {
      if (reasonController.text.trim().isEmpty) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Cancellation reason is required'),
              backgroundColor: Colors.red,
            ),
          );
        }
        return;
      }

      setState(() => _isLoading = true);
      try {
        await ApiService.updateParcelStatus(
          widget.parcel.id,
          'Canceled',
          location: 'Canceled by user. Reason: ${reasonController.text.trim()}',
        );
        await _fetchFullParcel();
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Booking canceled successfully ✓'),
              backgroundColor: Color(0xFF10B981),
            ),
          );
        }
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Failed to cancel booking: $e'),
              backgroundColor: Colors.red,
            ),
          );
        }
      } finally {
        if (mounted) {
          setState(() => _isLoading = false);
        }
      }
    }
  }

  Future<void> _generateAndSharePdf(BuildContext context) async {
    final parcel = _currentParcel;
    final pdfBytes = await ReceiptPdfGenerator.generate(
      trackingId: parcel.trackingNumber ?? parcel.id,
      fromAddress: parcel.fromAddress,
      toAddress: parcel.toAddress,
      serviceType: parcel.serviceType,
      parcelSize: parcel.parcelSize,
      parcelType: parcel.parcelType,
      senderName: parcel.senderName ?? 'N/A',
      senderPhone: parcel.senderPhone ?? 'N/A',
      receiverName: parcel.receiverName,
      receiverPhone: parcel.receiverPhone,
      price: parcel.amount ?? 0.0,
      receiverPays: parcel.receiverPays,
      status: parcel.status.displayLabel,
      createdAt: parcel.createdAt,
    );

    await Printing.sharePdf(
      bytes: pdfBytes,
      filename: 'mizigo_receipt_${parcel.id}.pdf',
    );
  }

  void _shareBooking(BuildContext context) {
    final parcel = _currentParcel;
    final msg = '''
📦 Mizigo Booking Confirmation
━━━━━━━━━━━━━━━━━━━━
Order: #${parcel.id.toUpperCase().substring(0, parcel.id.length.clamp(0, 8))}
Type: ${parcel.parcelType.isEmpty ? parcel.serviceType : parcel.parcelType}
From: ${parcel.fromAddress}
To: ${parcel.toAddress}
Receiver: ${parcel.receiverName} (${parcel.receiverPhone})
Payment: ${parcel.receiverPays ? 'Handled by Receiver' : 'Paid by Sender'}
Status: ${parcel.status.displayLabel}
Date: ${intl.DateFormat('d MMM yyyy').format(parcel.createdAt)}
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

  String _formatDateTime(DateTime dt) {
    final hourStr = dt.hour.toString().padLeft(2, '0');
    final minStr = dt.minute.toString().padLeft(2, '0');
    final monthStr = _monthAbbr(dt.month);
    final dayStr = dt.day.toString();
    return '$dayStr $monthStr · $hourStr:$minStr';
  }

  String _monthAbbr(int m) {
    return switch (m) {
      1 => 'Jan',
      2 => 'Feb',
      3 => 'Mar',
      4 => 'Apr',
      5 => 'May',
      6 => 'Jun',
      7 => 'Jul',
      8 => 'Aug',
      9 => 'Sep',
      10 => 'Oct',
      11 => 'Nov',
      12 => 'Dec',
      _ => '',
    };
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final parcel = _currentParcel;
    
    final trackingNum = (parcel.trackingNumber != null && parcel.trackingNumber!.isNotEmpty)
        ? parcel.trackingNumber!
        : '#${parcel.id.toUpperCase().substring(0, parcel.id.length.clamp(0, 8))}';

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            // ── Header ──────────────────────────────────────────
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.of(context).pop(),
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: theme.cardTheme.color ?? AppTheme.surface,
                        shape: BoxShape.circle,
                        border: Border.all(color: theme.dividerColor, width: 1.5),
                      ),
                      child: Center(
                        child: HugeIcon(
                          icon: HugeIcons.strokeRoundedArrowLeft01,
                          size: 20,
                          color: theme.iconTheme.color,
                        ),
                      ),
                    ),
                  ),
                  const Gap(16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Booking Details',
                          style: GoogleFonts.outfit(
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                            color: theme.textTheme.headlineSmall?.color,
                          ),
                        ),
                        Text(
                          trackingNum,
                          style: GoogleFonts.inter(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: theme.textTheme.bodyMedium?.color?.withValues(alpha: 0.6),
                          ),
                        ),
                      ],
                    ),
                  ),
                  _StatusBadge(status: parcel.status),
                ],
              ),
            ),

            if (_errorMessage != null)
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.error.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.error_outline_rounded, color: theme.colorScheme.error, size: 16),
                      const Gap(8),
                      Expanded(
                        child: Text(
                          'Failed to sync: $_errorMessage',
                          style: GoogleFonts.inter(color: theme.colorScheme.error, fontSize: 11),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

            const Gap(20),

            Expanded(
              child: _isLoading && _parcel == null
                  ? const Center(child: CircularProgressIndicator())
                  : SingleChildScrollView(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // ── Route Visualizer Card ──
                          _RouteCard(
                            from: parcel.fromAddress,
                            to: parcel.toAddress,
                            status: parcel.status,
                          ),

                          const Gap(20),

                          // ── Details Card ──
                          Container(
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color: theme.cardTheme.color ?? AppTheme.surface,
                              borderRadius: BorderRadius.circular(24),
                              border: Border.all(color: theme.dividerColor, width: 1.5),
                              boxShadow: [
                                BoxShadow(
                                  color: theme.shadowColor.withValues(alpha: 0.04),
                                  blurRadius: 24,
                                  offset: const Offset(0, 8),
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    const HugeIcon(
                                      icon: HugeIcons.strokeRoundedPackage,
                                      color: Colors.grey,
                                      size: 18,
                                    ),
                                    const Gap(8),
                                    Text(
                                      'Shipment Information',
                                      style: GoogleFonts.outfit(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: theme.textTheme.titleMedium?.color,
                                      ),
                                    ),
                                  ],
                                ),
                                const Gap(16),
                                GridView.count(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  crossAxisCount: 2,
                                  childAspectRatio: 2.2,
                                  crossAxisSpacing: 12,
                                  mainAxisSpacing: 12,
                                  children: [
                                    _DetailItem(
                                      icon: HugeIcons.strokeRoundedPackage,
                                      label: 'Parcel Type',
                                      value: parcel.parcelType.isEmpty ? 'General' : parcel.parcelType,
                                    ),
                                    _DetailItem(
                                      icon: HugeIcons.strokeRoundedWeightScale,
                                      label: 'Package Size',
                                      value: parcel.parcelSize.isEmpty ? 'Medium' : parcel.parcelSize,
                                    ),
                                    _DetailItem(
                                      icon: HugeIcons.strokeRoundedDeliveryTruck02,
                                      label: 'Service',
                                      value: parcel.serviceType.isEmpty ? 'Standard' : parcel.serviceType,
                                    ),
                                    _DetailItem(
                                      icon: HugeIcons.strokeRoundedLocation01,
                                      label: 'Pickup Type',
                                      value: parcel.pickupType,
                                    ),
                                    _DetailItem(
                                      icon: HugeIcons.strokeRoundedUser,
                                      label: 'Receiver',
                                      value: parcel.receiverName,
                                    ),
                                    _DetailItem(
                                      icon: HugeIcons.strokeRoundedCreditCard,
                                      label: 'Price',
                                      value: parcel.amount != null
                                          ? 'TSh ${intl.NumberFormat('#,###').format(parcel.amount)}'
                                          : 'N/A',
                                    ),
                                  ],
                                ),
                                const Gap(16),
                                Divider(color: theme.dividerColor, height: 1, thickness: 1.0),
                                const Gap(16),
                                _DetailItemFull(
                                  icon: HugeIcons.strokeRoundedQrCode,
                                  label: 'Parcel Number',
                                  value: trackingNum,
                                  onCopy: () {
                                    Clipboard.setData(ClipboardData(text: trackingNum));
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text('Parcel Number copied!', style: GoogleFonts.inter(fontWeight: FontWeight.w600)),
                                        backgroundColor: const Color(0xFF10B981),
                                        duration: const Duration(seconds: 2),
                                        behavior: SnackBarBehavior.floating,
                                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                                      ),
                                    );
                                  },
                                ),
                                const Gap(12),
                                _DetailItemFull(
                                  icon: HugeIcons.strokeRoundedLocation01,
                                  label: 'Origin Location',
                                  value: parcel.fromAddress,
                                ),
                                const Gap(12),
                                _DetailItemFull(
                                  icon: HugeIcons.strokeRoundedLocation02,
                                  label: 'Destination Location',
                                  value: parcel.toAddress,
                                ),
                              ],
                            ),
                          ),

                          const Gap(20),

                          // ── Agent Responsible Card ──
                          _AgentChip(
                            name: parcel.additionalServices?['agentName'] ?? 'Milton Juma',
                            phone: parcel.additionalServices?['agentPhone'] ?? '+255 754 123 456',
                          ),

                          const Gap(20),

                          // ── Timeline Card ──
                          Container(
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color: theme.cardTheme.color ?? AppTheme.surface,
                              borderRadius: BorderRadius.circular(24),
                              border: Border.all(color: theme.dividerColor, width: 1.5),
                              boxShadow: [
                                BoxShadow(
                                  color: theme.shadowColor.withValues(alpha: 0.04),
                                  blurRadius: 24,
                                  offset: const Offset(0, 8),
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Timeline',
                                  style: GoogleFonts.outfit(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: theme.textTheme.titleLarge?.color,
                                  ),
                                ),
                                const Gap(16),
                                _TimelineItem(
                                  label: 'Booked',
                                  date: _formatDateTime(parcel.createdAt),
                                  isDone: true,
                                  isActive: parcel.status == ParcelStatus.received,
                                  icon: HugeIcons.strokeRoundedCalendar01,
                                ),
                                _TimelineItem(
                                  label: 'Received at Station',
                                  date: parcel.status != ParcelStatus.received && parcel.status != ParcelStatus.canceled
                                      ? _formatDateTime(parcel.updatedAt)
                                      : 'Pending',
                                  isDone: parcel.status != ParcelStatus.received && parcel.status != ParcelStatus.canceled,
                                  isActive: parcel.status == ParcelStatus.atStation || parcel.status == ParcelStatus.offloaded,
                                  icon: HugeIcons.strokeRoundedWarehouse,
                                ),
                                _TimelineItem(
                                  label: 'In Transit',
                                  date: parcel.status == ParcelStatus.inTransit || parcel.status == ParcelStatus.delivered
                                      ? _formatDateTime(parcel.updatedAt)
                                      : 'Pending',
                                  isDone: parcel.status == ParcelStatus.delivered,
                                  isActive: parcel.status == ParcelStatus.inTransit,
                                  icon: HugeIcons.strokeRoundedSpeedTrain02,
                                ),
                                _TimelineItem(
                                  label: parcel.status == ParcelStatus.canceled ? 'Canceled' : 'Delivered',
                                  date: parcel.status == ParcelStatus.delivered || parcel.status == ParcelStatus.canceled
                                      ? _formatDateTime(parcel.updatedAt)
                                      : 'Pending',
                                  isDone: parcel.status == ParcelStatus.delivered || parcel.status == ParcelStatus.canceled,
                                  isActive: parcel.status == ParcelStatus.delivered || parcel.status == ParcelStatus.canceled,
                                  isLast: true,
                                  icon: parcel.status == ParcelStatus.canceled
                                      ? HugeIcons.strokeRoundedCancelCircle
                                      : HugeIcons.strokeRoundedHome01,
                                  isFailed: parcel.status == ParcelStatus.canceled,
                                ),
                              ],
                            ),
                          ),

                          const Gap(32),
                        ],
                      ),
                    ),
            ),
            
            // ── Bottom Action CTAs ──
            Container(
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
              decoration: BoxDecoration(
                color: theme.cardTheme.color ?? AppTheme.surface,
                border: Border(top: BorderSide(color: theme.dividerColor, width: 1.5)),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: theme.colorScheme.primary,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            elevation: 0,
                          ),
                          onPressed: () => _generateAndSharePdf(context),
                          icon: const HugeIcon(icon: HugeIcons.strokeRoundedPrinter, color: Colors.white, size: 20),
                          label: Text(
                            'Print Receipt',
                            style: GoogleFonts.inter(fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      const Gap(12),
                      Expanded(
                        child: OutlinedButton.icon(
                          style: OutlinedButton.styleFrom(
                            foregroundColor: theme.textTheme.bodyLarge?.color,
                            side: BorderSide(color: theme.dividerColor, width: 1.5),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                            padding: const EdgeInsets.symmetric(vertical: 16),
                          ),
                          onPressed: () => _shareBooking(context),
                          icon: HugeIcon(icon: HugeIcons.strokeRoundedUser, color: theme.iconTheme.color ?? Colors.grey, size: 20),
                          label: Text(
                            'Share Info',
                            style: GoogleFonts.inter(fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                  if (_canCancel) ...[
                    const Gap(12),
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton.icon(
                        style: OutlinedButton.styleFrom(
                          foregroundColor: theme.colorScheme.error,
                          side: BorderSide(color: theme.colorScheme.error, width: 1.5),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                          padding: const EdgeInsets.symmetric(vertical: 16),
                        ),
                        onPressed: _cancelBooking,
                        icon: HugeIcon(icon: HugeIcons.strokeRoundedCancelCircle, color: theme.colorScheme.error, size: 20),
                        label: Text(
                          'Cancel Booking',
                          style: GoogleFonts.inter(fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ─── Status Badge Widget ───

class _StatusBadge extends StatelessWidget {
  final ParcelStatus status;
  const _StatusBadge({required this.status});

  @override
  Widget build(BuildContext context) {
    final fg = _statusFg(status);
    final bg = _statusBg(status);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        status.displayLabel.toUpperCase(),
        style: GoogleFonts.inter(
          fontSize: 10,
          fontWeight: FontWeight.bold,
          color: fg,
          letterSpacing: 0.5,
        ),
      ),
    );
  }
}

// ─── Route Visualizer Card Widget ───

class _RouteCard extends StatelessWidget {
  final String from;
  final String to;
  final ParcelStatus status;

  const _RouteCard({
    required this.from,
    required this.to,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    double progress = 0.2;
    switch (status) {
      case ParcelStatus.delivered:
        progress = 1.0;
        break;
      case ParcelStatus.inTransit:
      case ParcelStatus.dispatched:
        progress = 0.75;
        break;
      case ParcelStatus.received:
      case ParcelStatus.atStation:
      case ParcelStatus.offloaded:
        progress = 0.45;
        break;
      case ParcelStatus.canceled:
        progress = 0.0;
        break;
    }

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: theme.cardTheme.color ?? AppTheme.surface,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: theme.dividerColor, width: 1.5),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 16,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Origin',
                      style: GoogleFonts.inter(
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                        color: AppTheme.textMuted,
                      ),
                    ),
                    const Gap(4),
                    Text(
                      from.split(',').first.trim(),
                      style: GoogleFonts.outfit(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: theme.textTheme.bodyLarge?.color,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'Destination',
                      style: GoogleFonts.inter(
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                        color: AppTheme.textMuted,
                      ),
                    ),
                    const Gap(4),
                    Text(
                      to.split(',').first.trim(),
                      style: GoogleFonts.outfit(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: theme.textTheme.bodyLarge?.color,
                      ),
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.end,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Gap(24),
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                height: 4,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: theme.dividerColor,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: FractionallySizedBox(
                  widthFactor: progress,
                  child: Container(
                    height: 4,
                    decoration: BoxDecoration(
                      color: status == ParcelStatus.canceled ? const Color(0xFFE11D48) : theme.colorScheme.primary,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ),
              ),
              if (status != ParcelStatus.canceled)
                AnimatedAlign(
                  alignment: Alignment(progress * 2 - 1, 0),
                  duration: const Duration(milliseconds: 800),
                  curve: Curves.easeOutBack,
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: theme.colorScheme.primary,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: theme.colorScheme.primary.withValues(alpha: 0.3),
                          blurRadius: 8,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    child: const HugeIcon(
                      icon: HugeIcons.strokeRoundedSpeedTrain02,
                      color: Colors.white,
                      size: 16,
                    ),
                  ),
                )
              else
                Align(
                  alignment: const Alignment(-1.0, 0),
                  child: Container(
                    padding: const EdgeInsets.all(6),
                    decoration: const BoxDecoration(
                      color: Color(0xFFE11D48),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.close_rounded,
                      color: Colors.white,
                      size: 14,
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}

// ─── Detail Grid Item Widget ───

class _DetailItem extends StatelessWidget {
  final dynamic icon;
  final String label;
  final String value;

  const _DetailItem({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: theme.scaffoldBackgroundColor.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: theme.dividerColor, width: 1.0),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: theme.colorScheme.primary.withValues(alpha: 0.08),
              borderRadius: BorderRadius.circular(12),
            ),
            child: HugeIcon(
              icon: icon,
              color: theme.colorScheme.primary,
              size: 18,
            ),
          ),
          const Gap(10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  label,
                  style: GoogleFonts.inter(
                    fontSize: 10,
                    color: AppTheme.textMuted,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Gap(2),
                Text(
                  value,
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: theme.textTheme.bodyLarge?.color,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ─── Detail Grid Item Full Widget ───

class _DetailItemFull extends StatelessWidget {
  final dynamic icon;
  final String label;
  final String value;
  final VoidCallback? onCopy;

  const _DetailItemFull({
    required this.icon,
    required this.label,
    required this.value,
    this.onCopy,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: theme.scaffoldBackgroundColor.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: theme.dividerColor, width: 1.0),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: theme.colorScheme.primary.withValues(alpha: 0.08),
              borderRadius: BorderRadius.circular(12),
            ),
            child: HugeIcon(
              icon: icon,
              color: theme.colorScheme.primary,
              size: 18,
            ),
          ),
          const Gap(10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  label,
                  style: GoogleFonts.inter(
                    fontSize: 10,
                    color: AppTheme.textMuted,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Gap(2),
                Text(
                  value,
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: theme.textTheme.bodyLarge?.color,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          if (onCopy != null) ...[
            const Gap(10),
            IconButton(
              icon: Icon(
                Icons.copy_rounded,
                size: 16,
                color: theme.colorScheme.primary,
              ),
              onPressed: onCopy,
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
            ),
          ],
        ],
      ),
    );
  }
}

// ─── Timeline Item Widget ───

class _TimelineItem extends StatelessWidget {
  final String label;
  final String date;
  final bool isDone;
  final bool isActive;
  final bool isLast;
  final dynamic icon;
  final bool isFailed;

  const _TimelineItem({
    required this.label,
    required this.date,
    required this.isDone,
    required this.isActive,
    required this.icon,
    this.isLast = false,
    this.isFailed = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    Color circleColor;
    Color iconColor;
    
    if (isFailed) {
      circleColor = const Color(0xFFEF4444);
      iconColor = Colors.white;
    } else if (isActive) {
      circleColor = theme.colorScheme.primary;
      iconColor = Colors.white;
    } else if (isDone) {
      circleColor = theme.colorScheme.primary.withValues(alpha: 0.15);
      iconColor = theme.colorScheme.primary;
    } else {
      circleColor = theme.dividerColor;
      iconColor = theme.textTheme.bodySmall?.color ?? Colors.grey;
    }

    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 40,
            child: Column(
              children: [
                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: circleColor,
                    border: isActive && !isFailed
                        ? Border.all(color: theme.colorScheme.primary.withValues(alpha: 0.3), width: 3)
                        : null,
                  ),
                  child: Center(
                    child: HugeIcon(
                      icon: icon,
                      size: 16,
                      color: iconColor,
                    ),
                  ),
                ),
                if (!isLast)
                  Expanded(
                    child: Container(
                      width: 2,
                      margin: const EdgeInsets.symmetric(vertical: 4),
                      decoration: BoxDecoration(
                        color: isDone && !isFailed
                            ? theme.colorScheme.primary.withValues(alpha: 0.3)
                            : theme.dividerColor,
                        borderRadius: BorderRadius.circular(1),
                      ),
                    ),
                  ),
              ],
            ),
          ),
          const Gap(16),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          label,
                          style: GoogleFonts.inter(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                            color: isActive
                                ? theme.colorScheme.primary
                                : isFailed
                                    ? const Color(0xFFEF4444)
                                    : theme.textTheme.titleMedium?.color,
                          ),
                        ),
                      ),
                      const Gap(8),
                      Text(
                        date,
                        style: GoogleFonts.inter(
                          fontSize: 12,
                          color: theme.textTheme.bodySmall?.color ?? const Color(0xFF94A3B8),
                        ),
                      ),
                    ],
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

// ─── Agent Chip Widget ───

class _AgentChip extends StatelessWidget {
  final String name;
  final String phone;
  const _AgentChip({required this.name, required this.phone});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: theme.cardTheme.color ?? AppTheme.surface,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: theme.dividerColor),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: const Color(0xFFCBD5E1),
              border: Border.all(color: Colors.white, width: 2),
            ),
            child: const Center(
              child: HugeIcon(
                icon: HugeIcons.strokeRoundedUser,
                color: Color(0xFF64748B),
                size: 20,
              ),
            ),
          ),
          const Gap(10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  name,
                  style: GoogleFonts.inter(
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    color: theme.textTheme.titleSmall?.color,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  'Responsible Agent',
                  style: GoogleFonts.inter(
                    fontSize: 11,
                    color: const Color(0xFF64748B),
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {},
            child: Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: theme.dividerColor),
                color: theme.cardTheme.color,
              ),
              child: Center(
                child: HugeIcon(
                  icon: HugeIcons.strokeRoundedCall02,
                  size: 16,
                  color: theme.iconTheme.color?.withValues(alpha: 0.7),
                ),
              ),
            ),
          ),
          const Gap(8),
          GestureDetector(
            onTap: () {},
            child: Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: theme.dividerColor),
                color: theme.cardTheme.color,
              ),
              child: Center(
                child: HugeIcon(
                  icon: HugeIcons.strokeRoundedChatting01,
                  size: 16,
                  color: theme.iconTheme.color?.withValues(alpha: 0.7),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

