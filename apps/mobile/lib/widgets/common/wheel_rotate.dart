import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';

class WheelRotate extends StatefulWidget {
  final Widget? icon;
  final Color? color;
  final double? size;

  const WheelRotate({
    super.key,
    this.icon,
    this.color,
    this.size,
  });

  @override
  State<WheelRotate> createState() => _WheelRotateState();
}

class _WheelRotateState extends State<WheelRotate> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 20),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Transform.rotate(
          angle: _controller.value * 2 * 3.14159,
          child: child,
        );
      },
      child: Center(
        child: Container(
          width: widget.size ?? 250,
          height: widget.size ?? 250,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: (widget.color ?? AppTheme.cPrimary).withValues(alpha: 0.05),
              width: 40,
            ),
          ),
        ),
      ),
    );
  }
}
