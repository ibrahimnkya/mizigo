import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gap/gap.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:printing/printing.dart';
import '../../services/api_service.dart';
import '../../models/parcel_model.dart';
import '../../utils/receipt_pdf_generator.dart';
import '../../theme/staff_palette.dart';
import '../../widgets/common/station_header_art.dart';
import '../../widgets/profile/premium_settings_components.dart';
import '../../widgets/staff/parcel_badges.dart';
import '../../widgets/staff/parcel_number_field.dart';
import '../../widgets/staff/parcel_search_suggestions.dart';
import '../../utils/parcel_search.dart';
import '../../widgets/staff/staff_settings.dart';
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
      case ParcelStatus.lost:
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

// ─── Track Screen ─────────────────────────────────────────────────────────────

class TrackScreen extends StatefulWidget {
  const TrackScreen({super.key});

  @override
  State<TrackScreen> createState() => _TrackScreenState();
}

class _TrackScreenState extends State<TrackScreen> {
  final _searchController = TextEditingController();
  final _searchFocus = FocusNode();
  List<ParcelModel> _allParcels = [];
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
    _searchFocus.dispose();
    super.dispose();
  }

  Future<void> _fetchShipments() async {
    setState(() {
      _loading = true;
      _error = null;
    });
    try {
      final raw = await ApiService.getParcels();
      final parcels = raw.map((j) => ParcelModel.fromJson(j)).toList();
      if (mounted) {
        setState(() {
          _allParcels = parcels;
          _shipments = parcels.map(ShipmentData.fromParcel).toList();
        });
      }
    } catch (e) {
      if (mounted) setState(() => _error = 'Couldn’t load parcels. Pull down to try again.');
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  Future<void> _search() async {
    final query = _searchController.text.trim();
    FocusScope.of(context).unfocus();
    if (query.isEmpty) {
      _fetchShipments();
      return;
    }
    // Smart search over the loaded list first; the server only if none match.
    final local = searchParcels(_allParcels, query);
    if (local.isNotEmpty) {
      setState(() {
        _error = null;
        _shipments = local.map(ShipmentData.fromParcel).toList();
      });
      return;
    }
    setState(() {
      _searching = true;
      _error = null;
    });
    try {
      final results = await ApiService.searchParcel(query);
      final parcels = results.map((j) => ParcelModel.fromJson(j)).toList();
      if (!mounted) return;
      setState(() {
        _shipments = parcels.map(ShipmentData.fromParcel).toList();
        if (_shipments.isEmpty) _error = 'No parcel matches “$query”.';
      });
    } catch (e) {
      if (mounted) setState(() => _error = 'Search failed. Check your connection and try again.');
    } finally {
      if (mounted) setState(() => _searching = false);
    }
  }

  Future<void> _scan() async {
    final code = await context.push<String>('/scanner', extra: ParcelOperation.view);
    if (code != null && mounted) {
      _searchController.text = code;
      _search();
    }
  }

  Future<void> _sharePdf(ShipmentData s) async {
    MizigoToasts.showSuccess(context, 'Preparing receipt…');
    try {
      final raw = await ApiService.getParcelById(s.id);
      final parcel = ParcelModel.fromJson(raw);
      final bytes = await ReceiptPdfGenerator.generate(
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
        price: (parcel.amount ?? 0).toDouble(),
        receiverPays: parcel.receiverPays,
        status: parcel.status.displayLabel,
        createdAt: parcel.createdAt,
      );
      await Printing.sharePdf(
        bytes: bytes,
        filename: 'mizigo_receipt_${(parcel.trackingNumber ?? parcel.id).toUpperCase()}.pdf',
      );
    } catch (e) {
      if (mounted) MizigoToasts.showError(context, 'Couldn’t generate the receipt');
    }
  }

  @override
  Widget build(BuildContext context) {
    final palette = StaffPalette.of(context);
    final topInset = MediaQuery.of(context).padding.top;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: palette.overlayStyle,
      child: Scaffold(
        backgroundColor: palette.background,
        body: Stack(
          children: [
            const StationHeaderArt(),
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(16, topInset + 20, 16, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Track Parcel',
                        style: GoogleFonts.outfit(fontSize: 24, fontWeight: FontWeight.w700, color: palette.fg()),
                      ),
                      const Gap(4),
                      Text(
                        'Search by parcel number or scan its QR code.',
                        style: GoogleFonts.outfit(fontSize: 15, color: palette.fg(0.65)),
                      ),
                      const Gap(16),
                      _SearchBar(
                        controller: _searchController,
                        focusNode: _searchFocus,
                        parcels: _allParcels,
                        onParcelSelected: (p) => context.push('/track/${p.id}', extra: ShipmentData.fromParcel(p)),
                        searching: _searching,
                        onSubmit: _search,
                        onScan: _scan,
                        onClear: () {
                          _searchController.clear();
                          _search();
                        },
                        onChanged: () => setState(() {}),
                      ),
                    ],
                  ),
                ),
                const Gap(12),
                Expanded(
                  child: RefreshIndicator(
                    onRefresh: _fetchShipments,
                    color: kStaffAccent,
                    backgroundColor: palette.navBackground,
                    child: _buildList(palette),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildList(StaffPalette palette) {
    if (_loading) {
      return ListView.separated(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
        itemCount: 3,
        separatorBuilder: (_, _) => const Gap(12),
        itemBuilder: (_, _) => Container(
          height: 190,
          decoration: BoxDecoration(color: palette.surface(0.08), borderRadius: BorderRadius.circular(24)),
        ),
      );
    }
    if (_error != null || _shipments.isEmpty) {
      return ListView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.fromLTRB(32, 60, 32, 24),
        children: [
          HugeIcon(
            icon: _error != null ? HugeIcons.strokeRoundedAlert02 : HugeIcons.strokeRoundedPackage,
            color: palette.fg(0.3),
            size: 52,
          ),
          const Gap(14),
          Text(
            _error != null ? 'Nothing to show' : 'No parcels yet',
            textAlign: TextAlign.center,
            style: GoogleFonts.outfit(fontSize: 18, fontWeight: FontWeight.w600, color: palette.fg()),
          ),
          const Gap(6),
          Text(
            _error ?? 'Parcels you send or handle will appear here.',
            textAlign: TextAlign.center,
            style: GoogleFonts.outfit(fontSize: 15, height: 1.4, color: palette.fg(0.6)),
          ),
          if (_error != null) ...[
            const Gap(20),
            Center(
              child: SizedBox(
                width: 180,
                child: StaffButton(
                  label: 'Try Again',
                  icon: HugeIcons.strokeRoundedRefresh,
                  onPressed: _fetchShipments,
                ),
              ),
            ),
          ],
        ],
      );
    }
    return ListView.separated(
      physics: const AlwaysScrollableScrollPhysics(),
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
      itemCount: _shipments.length,
      separatorBuilder: (_, _) => const Gap(12),
      itemBuilder: (context, i) {
        final s = _shipments[i];
        return _ShipmentCard(
          shipment: s,
          onTap: () => context.push('/track/${s.id}', extra: s),
          onLiveTap: () => context.push('/track/${s.id}/live', extra: s),
          onShare: () => _sharePdf(s),
        );
      },
    );
  }
}

class _SearchBar extends StatelessWidget {
  const _SearchBar({
    required this.controller,
    required this.focusNode,
    required this.parcels,
    required this.onParcelSelected,
    required this.searching,
    required this.onSubmit,
    required this.onScan,
    required this.onClear,
    required this.onChanged,
  });

  final TextEditingController controller;
  final FocusNode focusNode;
  final List<ParcelModel> parcels;
  final ValueChanged<ParcelModel> onParcelSelected;
  final bool searching;
  final VoidCallback onSubmit;
  final VoidCallback onScan;
  final VoidCallback onClear;
  final VoidCallback onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ParcelSearchSuggestions(
            controller: controller,
            focusNode: focusNode,
            onParcelSelected: onParcelSelected,
            fieldBuilder: (_) => ParcelNumberField(
              controller: controller,
              focusNode: focusNode,
              freeText: true,
              loading: searching,
              onSubmitted: (_) => onSubmit(),
              onChanged: (_) => onChanged(),
              onCleared: onClear,
            ),
          ),
        ),
        const Gap(8),
        Tooltip(
          message: 'Scan parcel QR',
          child: Material(
            color: kStaffAccent,
            borderRadius: BorderRadius.circular(12),
            child: InkWell(
              onTap: onScan,
              borderRadius: BorderRadius.circular(12),
              child: const SizedBox(
                width: 48,
                height: 48,
                child: Center(
                  child: HugeIcon(icon: HugeIcons.strokeRoundedQrCode, color: Colors.white, size: 24),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _ShipmentCard extends StatelessWidget {
  const _ShipmentCard({required this.shipment, required this.onTap, required this.onLiveTap, required this.onShare});

  final ShipmentData shipment;
  final VoidCallback onTap;
  final VoidCallback onLiveTap;
  final VoidCallback onShare;

  static String _city(String address) {
    final first = address.split(',').first.trim();
    return first.isEmpty ? '—' : first;
  }

  @override
  Widget build(BuildContext context) {
    final palette = StaffPalette.of(context);
    final s = shipment;
    final isExpress = isExpressUrgency(s.urgency);

    Widget detail(String label, String value) => Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: GoogleFonts.outfit(fontSize: 13, color: palette.fg(0.55))),
          const Gap(2),
          Text(
            value,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.outfit(fontSize: 15, color: palette.fg()),
          ),
        ],
      ),
    );

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
                                s.trackingId,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.outfit(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w600,
                                  color: palette.fg(),
                                ),
                              ),
                            ),
                            if (isExpress) ...[const Gap(6), const ExpressBadge(small: true)],
                          ],
                        ),
                        Text(s.eta, style: GoogleFonts.outfit(fontSize: 13, color: palette.fg(0.55))),
                      ],
                    ),
                  ),
                  ParcelStatusBadge(
                    status: ParcelStatus.values.asNameMap()[s.rawStatus] ?? ParcelStatus.received,
                    small: true,
                  ),
                ],
              ),
              const Gap(14),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      _city(s.from),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.outfit(fontSize: 18, fontWeight: FontWeight.w600, color: palette.fg()),
                    ),
                  ),
                  HugeIcon(icon: HugeIcons.strokeRoundedArrowRight02, color: palette.fg(0.5), size: 20),
                  const Gap(10),
                  Expanded(
                    child: Text(
                      _city(s.to),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.outfit(fontSize: 18, fontWeight: FontWeight.w600, color: palette.fg()),
                    ),
                  ),
                ],
              ),
              const Gap(12),
              Row(children: [detail('Size', s.size), detail('Weight', s.weight)]),
              const Gap(10),
              Row(children: [detail('Service', s.service), detail('Receiver', s.receiverName)]),
              const Gap(14),
              Row(
                children: [
                  Expanded(
                    child: StaffButton(
                      label: 'Share',
                      icon: HugeIcons.strokeRoundedShare08,
                      color: palette.fg(0.8),
                      outlined: true,
                      onPressed: onShare,
                    ),
                  ),
                  const Gap(10),
                  Expanded(
                    child: StaffButton(
                      label: 'Live Track',
                      icon: HugeIcons.strokeRoundedMapsLocation01,
                      onPressed: onLiveTap,
                    ),
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
