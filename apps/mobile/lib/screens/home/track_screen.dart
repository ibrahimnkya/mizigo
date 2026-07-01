import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gap/gap.dart';
import 'package:hugeicons/hugeicons.dart';
import '../../widgets/home/premium_ui_components.dart';
import '../../services/api_service.dart';
import '../../models/parcel_model.dart';
import '../../widgets/common/shimmer_utils.dart';
import '../../models/operation_model.dart';


// ─── Mock Data ────────────────────────────────────────────────────────────────

class ShipmentData {
  final String id;
  final String trackingId;
  final String status;
  final String statusLabel;
  final String eta;
  final String from;
  final String to;
  final String size;
  final String weight;
  final String insurance;
  final String receiverName;
  final String service;
  final String condition;
  final String urgency;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String rawStatus;

  const ShipmentData({
    required this.id,
    required this.trackingId,
    required this.status,
    required this.statusLabel,
    required this.eta,
    required this.from,
    required this.to,
    required this.size,
    required this.weight,
    required this.insurance,
    required this.receiverName,
    required this.service,
    this.condition = '',
    this.urgency = '',
    this.createdAt,
    this.updatedAt,
    this.rawStatus = 'received',
  });

  factory ShipmentData.fromParcel(ParcelModel p) {
    String statusKey;
    switch (p.status) {
      case ParcelStatus.inTransit:
      case ParcelStatus.dispatched:
      case ParcelStatus.offloaded:
      case ParcelStatus.atStation:
        statusKey = 'in_transit';
      case ParcelStatus.delivered:
        statusKey = 'delivered';
      case ParcelStatus.canceled:
        statusKey = 'canceled';
      case ParcelStatus.received:
        statusKey = 'received';
    }

    String insuranceVal = 'Standard';
    if (p.additionalServices != null && p.additionalServices!['insurance'] == true) {
      insuranceVal = 'Premium';
    }

    final hourStr = p.createdAt.hour.toString().padLeft(2, '0');
    final minStr = p.createdAt.minute.toString().padLeft(2, '0');
    final monthStr = _monthAbbr(p.createdAt.month);
    final dayStr = p.createdAt.day.toString();
    
    return ShipmentData(
      id: p.id,
      trackingId: p.trackingNumber ?? p.id,
      status: statusKey,
      statusLabel: p.status.displayLabel,
      eta: 'Booked on $dayStr $monthStr · $hourStr:$minStr',
      from: p.fromAddress,
      to: p.toAddress,
      size: p.parcelSize.isNotEmpty ? p.parcelSize : 'Standard',
      weight: p.peopleNeeded > 0 ? 'Heavy (>10kg)' : 'Standard (<10kg)',
      insurance: insuranceVal,
      receiverName: p.receiverName,
      service: p.serviceType.isNotEmpty ? p.serviceType : 'Standard',
      condition: p.condition,
      urgency: p.urgency,
      createdAt: p.createdAt,
      updatedAt: p.updatedAt,
      rawStatus: p.status.name,
    );
  }

  static String _monthAbbr(int m) {
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
}

final List<ShipmentData> mockShipments = [
  const ShipmentData(
    id: '1',
    trackingId: 'MZX147856',
    status: 'in_transit',
    statusLabel: 'In Transit',
    eta: 'ETA 11:47 AM',
    from: 'Posta, Dar es Salaam',
    to: 'Sokoine road, Arusha',
    size: 'Small Box Appr (30 x 30 x30)cm',
    weight: 'Less than 1kg',
    insurance: 'Premium',
    receiverName: 'Jacob Ibrahim',
    service: 'Express',
  ),
  const ShipmentData(
    id: '2',
    trackingId: 'MZX147856',
    status: 'booked',
    statusLabel: 'Booked',
    eta: '9:25 AM',
    from: 'Posta, Dar es Salaam',
    to: 'Sokoine road, Arusha',
    size: 'Small Box Appr (30 x 30 x30)cm',
    weight: 'Less than 1kg',
    insurance: 'Standard',
    receiverName: 'Amina Saleh',
    service: 'Standard',
  ),
];

// ─── Status helpers ───────────────────────────────────────────────────────────

Color _statusBg(BuildContext context, String status) {
  final theme = Theme.of(context);
  final isCustomTheme = theme.colorScheme.primary.toARGB32() == 0xFF670E1E;
  final primaryColor = theme.colorScheme.primary;
  final secondaryColor = theme.colorScheme.secondary;

  return switch (status) {
    'in_transit' => isCustomTheme ? primaryColor.withValues(alpha: 0.1) : const Color(0xFFEFF6FF),
    'received'   => theme.brightness == Brightness.dark ? Colors.white.withValues(alpha: 0.08) : const Color(0xFFFFFBEB),
    'delivered'  => isCustomTheme ? secondaryColor.withValues(alpha: 0.1) : const Color(0xFFF0FDF4),
    'canceled'   => const Color(0xFFEF4444).withValues(alpha: 0.1),
    _            => theme.brightness == Brightness.dark ? Colors.white.withValues(alpha: 0.08) : const Color(0xFFF1F5F9),
  };
}

Color _statusFg(BuildContext context, String status) {
  final theme = Theme.of(context);
  final isCustomTheme = theme.colorScheme.primary.toARGB32() == 0xFF670E1E;
  final primaryColor = theme.colorScheme.primary;
  final secondaryColor = theme.colorScheme.secondary;

  return switch (status) {
    'in_transit' => isCustomTheme ? primaryColor : const Color(0xFF2563EB),
    'received'   => const Color(0xFFF59E0B),
    'delivered'  => isCustomTheme ? secondaryColor : const Color(0xFF16A34A),
    'canceled'   => const Color(0xFFEF4444),
    _            => theme.textTheme.bodyMedium?.color?.withValues(alpha: 0.7) ?? const Color(0xFF64748B),
  };
}


// ─── Track Screen ─────────────────────────────────────────────────────────────

class TrackScreen extends StatefulWidget {
  const TrackScreen({super.key});

  @override
  State<TrackScreen> createState() => _TrackScreenState();
}

class _TrackScreenState extends State<TrackScreen> {
  final _searchController = TextEditingController();
  List<ShipmentData> _shipments = [];
  bool _loading = false;
  bool _searching = false;
  String? _error;

  @override
  void initState() {
    super.initState();
    _fetchShipments();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Future<void> _fetchShipments() async {
    setState(() {
      _loading = true;
      _error = null;
    });

    try {
      final raw = await ApiService.getParcels();
      final List<ParcelModel> parcels = raw.map((j) => ParcelModel.fromJson(j)).toList();
      setState(() {
        _shipments = parcels.map((p) => ShipmentData.fromParcel(p)).toList();
      });
    } catch (e) {
      setState(() {
        _error = 'Failed to load parcels: ${e.toString()}';
      });
    } finally {
      setState(() {
        _loading = false;
      });
    }
  }

  Future<void> _search() async {
    final query = _searchController.text.trim();
    if (query.isEmpty) {
      _fetchShipments();
      return;
    }

    setState(() {
      _searching = true;
      _error = null;
    });

    try {
      final results = await ApiService.searchParcel(query);
      final List<ParcelModel> parcels = results.map((j) => ParcelModel.fromJson(j)).toList();
      setState(() {
        _shipments = parcels.map((p) => ShipmentData.fromParcel(p)).toList();
        if (_shipments.isEmpty) {
          _error = 'No parcels matching "$query" found.';
        }
      });
    } catch (e) {
      setState(() {
        _error = 'Search failed: ${e.toString()}';
      });
    } finally {
      setState(() {
        _searching = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: theme.appBarTheme.backgroundColor ?? theme.primaryColor,
        elevation: 0,
        scrolledUnderElevation: 0,
        surfaceTintColor: Colors.transparent,
        title: Text(
          'Track Parcel',
          style: GoogleFonts.outfit(
            fontSize: 28,
            fontWeight: FontWeight.w600,
            color: theme.appBarTheme.titleTextStyle?.color ?? Colors.white,
          ),
        ),
        centerTitle: false,
        automaticallyImplyLeading: false,
        toolbarHeight: 80,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 24),
            child: GestureDetector(
              onTap: () {},
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: theme.cardTheme.color,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(
                        alpha: theme.brightness == Brightness.dark ? 0.2 : 0.04,
                      ),
                      blurRadius: 20,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: const Center(
                  child: HugeIcon(
                    icon: HugeIcons.strokeRoundedInformationCircle,
                    size: 20,
                    color: Color(0xFF64748B),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          // ── Track Input ────────────────────────────────────────
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 8, 24, 16),
            child: TextField(
              controller: _searchController,
              onSubmitted: (_) => _search(),
              style: GoogleFonts.inter(
                color: theme.textTheme.bodyLarge?.color ?? Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
              decoration: InputDecoration(
                hintText: 'enter Parcel number',
                hintStyle: GoogleFonts.inter(
                  color: theme.textTheme.bodyMedium?.color?.withValues(alpha: 0.5) ?? const Color(0xFF64748B),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(color: theme.colorScheme.outline),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(color: theme.colorScheme.outline),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(color: theme.colorScheme.primary, width: 2),
                ),
                filled: true,
                fillColor: theme.cardTheme.color ?? theme.colorScheme.surface,
                prefixIcon: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: HugeIcon(
                    icon: HugeIcons.strokeRoundedSearch01,
                    color: theme.textTheme.bodySmall?.color ?? const Color(0xFF94A3B8),
                    size: 20,
                  ),
                ),
                suffixIcon: _searching
                    ? Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                            color: theme.colorScheme.primary,
                            strokeWidth: 2,
                          ),
                        ),
                      )
                    : Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          if (_searchController.text.isNotEmpty)
                            IconButton(
                              icon: Icon(Icons.clear, color: theme.textTheme.bodySmall?.color ?? const Color(0xFF64748B)),
                              onPressed: () {
                                _searchController.clear();
                                _search();
                              },
                            ),
                          IconButton(
                            onPressed: () async {
                              final code = await context.push<String>('/scanner', extra: ParcelOperation.view);
                              if (code != null) {
                                _searchController.text = code;
                                _search();
                              }
                            },
                            icon: HugeIcon(
                              icon: HugeIcons.strokeRoundedQrCode,
                              color: theme.colorScheme.primary,
                              size: 20,
                            ),
                          ),
                        ],
                      ),
                contentPadding: const EdgeInsets.symmetric(vertical: 16),
              ),
              onChanged: (val) {
                setState(() {});
              },
            ),
          ),
          // ── Shipment list ────────────────────────────────────
          Expanded(
            child: RefreshIndicator(
              onRefresh: _fetchShipments,
              color: const Color(0xFF3B82F6),
              child: _loading
                  ? ShimmerLoading(
                      isLoading: true,
                      child: const ListSkeleton(height: 150, padding: 24),
                    )
                  : _error != null
                      ? _buildErrorState()
                      : _shipments.isEmpty
                          ? _buildEmptyState()
                          : ListView.separated(
                              padding: const EdgeInsets.fromLTRB(24, 4, 24, 32),
                              itemCount: _shipments.length,
                              separatorBuilder: (_, _) => const Gap(16),
                              itemBuilder: (context, index) {
                                final s = _shipments[index];
                                return _ShipmentCard(
                                  shipment: s,
                                  onTap: () => context.push('/track/${s.id}', extra: s),
                                  onLiveTap: () =>
                                      context.push('/track/${s.id}/live', extra: s),
                                );
                              },
                            ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState() {
    return ListView(
      physics: const AlwaysScrollableScrollPhysics(),
      children: [
        const Gap(100),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const HugeIcon(
                icon: HugeIcons.strokeRoundedPackage02,
                color: Color(0xFF334155),
                size: 64,
              ),
              const Gap(16),
              Text(
                'No shipments tracked',
                style: GoogleFonts.outfit(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Theme.of(context).textTheme.titleLarge?.color,
                ),
              ),
              const Gap(8),
              Text(
                'Parcels registered in the system\nwill appear here.',
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(
                  fontSize: 14,
                  color: Theme.of(context).textTheme.bodySmall?.color,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildErrorState() {
    return ListView(
      physics: const AlwaysScrollableScrollPhysics(),
      children: [
        const Gap(100),
        Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const HugeIcon(
                  icon: HugeIcons.strokeRoundedAlertCircle,
                  color: Color(0xFFEF4444),
                  size: 64,
                ),
                const Gap(16),
                Text(
                  'Something went wrong',
                  style: GoogleFonts.outfit(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Theme.of(context).textTheme.titleLarge?.color,
                  ),
                ),
                const Gap(8),
                Text(
                  _error ?? 'An unexpected error occurred.',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    color: Theme.of(context).textTheme.bodySmall?.color,
                  ),
                ),
                const Gap(24),
                ElevatedButton(
                  onPressed: _fetchShipments,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF3B82F6),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    'Retry',
                    style: GoogleFonts.inter(fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

// ─── Shipment Card ────────────────────────────────────────────────────────────

class _ShipmentCard extends StatelessWidget {
  final ShipmentData shipment;
  final VoidCallback onTap;
  final VoidCallback onLiveTap;

  const _ShipmentCard({
    required this.shipment,
    required this.onTap,
    required this.onLiveTap,
  });

  Widget _row(BuildContext context, String label, String value) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              label,
              style: GoogleFonts.inter(
                fontSize: 13,
                color: const Color(0xFF94A3B8),
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              textAlign: TextAlign.right,
              style: GoogleFonts.inter(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: theme.textTheme.bodyLarge?.color,
              ),
              maxLines: 2,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final s = shipment;
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: theme.cardColor,
          borderRadius: BorderRadius.circular(22),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(
                alpha: theme.brightness == Brightness.dark ? 0.2 : 0.07,
              ),
              blurRadius: 24,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ── Card header ────────────────────────────────
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const ParcelIcon(),
                  const Gap(14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Parcel ',
                              style: GoogleFonts.outfit(
                                fontSize: 17,
                                fontWeight: FontWeight.w700,
                                color: theme.textTheme.titleLarge?.color,
                              ),
                            ),
                            const Gap(4),
                            const HugeIcon(
                              icon: HugeIcons.strokeRoundedFire,
                              color: Color(0xFFEF4444),
                              size: 16,
                            ),
                          ],
                        ),
                        Text(
                          s.trackingId,
                          style: GoogleFonts.inter(
                            fontSize: 13,
                            color: const Color(0xFF64748B),
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 5),
                        decoration: BoxDecoration(
                          color: _statusBg(context, s.status),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          s.statusLabel,
                          style: GoogleFonts.inter(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: _statusFg(context, s.status),
                          ),
                        ),
                      ),
                      const Gap(4),
                      Text(
                        s.eta,
                        style: GoogleFonts.inter(
                          fontSize: 12,
                          color: const Color(0xFF64748B),
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              const Gap(16),
              const DashedDivider(),
              const Gap(4),

              // ── Details ────────────────────────────────────
              _row(context, 'From', s.from),
              _row(context, 'To', s.to),
              _row(context, 'Size', s.size),
              _row(context, 'Weight', s.weight),
              _row(context, 'Insurance', s.insurance),
              _row(context, 'Receiver Name', s.receiverName),
              _row(context, 'Service', s.service),

              const Gap(4),
              const DashedDivider(),
              const Gap(16),

              // ── Action buttons ─────────────────────────────
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _ActionBtn(
                    icon: HugeIcons.strokeRoundedShare08,
                    onTap: () {},
                  ),
                  const Gap(16),
                  _ActionBtn(
                    icon: HugeIcons.strokeRoundedMapsLocation01,
                    onTap: onLiveTap,
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


// ─── Action Button ────────────────────────────────────────────────────────────

class _ActionBtn extends StatelessWidget {
  final dynamic icon;
  final VoidCallback onTap;
  const _ActionBtn({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 52,
        height: 52,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Theme.of(context).dividerColor, width: 1.5),
          color: Theme.of(context).cardTheme.color,
        ),
        child: Center(
          child: HugeIcon(icon: icon, size: 22, color: const Color(0xFF475569)),
        ),
      ),
    );
  }
}
