import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../theme/staff_palette.dart';
import 'staff_settings.dart';

/// Staff illustration in a soft rounded square.
class StaffActionArt extends StatelessWidget {
  const StaffActionArt({super.key, required this.image, this.size = 56});

  final String image;
  final double size;

  @override
  Widget build(BuildContext context) {
    final palette = StaffPalette.of(context);
    return Container(
      width: size,
      height: size,
      padding: EdgeInsets.all(size * 0.16),
      decoration: BoxDecoration(
        color: palette.surface(0.12),
        borderRadius: BorderRadius.circular(size * 0.32),
        border: Border.all(color: palette.surface(0.12)),
      ),
      child: Image.asset(image, fit: BoxFit.contain, filterQuality: FilterQuality.high),
    );
  }
}

/// Small solid orange pill, e.g. "3 ready".
class StaffCountPill extends StatelessWidget {
  const StaffCountPill(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 3),
      decoration: BoxDecoration(color: kStaffAccent, borderRadius: BorderRadius.circular(999)),
      child: Text(text, style: GoogleFonts.outfit(fontSize: 12, fontWeight: FontWeight.w700, color: Colors.white)),
    );
  }
}

/// Full-width featured action: illustration, title, subtitle, orange arrow.
class StaffPrimaryActionCard extends StatelessWidget {
  const StaffPrimaryActionCard({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
    required this.onTap,
    this.badge,
    this.trailing,
  });

  final String image;
  final String title;
  final String subtitle;
  final VoidCallback? onTap;
  final Widget? badge;

  /// Replaces the orange arrow (e.g. a spinner while busy).
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    final palette = StaffPalette.of(context);
    return Material(
      color: palette.surface(0.10),
      borderRadius: BorderRadius.circular(24),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(24),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: kStaffAccent.withValues(alpha: 0.45)),
          ),
          child: Row(
            children: [
              StaffActionArt(image: image, size: 64),
              const Gap(14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Flexible(
                          child: Text(
                            title,
                            style: GoogleFonts.outfit(fontSize: 19, fontWeight: FontWeight.w700, color: palette.fg()),
                          ),
                        ),
                        if (badge != null) ...[const Gap(8), badge!],
                      ],
                    ),
                    const Gap(2),
                    Text(subtitle, style: GoogleFonts.outfit(fontSize: 14, height: 1.3, color: palette.fg(0.65))),
                  ],
                ),
              ),
              const Gap(10),
              trailing ??
                  Container(
                    width: 40,
                    height: 40,
                    decoration: const BoxDecoration(color: kStaffAccent, shape: BoxShape.circle),
                    child: const Center(
                      child: HugeIcon(icon: HugeIcons.strokeRoundedArrowRight02, color: Colors.white, size: 20),
                    ),
                  ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Grid tile: illustration (+ badge) on top, title with arrow, then [body]
/// or a subtitle. Stretches to the height it's given.
class StaffActionTile extends StatelessWidget {
  const StaffActionTile({
    super.key,
    required this.image,
    required this.title,
    required this.onTap,
    this.subtitle,
    this.body,
    this.badge,
  });

  final String image;
  final String title;
  final String? subtitle;
  final Widget? body;
  final Widget? badge;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final palette = StaffPalette.of(context);
    return Material(
      color: palette.surface(0.10),
      borderRadius: BorderRadius.circular(22),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(22),
        child: Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(22),
            border: Border.all(color: palette.surface(0.12)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  StaffActionArt(image: image, size: 50),
                  const Spacer(),
                  ?badge,
                ],
              ),
              const Spacer(),
              const Gap(12),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.outfit(fontSize: 17, fontWeight: FontWeight.w700, color: palette.fg()),
                    ),
                  ),
                  HugeIcon(icon: HugeIcons.strokeRoundedArrowRight01, color: palette.fg(0.5), size: 18),
                ],
              ),
              const Gap(2),
              if (body != null)
                body!
              else if (subtitle != null)
                Text(
                  subtitle!,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.outfit(fontSize: 13, height: 1.3, color: palette.fg(0.6)),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Lays out tiles two per row; an odd last tile spans the full width so
/// there's never an empty half-row. Rows share the available height when
/// [expand] is true (use inside a bounded-height parent).
class StaffTileGrid extends StatelessWidget {
  const StaffTileGrid({super.key, required this.children, this.expand = false, this.minRowHeight = 150});

  final List<Widget> children;
  final bool expand;
  final double minRowHeight;

  @override
  Widget build(BuildContext context) {
    final rows = <Widget>[];
    for (var i = 0; i < children.length; i += 2) {
      final row = Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(child: children[i]),
          if (i + 1 < children.length) ...[const Gap(10), Expanded(child: children[i + 1])],
        ],
      );
      if (rows.isNotEmpty) rows.add(const Gap(10));
      rows.add(
        expand
            ? Expanded(child: ConstrainedBox(constraints: BoxConstraints(minHeight: minRowHeight), child: row))
            // Sized to the taller tile's content (never below the minimum),
            // so nothing is clipped on small screens or with large text.
            : ConstrainedBox(
                constraints: BoxConstraints(minHeight: minRowHeight),
                child: IntrinsicHeight(child: row),
              ),
      );
    }
    return Column(mainAxisSize: expand ? MainAxisSize.max : MainAxisSize.min, children: rows);
  }
}
