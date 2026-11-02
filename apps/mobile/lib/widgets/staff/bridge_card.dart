import 'package:flutter/material.dart';

/// Gradient card with the train-bridge artwork along its bottom edge.
/// Sizes to [child]; text on it should be white.
class BridgeCard extends StatelessWidget {
  const BridgeCard({
    super.key,
    required this.colors,
    required this.child,
    this.padding = const EdgeInsets.all(18),
  });

  final List<Color> colors;
  final Widget child;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(28),
      child: Stack(
        children: [
          Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: colors, begin: Alignment.topLeft, end: Alignment.bottomRight),
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            height: 120,
            child: Opacity(
              opacity: 0.3,
              child: Image.asset(
                'assets/images/bg/station_header.png',
                fit: BoxFit.cover,
                alignment: Alignment.bottomCenter,
                errorBuilder: (_, _, _) => const SizedBox.shrink(),
              ),
            ),
          ),
          Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [colors.first.withValues(alpha: 0), colors.last.withValues(alpha: 0.5)],
                ),
              ),
            ),
          ),
          Padding(padding: padding, child: child),
        ],
      ),
    );
  }
}

/// White label/value column used inside a [BridgeCard].
class BridgeStat extends StatelessWidget {
  const BridgeStat({super.key, required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          value,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(fontFamily: 'Outfit', fontSize: 20, fontWeight: FontWeight.w700, color: Colors.white),
        ),
        Text(label, style: TextStyle(fontFamily: 'Outfit', fontSize: 12.5, color: Colors.white.withValues(alpha: 0.8))),
      ],
    );
  }
}
