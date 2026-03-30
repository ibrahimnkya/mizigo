import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../../providers/cargo_provider.dart';
import '../../models/cargo_model.dart';
import '../../widgets/home/premium_ui_components.dart';

class AvailabilityCheckerScreen extends StatefulWidget {
  final Map<String, dynamic> orderData;

  const AvailabilityCheckerScreen({super.key, required this.orderData});

  @override
  State<AvailabilityCheckerScreen> createState() => _AvailabilityCheckerScreenState();
}

class _AvailabilityCheckerScreenState extends State<AvailabilityCheckerScreen>
    with TickerProviderStateMixin {
  double _progress = 0.0;
  bool _isChecking = true;
  bool _isCreatingCargo = false;
  String? _creationError;
  CargoModel? _createdCargo;
  Timer? _timer;

  late AnimationController _spinController;
  late AnimationController _successController;

  @override
  void initState() {
    super.initState();
    _spinController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();

    _successController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );

    _startChecking();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _spinController.dispose();
    _successController.dispose();
    super.dispose();
  }

  void _startChecking() {
    const duration = Duration(milliseconds: 50);
    _timer = Timer.periodic(duration, (timer) async {
      if (!mounted) return;
      if (_progress < 1.0) {
        setState(() {
          _progress += 0.02;
        });
      } else {
        _timer?.cancel();
        setState(() {
          _isChecking = false;
          _isCreatingCargo = true;
        });
        _spinController.stop();
        _successController.forward();

        try {
          // Create the real cargo record
          final provider = Provider.of<CargoProvider>(context, listen: false);
          final cargo = await provider.createCargo(widget.orderData);

          if (mounted) {
            setState(() {
              _isCreatingCargo = false;
              if (cargo != null) {
                _createdCargo = cargo;
              } else {
                _creationError = provider.error ?? 'Failed to create booking';
              }
            });
          }
        } catch (e) {
          if (mounted) {
            setState(() {
              _isCreatingCargo = false;
              _creationError = 'Unexpected error: ${e.toString()}';
            });
          }
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        backgroundColor: isDark ? const Color(0xFF0F172A) : Colors.white,
        body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
          child: Column(
            children: [
              const Gap(40),
              _buildVisualIndicator(isDark),
              const Gap(40),
              Text(
                _isChecking ? 'Checking Availability...' : 'Space Confirmed!',
                style: GoogleFonts.outfit(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  color: isDark ? Colors.white : const Color(0xFF1E293B),
                ),
              ),
              const Gap(12),
              Text(
                _isChecking
                    ? 'We are verifying if there is enough space in the selected vehicle for your package.'
                    : (widget.orderData['receiverPays'] == true
                        ? 'Great news! Space is confirmed. The receiver will pay the total cost upon pickup/delivery.'
                        : 'Great news! We have confirmed that there is enough space for your package. You can now proceed to payment.'),
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(
                  fontSize: 15,
                  color: isDark ? Colors.white60 : const Color(0xFF64748B),
                  height: 1.5,
                ),
              ),

              const Spacer(),

              // Action Button
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    if (_creationError != null)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: Text(
                          _creationError!,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.inter(
                            color: Colors.redAccent,
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: (_isChecking || _isCreatingCargo)
                            ? null
                            : (_createdCargo == null && _creationError == null)
                                ? null
                                : () {
                                    if (_createdCargo == null) return;

                                    if (widget.orderData['receiverPays'] == true) {
                                      // Navigate to Details/Receipt directly
                                      context.push('/bookings/recent/${_createdCargo!.id}', extra: _createdCargo);
                                    } else {
                                      // Proceed to Payment (Standard Navigation)
                                      context.push(
                                        '/cargo/${_createdCargo!.id}/payment',
                                        extra: {
                                          'amount': (_createdCargo!.amount ?? (widget.orderData['total'] as num)).toDouble(),
                                        },
                                      );
                                    }
                                  },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF3B82F6),
                          foregroundColor: Colors.white,
                          disabledBackgroundColor: isDark ? Colors.white10 : Colors.black12,
                          disabledForegroundColor: isDark ? Colors.white38 : const Color(0xFF94A3B8),
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                          elevation: 0,
                        ),
                        child: _isCreatingCargo
                            ? const SizedBox(
                                height: 20,
                                width: 20,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                                ),
                              )
                            : Text(
                                _isChecking
                                    ? 'Checking...'
                                    : (widget.orderData['receiverPays'] == true
                                        ? 'View Booking Details'
                                        : 'Proceed to Payment'),
                                style: GoogleFonts.outfit(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                      ),
                    ),
                    if (_creationError != null)
                      TextButton(
                        onPressed: () {
                          setState(() {
                            _progress = 0.0;
                            _isChecking = true;
                            _creationError = null;
                            _createdCargo = null;
                          });
                          _spinController.repeat();
                          _successController.reset();
                          _startChecking();
                        },
                        child: const Text('Try Again'),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      ),
    );
  }

  Widget _buildVisualIndicator(bool isDark) {
    if (_isChecking) {
      return AnimatedBuilder(
        animation: _spinController,
        builder: (context, child) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    // Outer rotating ring
                    RotationTransition(
                      turns: _spinController,
                      child: Container(
                        width: 160,
                        height: 160,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: const Color(0xFF3B82F6).withValues(alpha: 0.1),
                            width: 8,
                          ),
                        ),
                        child: CircularProgressIndicator(
                          value: _progress,
                          strokeWidth: 8,
                          backgroundColor: Colors.transparent,
                          valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFF3B82F6)),
                        ),
                      ),
                    ),
                    // Inner pulsing icon
                    const _PulsingParcelIcon(),
                  ],
                ),
                const Gap(32),
                Text(
                  '${(_progress * 100).toInt()}%',
                  style: GoogleFonts.outfit(
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                    color: const Color(0xFF3B82F6),
                  ),
                ),
                const Gap(8),
                Text(
                  'Verifying available space...',
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: isDark ? Colors.white70 : const Color(0xFF475569),
                  ),
                ),
              ],
            ),
          );
        },
      );
    } else {
      return AnimatedBuilder(
        animation: _successController,
        builder: (context, child) {
          final scale = CurvedAnimation(
            parent: _successController,
            curve: Curves.elasticOut,
          ).value;

          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Transform.scale(
                  scale: scale,
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      Container(
                        width: 160,
                        height: 160,
                        decoration: BoxDecoration(
                          color: const Color(0xFF10B981).withValues(alpha: 0.1),
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFF10B981).withValues(alpha: 0.2 * scale),
                              blurRadius: 40 * scale,
                              spreadRadius: 10 * scale,
                            ),
                          ],
                        ),
                        child: const Center(
                          child: ParcelIcon(),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: const BoxDecoration(
                          color: Color(0xFF10B981),
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 8,
                              offset: Offset(0, 4),
                            ),
                          ],
                        ),
                        child: const Icon(
                          Icons.check_rounded,
                          color: Colors.white,
                          size: 32,
                        ),
                      ),
                    ],
                  ),
                ),
                const Gap(32),
                Text(
                  'Space Confirmed!',
                  style: GoogleFonts.outfit(
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                    color: const Color(0xFF10B981),
                  ),
                ),
                const Gap(8),
                Text(
                  'The required space has been reserved.',
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: isDark ? Colors.white70 : const Color(0xFF475569),
                  ),
                ),
              ],
            ),
          );
        },
      );
    }
  }
}

class _PulsingParcelIcon extends StatefulWidget {
  const _PulsingParcelIcon();

  @override
  State<_PulsingParcelIcon> createState() => _PulsingParcelIconState();
}

class _PulsingParcelIconState extends State<_PulsingParcelIcon>
    with TickerProviderStateMixin {
  late AnimationController _pulseController;
  late AnimationController _rotateController;
  late Animation<double> _pulseAnimation;

  @override
  void initState() {
    super.initState();
    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    )..repeat(reverse: true);

    _rotateController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    )..repeat();

    _pulseAnimation = Tween<double>(begin: 0.9, end: 1.1).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _pulseController.dispose();
    _rotateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: _rotateController,
      child: ScaleTransition(
        scale: _pulseAnimation,
        child: const ParcelIcon(),
      ),
    );
  }
}
