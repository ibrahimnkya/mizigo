import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../providers/auth_provider.dart';
import '../../services/api_service.dart';
import '../../theme/app_theme.dart';
import '../../theme/staff_palette.dart';

/// Animated splash following the Figma "1 Splash B 1–7" keyframes:
/// blank brand background → cream tile pops in → light sweeps across the tile
/// → maroon chevron lands → orange square pops → wordmark + tagline rise.
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  static const _duration = Duration(milliseconds: 2800);
  static const _hold = Duration(milliseconds: 500);

  late final AnimationController _controller = AnimationController(vsync: this, duration: _duration);

  late final Animation<double> _tile = _interval(0.08, 0.30, Curves.easeOutBack);
  late final Animation<double> _sweep = _interval(0.20, 0.55, Curves.easeInOutSine);
  late final Animation<double> _chevron = _interval(0.50, 0.68, Curves.easeOutCubic);
  late final Animation<double> _square = _interval(0.64, 0.80, Curves.easeOutBack);
  late final Animation<double> _brand = _interval(0.76, 1.0, Curves.easeOutCubic);

  Animation<double> _interval(double begin, double end, Curve curve) =>
      CurvedAnimation(parent: _controller, curve: Interval(begin, end, curve: curve));

  bool _started = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_started) return;
    _started = true;
    ApiService.warmUp();
    if (MediaQuery.of(context).disableAnimations) {
      _controller.value = 1;
      Future.delayed(const Duration(milliseconds: 1200), _finish);
    } else {
      _controller.forward().whenComplete(() => Future.delayed(_hold, _finish));
    }
  }

  /// Leaves the splash once the animation is done and the stored session has
  /// loaded. `/home` is redirected by the router to onboarding, login or the
  /// forced PIN change as appropriate.
  void _finish() {
    if (!mounted) return;
    final auth = context.read<AuthProvider>();
    if (auth.status != AuthStatus.unknown) {
      context.go('/home');
      return;
    }
    void onAuth() {
      if (auth.status == AuthStatus.unknown) return;
      auth.removeListener(onAuth);
      if (mounted) context.go('/home');
    }
    auth.addListener(onAuth);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Follows the selected theme (TRC maroon / Mid-Night / Daylight).
    final palette = StaffPalette.of(context);
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: palette.overlayStyle,
      child: Scaffold(
        backgroundColor: palette.splashBackground,
        body: AnimatedBuilder(
          animation: _controller,
          builder: (context, _) {
            return Stack(
              children: [
                Align(
                  alignment: const Alignment(0, -0.12),
                  child: Opacity(
                    opacity: _tile.value.clamp(0.0, 1.0),
                    child: Transform.scale(
                      scale: 0.6 + 0.4 * _tile.value,
                      child: _LogoTile(
                        sweep: _sweep.value,
                        chevron: _chevron.value,
                        square: _square.value,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 64,
                  left: 0,
                  right: 0,
                  child: Opacity(
                    opacity: _brand.value,
                    child: Transform.translate(
                      offset: Offset(0, 16 * (1 - _brand.value)),
                      child: Column(
                        children: [
                          Image.asset(
                            palette.wordmark,
                            height: 36,
                            fit: BoxFit.contain,
                          ),
                          const Gap(8),
                          Text(
                            'Book • Track • Deliver',
                            style: GoogleFonts.inter(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color: AppTheme.tecOrange,
                              letterSpacing: 0.4,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _LogoTile extends StatelessWidget {
  const _LogoTile({required this.sweep, required this.chevron, required this.square});

  static const double _size = 104;
  static const _cream = Color(0xFFFFF9F3);
  static const _peach = Color(0xFFFDE3C9);

  final double sweep;
  final double chevron;
  final double square;

  @override
  Widget build(BuildContext context) {
    // The highlight travels around the tile and settles bottom-right, as in the
    // final frame.
    final angle = -math.pi * 0.75 + sweep * math.pi * 1.5;
    final highlight = Alignment(0.5 * math.cos(angle), 0.5 * math.sin(angle));

    return Container(
      width: _size,
      height: _size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(26),
        border: Border.all(color: AppTheme.tecOrange.withValues(alpha: 0.45), width: 1.5),
        gradient: RadialGradient(
          center: highlight,
          radius: 1.1,
          colors: const [_cream, _peach],
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.25),
            blurRadius: 24,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Center(
        child: CustomPaint(
          size: const Size.square(_size * 0.5),
          painter: _MarkPainter(chevron: chevron, square: square),
        ),
      ),
    );
  }
}

/// The MiziGO mark on a 3×3 grid: a maroon chevron and an orange square.
class _MarkPainter extends CustomPainter {
  _MarkPainter({required this.chevron, required this.square});

  final double chevron;
  final double square;

  @override
  void paint(Canvas canvas, Size size) {
    final t = size.width / 3;

    if (chevron > 0) {
      // Slides in from the top-left corner it points to.
      final shift = (1 - chevron) * -t * 0.6;
      final path = Path()
        ..moveTo(0, 0)
        ..lineTo(2 * t, 0)
        ..lineTo(3 * t, t)
        ..lineTo(t, t)
        ..lineTo(t, 3 * t)
        ..lineTo(0, 2 * t)
        ..close();
      canvas.save();
      canvas.translate(shift, shift);
      canvas.drawPath(
        path,
        Paint()..color = AppTheme.tecMaroon.withValues(alpha: chevron.clamp(0.0, 1.0)),
      );
      canvas.restore();
    }

    if (square > 0) {
      final center = Offset(2.5 * t, 2.5 * t);
      final side = t * square.clamp(0.0, 1.2);
      canvas.drawRect(
        Rect.fromCenter(center: center, width: side, height: side),
        Paint()..color = AppTheme.tecOrange,
      );
    }
  }

  @override
  bool shouldRepaint(_MarkPainter old) => old.chevron != chevron || old.square != square;
}
