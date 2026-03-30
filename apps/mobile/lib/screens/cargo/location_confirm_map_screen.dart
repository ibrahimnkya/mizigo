import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoding/geocoding.dart';
import 'package:gap/gap.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:go_router/go_router.dart';
import 'dart:async';

class LocationConfirmMapScreen extends StatefulWidget {
  final String title;
  final String initialLocation;

  const LocationConfirmMapScreen({
    super.key, 
    required this.title, 
    required this.initialLocation,
  });

  @override
  State<LocationConfirmMapScreen> createState() => _LocationConfirmMapScreenState();
}

class _LocationConfirmMapScreenState extends State<LocationConfirmMapScreen> {
  late String _currentAddress;
  final Completer<GoogleMapController> _mapController = Completer();
  LatLng _center = const LatLng(-6.7924, 39.2083); // Dar es Salaam default
  bool _isMoving = false;
  Timer? _debounceTimer;

  @override
  void initState() {
    super.initState();
    _currentAddress = widget.initialLocation.isEmpty ? 'Searching...' : widget.initialLocation;
  }

  Future<void> _getAddressFromLatLng(LatLng position) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(position.latitude, position.longitude);
      if (placemarks.isNotEmpty) {
        Placemark place = placemarks[0];
        setState(() {
          _currentAddress = '${place.name}, ${place.subLocality}, ${place.locality}';
        });
      }
    } catch (e) {
      debugPrint('Error getting address: $e');
      // On error or no geocoding service, just show coordinates or keep old address
      setState(() {
        _currentAddress = 'Selected Location (${position.latitude.toStringAsFixed(4)}, ${position.longitude.toStringAsFixed(4)})';
      });
    }
  }

  void _onCameraMove(CameraPosition position) {
    _center = position.target;
    setState(() => _isMoving = true);
    
    // Debounce geocoding requests
    _debounceTimer?.cancel();
    _debounceTimer = Timer(const Duration(milliseconds: 500), () {
      if (mounted) {
        setState(() => _isMoving = false);
        _getAddressFromLatLng(_center);
      }
    });
  }

  @override
  void dispose() {
    _debounceTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      body: Stack(
        children: [
          // Google Map
          Positioned.fill(
            child: GoogleMap(
              initialCameraPosition: CameraPosition(
                target: _center,
                zoom: 15,
              ),
              onMapCreated: (controller) => _mapController.complete(controller),
              onCameraMove: _onCameraMove,
              myLocationEnabled: true,
              myLocationButtonEnabled: false,
              zoomControlsEnabled: false,
              mapToolbarEnabled: false,
              compassEnabled: false,
            ),
          ),

          // Central Pin Overlay
          IgnorePointer(
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    transform: Matrix4.translationValues(0, _isMoving ? -10 : 0, 0),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        const HugeIcon(
                          icon: HugeIcons.strokeRoundedLocation01, 
                          color: Colors.black26, 
                          size: 40,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 4),
                          child: HugeIcon(
                            icon: HugeIcons.strokeRoundedLocation01, 
                            color: widget.title.contains('Pick-up') 
                                ? const Color(0xFF3B82F6) 
                                : const Color(0xFF10B981), 
                            size: 38,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Gap(4),
                  Container(
                    width: 8,
                    height: 4,
                    decoration: BoxDecoration(
                      color: Colors.black.withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Top Header (Back button)
          Positioned(
            top: MediaQuery.of(context).padding.top + 10,
            left: 16,
            child: CircleAvatar(
              backgroundColor: isDark ? const Color(0xFF0F172A) : Colors.white,
              child: IconButton(
                icon: HugeIcon(icon: HugeIcons.strokeRoundedArrowLeft01, color: isDark ? Colors.white : const Color(0xFF1E293B)),
                onPressed: () => context.pop(),
              ),
            ),
          ),

          // Bottom Sheet
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
              decoration: BoxDecoration(
                color: isDark ? const Color(0xFF1E293B) : Colors.white,
                borderRadius: const BorderRadius.vertical(top: Radius.circular(32)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.15),
                    blurRadius: 20,
                    offset: const Offset(0, -10),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Confirm ${widget.title.contains('Pick-up') ? 'Pick-up' : 'Delivery'}',
                        style: GoogleFonts.outfit(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: isDark ? Colors.white : const Color(0xFF1E293B),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => context.pop(),
                        child: HugeIcon(
                          icon: HugeIcons.strokeRoundedSearch01, 
                          color: isDark ? const Color(0xFF3B82F6) : const Color(0xFF3B82F6),
                          size: 24,
                        ),
                      ),
                    ],
                  ),
                  const Gap(24),
                  
                  // Selected Location Display
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    decoration: BoxDecoration(
                      color: isDark ? const Color(0xFF0F172A) : const Color(0xFFF8FAFC),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: isDark ? Colors.white10 : Colors.grey.withValues(alpha: 0.1),
                      ),
                    ),
                    child: Row(
                      children: [
                        const HugeIcon(
                          icon: HugeIcons.strokeRoundedLocation01,
                          color: Color(0xFF64748B),
                          size: 20,
                        ),
                        const Gap(12),
                        Expanded(
                          child: Text(
                            _isMoving ? 'Selecting...' : _currentAddress,
                            style: GoogleFonts.inter(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: isDark ? Colors.white : const Color(0xFF1E293B),
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                  
                  const Gap(24),
                  
                  // Confirm Button
                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: ElevatedButton(
                      onPressed: _isMoving ? null : () => context.pop(_currentAddress),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: widget.title.contains('Pick-up') 
                            ? const Color(0xFF3B82F6) 
                            : const Color(0xFF10B981),
                        foregroundColor: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: Text(
                        'Confirm Location',
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                  Gap(MediaQuery.of(context).padding.bottom),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
