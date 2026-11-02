import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../models/parcel_model.dart';

/// Solid pill badge: white bold label (and optional icon) on a full color, so
/// it reads clearly on every theme. All parcel badges use this look.
class StaffBadge extends StatelessWidget {
  const StaffBadge({super.key, required this.label, required this.color, this.icon, this.small = false});

  final String label;
  final Color color;
  final List<List<dynamic>>? icon;

  /// Tighter variant for list cards.
  final bool small;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: small ? const EdgeInsets.fromLTRB(7, 3, 9, 3) : const EdgeInsets.fromLTRB(8, 5, 10, 5),
      decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(999)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            HugeIcon(icon: icon!, color: Colors.white, size: small ? 13 : 15),
            Gap(small ? 4 : 5),
          ],
          Text(
            label,
            style: GoogleFonts.outfit(fontSize: small ? 12 : 13, fontWeight: FontWeight.w700, color: Colors.white),
          ),
        ],
      ),
    );
  }
}

/// Parcel status as a solid badge.
class ParcelStatusBadge extends StatelessWidget {
  const ParcelStatusBadge({super.key, required this.status, this.small = false});

  final ParcelStatus status;
  final bool small;

  static (Color, List<List<dynamic>>) styleFor(ParcelStatus s) => switch (s) {
        ParcelStatus.delivered => (const Color(0xFF059669), HugeIcons.strokeRoundedCheckmarkCircle02),
        ParcelStatus.canceled || ParcelStatus.lost => (const Color(0xFFDC2626), HugeIcons.strokeRoundedCancelCircle),
        ParcelStatus.atStation || ParcelStatus.offloaded => (const Color(0xFFD97706), HugeIcons.strokeRoundedLocation01),
        ParcelStatus.inTransit || ParcelStatus.dispatched => (const Color(0xFF4F46E5), HugeIcons.strokeRoundedDeliveryTruck01),
        ParcelStatus.received => (const Color(0xFFEA7A12), HugeIcons.strokeRoundedPackageReceive),
      };

  @override
  Widget build(BuildContext context) {
    final (color, icon) = styleFor(status);
    return StaffBadge(label: status.displayLabel, color: color, icon: icon, small: small);
  }
}

/// "Express" priority badge.
class ExpressBadge extends StatelessWidget {
  const ExpressBadge({super.key, this.small = false});

  final bool small;

  @override
  Widget build(BuildContext context) =>
      StaffBadge(label: 'Express', color: const Color(0xFFE2452B), icon: HugeIcons.strokeRoundedFire, small: small);
}

/// Whether a parcel's urgency counts as express.
bool isExpressUrgency(String urgency) {
  final u = urgency.toLowerCase();
  return u.contains('express') || u.contains('urgent') || u == 'mgr';
}
