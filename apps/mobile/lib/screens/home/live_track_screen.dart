import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';
import 'package:gap/gap.dart';
import 'package:hugeicons/hugeicons.dart';
import 'track_screen.dart';
import 'delivery_confirmation_screen.dart';
import '../../widgets/home/premium_ui_components.dart';

class LiveTrackScreen extends StatefulWidget {
  final ShipmentData shipment;
  const LiveTrackScreen({super.key, required this.shipment});

  @override
  State<LiveTrackScreen> createState() => _LiveTrackScreenState();
}

class _LiveTrackScreenState extends State<LiveTrackScreen>
    with TickerProviderStateMixin {
  late AnimationController _dotController;
  late DraggableScrollableController _sheetController;
  final Completer<GoogleMapController> _mapController = Completer();

  // Mock Coordinates
  static const LatLng _startPoint = LatLng(-6.8235, 39.2695); // Posta
  static const LatLng _midPoint = LatLng(-6.7924, 39.2083);
  static const LatLng _endPoint = LatLng(-3.3731, 36.6858); // Arusha (simplified for demo)

  LatLng _currentTruckPos = _startPoint;
  Set<Marker> _markers = {};
  Set<Polyline> _polylines = {};

  @override
  void initState() {
    super.initState();
    _dotController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 15),
    )..addListener(() {
        _updateTruckPosition();
      })..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          Future.delayed(const Duration(milliseconds: 500), () {
            if (mounted) {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (_) => const DeliveryStatusScreen(
                    status: DeliveryStatus.arrived,
                  ),
                ),
              );
            }
          });
        }
      });

    _initMarkers();
    _initPolylines();
    _dotController.forward();
    _sheetController = DraggableScrollableController();
  }

  void _initMarkers() {
    _markers = {
      const Marker(
        markerId: MarkerId('start'),
        position: _startPoint,
        infoWindow: InfoWindow(title: 'Origin'),
      ),
      const Marker(
        markerId: MarkerId('end'),
        position: _endPoint,
        infoWindow: InfoWindow(title: 'Destination'),
      ),
      Marker(
        markerId: const MarkerId('truck'),
        position: _currentTruckPos,
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
        infoWindow: const InfoWindow(title: 'Shipment Location'),
      ),
    };
  }

  void _initPolylines() {
    _polylines = {
      const Polyline(
        polylineId: PolylineId('route'),
        points: [_startPoint, _midPoint, _endPoint],
        color: Color(0xFF0BB08D),
        width: 5,
      ),
    };
  }

  void _updateTruckPosition() {
    final t = _dotController.value;
    setState(() {
      if (t < 0.5) {
        double subT = t * 2;
        _currentTruckPos = LatLng(
          _startPoint.latitude + (_midPoint.latitude - _startPoint.latitude) * subT,
          _startPoint.longitude + (_midPoint.longitude - _startPoint.longitude) * subT,
        );
      } else {
        double subT = (t - 0.5) * 2;
        _currentTruckPos = LatLng(
          _midPoint.latitude + (_endPoint.latitude - _midPoint.latitude) * subT,
          _midPoint.longitude + (_endPoint.longitude - _midPoint.longitude) * subT,
        );
      }
      
      // Update moving marker
      _markers = {
        ..._markers.where((m) => m.markerId.value != 'truck'),
        Marker(
          markerId: const MarkerId('truck'),
          position: _currentTruckPos,
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
          infoWindow: const InfoWindow(title: 'Shipment Location'),
        ),
      };
    });
  }

  @override
  void dispose() {
    _dotController.dispose();
    _sheetController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final s = widget.shipment;
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: Stack(
        children: [
          // ── Google Map ────────────────────────────────────
          Positioned.fill(
            child: GoogleMap(
              initialCameraPosition: CameraPosition(
                target: _midPoint,
                zoom: 5,
              ),
              onMapCreated: (controller) => _mapController.complete(controller),
              markers: _markers,
              polylines: _polylines,
              myLocationButtonEnabled: false,
              zoomControlsEnabled: false,
              mapToolbarEnabled: false,
            ),
          ),

          // ── ETA chip ──────────────────────────────────────────
          Positioned(
            top: MediaQuery.of(context).padding.top + 80,
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 18, vertical: 9),
                decoration: BoxDecoration(
                  color: const Color(0xFF0BB08D),
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF0BB08D).withValues(alpha: 0.35),
                      blurRadius: 14,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Text(
                  'Arrives by 14:11 AM',
                  style: GoogleFonts.inter(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),

          // ── Back button ───────────────────────────────────────
          Positioned(
            top: MediaQuery.of(context).padding.top + 16,
            left: 20,
            child: GestureDetector(
              onTap: () => Navigator.of(context).pop(),
              child: Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: theme.cardTheme.color,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: theme.brightness == Brightness.dark ? 0.2 : 0.12),
                      blurRadius: 10,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Center(
                  child: HugeIcon(
                    icon: HugeIcons.strokeRoundedArrowLeft01,
                    color: theme.iconTheme.color,
                    size: 20,
                  ),
                ),
              ),
            ),
          ),

          // ── Bottom sheet ──────────────────────────────────────
          DraggableScrollableSheet(
            controller: _sheetController,
            initialChildSize: 0.42,
            minChildSize: 0.35,
            maxChildSize: 0.80,
            builder: (context, scrollController) {
              return Container(
                decoration: BoxDecoration(
                  color: theme.cardTheme.color,
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(28)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: theme.brightness == Brightness.dark ? 0.3 : 0.08),
                      blurRadius: 30,
                      offset: const Offset(0, -8),
                    ),
                  ],
                ),
                child: ListView(
                  controller: scrollController,
                  padding: EdgeInsets.zero,
                  children: [
                    // Drag handle
                    const Gap(10),
                    Center(
                      child: Container(
                        width: 40,
                        height: 4,
                        decoration: BoxDecoration(
                          color: theme.dividerColor,
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                    ),
                    const Gap(18),

                    // Parcel info row
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: theme.brightness == Brightness.dark ? Colors.white.withValues(alpha: 0.05) : const Color(0xFFF8FAFC),
                          borderRadius: BorderRadius.circular(18),
                          border:
                              Border.all(color: theme.dividerColor),
                        ),
                        child: Row(
                          children: [
                            // Parcel icon
                            const ParcelIcon(),
                            const Gap(12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(children: [
                                    Text('Parcel ',
                                        style: GoogleFonts.outfit(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 15,
                                          color: theme.textTheme.titleMedium?.color,
                                        )),
                                    const Gap(4),
                                    const HugeIcon(
                                      icon: HugeIcons.strokeRoundedFire,
                                      color: Color(0xFFEF4444),
                                      size: 16,
                                    ),
                                    ]),
                                  Text(s.trackingId,
                                      style: GoogleFonts.inter(
                                        fontSize: 12,
                                        color: const Color(0xFF64748B),
                                      )),
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
                                    color: const Color(0xFFEFF6FF),
                                    borderRadius:
                                        BorderRadius.circular(20),
                                  ),
                                  child: Text(
                                    s.statusLabel,
                                    style: GoogleFonts.inter(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w600,
                                      color: const Color(0xFF2563EB),
                                    ),
                                  ),
                                ),
                                const Gap(3),
                                Text(s.eta,
                                    style: GoogleFonts.inter(
                                      fontSize: 11,
                                      color: const Color(0xFF64748B),
                                    )),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),

                    const Gap(12),

                    // Driver info row
                    Padding(
                      padding:
                          const EdgeInsets.symmetric(horizontal: 20),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 14),
                        decoration: BoxDecoration(
                          color: theme.brightness == Brightness.dark ? Colors.white.withValues(alpha: 0.05) : const Color(0xFFF8FAFC),
                          borderRadius: BorderRadius.circular(18),
                          border:
                              Border.all(color: theme.dividerColor),
                        ),
                        child: Row(
                          children: [
                            // Driver avatar
                            Container(
                              width: 46,
                              height: 46,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: const Color(0xFFCBD5E1),
                                border: Border.all(
                                    color: Colors.white, width: 2),
                              ),
                              child: const Center(
                                child: HugeIcon(
                                  icon: HugeIcons.strokeRoundedUser,
                                  color: Color(0xFF64748B),
                                  size: 24,
                                ),
                              ),
                            ),
                            const Gap(12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                children: [
                                  Row(children: [
                                    Text('Juma H.',
                                        style: GoogleFonts.inter(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w700,
                                          color: theme.textTheme.titleMedium?.color,
                                        )),
                                    const Gap(4),
                                    const Icon(
                                      Icons.verified_rounded,
                                      size: 16,
                                      color: Color(0xFF2563EB),
                                    ),
                                  ]),
                                  Text('Driver',
                                      style: GoogleFonts.inter(
                                        fontSize: 12,
                                        color: const Color(0xFF64748B),
                                      )),
                                ],
                              ),
                            ),
                            _ContactBtn(
                              icon: HugeIcons.strokeRoundedCall02,
                              onTap: () {},
                            ),
                            const Gap(10),
                            _ContactBtn(
                              icon: HugeIcons.strokeRoundedChatting01,
                              onTap: () {},
                            ),
                          ],
                        ),
                      ),
                    ),

                    const Gap(20),

                    // Route details
                    Padding(
                      padding:
                          const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          _detailRow(context, 'From', s.from),
                          _detailRow(context, 'To', s.to),
                          _detailRow(context, 'Size', s.size),
                          _detailRow(context, 'Weight', s.weight),
                          _detailRow(context, 'Insurance', s.insurance),
                        ],
                      ),
                    ),

                    SizedBox(
                      height: MediaQuery.of(context).padding.bottom + 16,
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

// ─── Contact Button ───────────────────────────────────────────────────────────
 
class _ContactBtn extends StatelessWidget {
  final dynamic icon;
  final VoidCallback onTap;
  const _ContactBtn({required this.icon, required this.onTap});
 
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 42,
        height: 42,
        decoration: BoxDecoration(
          color: theme.cardTheme.color,
          shape: BoxShape.circle,
          border: Border.all(color: theme.dividerColor, width: 1.5),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: theme.brightness == Brightness.dark ? 0.2 : 0.04),
              blurRadius: 6,
            ),
          ],
        ),
        child: Center(
          child: HugeIcon(
              icon: icon, size: 18, color: theme.iconTheme.color?.withValues(alpha: 0.7)),
        ),
      ),
    );
  }
}
 
// ─── Detail Row ───────────────────────────────────────────────────────────────
 
Widget _detailRow(BuildContext context, String label, String value) {
  final theme = Theme.of(context);
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 7),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 110,
          child: Text(label,
              style: const TextStyle(
                  fontSize: 13, color: Color(0xFF94A3B8))),
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
          ),
        ),
      ],
    ),
  );
}
