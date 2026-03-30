import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gap/gap.dart';
import 'package:hugeicons/hugeicons.dart';
import '../../widgets/home/premium_ui_components.dart';

// ─── Mock Data ────────────────────────────────────────────────────────────────

class ShipmentData {
  final String id;
  final String trackingId;
  final String status; // 'in_transit' | 'booked' | 'delivered'
  final String statusLabel;
  final String eta;
  final String from;
  final String to;
  final String size;
  final String weight;
  final String insurance;
  final String receiverName;
  final String service;

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
  });
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

Color _statusBg(String status) {
  return switch (status) {
    'in_transit' => const Color(0xFFEFF6FF),
    'booked'     => const Color(0xFFF1F5F9),
    'delivered'  => const Color(0xFFF0FDF4),
    _            => const Color(0xFFF1F5F9),
  };
}

Color _statusFg(String status) {
  return switch (status) {
    'in_transit' => const Color(0xFF2563EB),
    'booked'     => const Color(0xFF64748B),
    'delivered'  => const Color(0xFF16A34A),
    _            => const Color(0xFF64748B),
  };
}


// ─── Track Screen ─────────────────────────────────────────────────────────────

class TrackScreen extends StatelessWidget {
  const TrackScreen({super.key});

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
        title: Text(
          'Track Cargo',
          style: GoogleFonts.outfit(
            fontSize: 28,
            fontWeight: FontWeight.w600,
            color: theme.textTheme.headlineMedium?.color,
          ),
        ),
        centerTitle: false,
        automaticallyImplyLeading: false,
        toolbarHeight: 80,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 24),
            child: GestureDetector(
// ... (rest of the action button code)
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
              style: GoogleFonts.inter(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
              decoration: InputDecoration(
                hintText: 'Enter Tracking ID',
                hintStyle: GoogleFonts.inter(
                  color: const Color(0xFF64748B),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide.none,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.white.withValues(alpha: 0.05),
                prefixIcon: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: HugeIcon(
                    icon: HugeIcons.strokeRoundedSearch01,
                    color: Color(0xFF94A3B8),
                    size: 20,
                  ),
                ),
                suffixIcon: IconButton(
                  onPressed: () => context.push('/scanner/track'),
                  icon: const HugeIcon(
                    icon: HugeIcons.strokeRoundedQrCode,
                    color: Color(0xFF3B82F6),
                    size: 20,
                  ),
                ),
                contentPadding: const EdgeInsets.symmetric(vertical: 16),
              ),
            ),
          ),
          // ── Shipment list ────────────────────────────────────
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.fromLTRB(24, 4, 24, 32),
              itemCount: mockShipments.length,
              separatorBuilder: (_, _) => const Gap(16),
              itemBuilder: (context, index) {
                final s = mockShipments[index];
                return _ShipmentCard(
                  shipment: s,
                  onTap: () => context.push('/track/${s.id}', extra: s),
                  onLiveTap: () =>
                      context.push('/track/${s.id}/live', extra: s),
                );
              },
            ),
          ),
        ],
      ),
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
                          color: _statusBg(s.status),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          s.statusLabel,
                          style: GoogleFonts.inter(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: _statusFg(s.status),
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
