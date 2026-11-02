import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:intl/intl.dart';

import '../../models/parcel_model.dart';
import '../../theme/app_theme.dart';
import '../../theme/staff_palette.dart';
import 'parcel_badges.dart';

String _city(String address) {
  final first = address.split(',').first.trim();
  return first.isEmpty ? '—' : first;
}

/// Origin on the left, destination on the right, joined by a dashed track
/// with a train in the middle.
class ParcelRouteStrip extends StatelessWidget {
  const ParcelRouteStrip({super.key, required this.from, required this.to, this.onColor = false});

  /// Builds from full addresses (uses the city part).
  ParcelRouteStrip.of(ParcelModel p, {super.key})
    : from = _city(p.fromAddress),
      to = _city(p.toAddress),
      onColor = false;

  final String from;
  final String to;

  /// White text and icons, for use on a coloured card.
  final bool onColor;

  @override
  Widget build(BuildContext context) {
    final palette = StaffPalette.of(context);
    final accent = onColor ? Colors.white : AppTheme.tecOrange;
    Widget stop(String label, String city, CrossAxisAlignment align) => Column(
      crossAxisAlignment: align,
      children: [
        Text(
          label,
          style: GoogleFonts.outfit(
            fontSize: 12,
            color: onColor ? Colors.white.withValues(alpha: 0.75) : palette.fg(0.5),
          ),
        ),
        const Gap(2),
        Text(
          city,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: GoogleFonts.outfit(
            fontSize: 17,
            fontWeight: FontWeight.w700,
            color: onColor ? Colors.white : palette.fg(),
          ),
        ),
      ],
    );

    Widget dashes() => LayoutBuilder(
      builder: (_, c) {
        final count = (c.maxWidth / 6).floor().clamp(1, 40);
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(
            count,
            (_) => Container(
              width: 3,
              height: 1.5,
              color: onColor ? Colors.white.withValues(alpha: 0.6) : palette.fg(0.3),
            ),
          ),
        );
      },
    );

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: onColor ? Colors.white.withValues(alpha: 0.16) : palette.surface(0.06),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Expanded(child: stop('From', from, CrossAxisAlignment.start)),
          Expanded(
            child: Row(
              children: [
                Container(
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: accent, width: 2),
                  ),
                ),
                Expanded(child: dashes()),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: HugeIcon(icon: HugeIcons.strokeRoundedSpeedTrain01, color: accent, size: 18),
                ),
                Expanded(child: dashes()),
                HugeIcon(icon: HugeIcons.strokeRoundedLocation01, color: accent, size: 14),
              ],
            ),
          ),
          Expanded(child: stop('To', to, CrossAxisAlignment.end)),
        ],
      ),
    );
  }
}

/// Parcel card used by the staff operation screens (Deliver, Offload,
/// Dispatch) and bookings: reference, Express, status, date, route, receiver.
/// With [selected] non-null it shows a checkbox for multi-select lists.
class ParcelSummaryCard extends StatelessWidget {
  const ParcelSummaryCard({super.key, required this.parcel, this.onTap, this.selected, this.footer});

  final ParcelModel parcel;
  final VoidCallback? onTap;
  final bool? selected;

  /// Extra content under the route (e.g. receiver details).
  final Widget? footer;

  @override
  Widget build(BuildContext context) {
    final palette = StaffPalette.of(context);
    final isSelected = selected == true;
    final reference = (parcel.trackingNumber?.isNotEmpty ?? false) ? parcel.trackingNumber! : 'Parcel';

    return Material(
      color: isSelected ? AppTheme.tecOrange.withValues(alpha: 0.12) : palette.surface(0.10),
      borderRadius: BorderRadius.circular(24),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(24),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: isSelected ? AppTheme.tecOrange : Colors.transparent, width: 1.5),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  if (selected != null) ...[
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 150),
                      width: 22,
                      height: 22,
                      decoration: BoxDecoration(
                        color: isSelected ? AppTheme.tecOrange : Colors.transparent,
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(color: isSelected ? AppTheme.tecOrange : palette.fg(0.4), width: 1.5),
                      ),
                      child: isSelected ? const Icon(Icons.check_rounded, size: 16, color: Colors.white) : null,
                    ),
                    const Gap(12),
                  ],
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
                                reference,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.outfit(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 0.5,
                                  color: palette.fg(),
                                ),
                              ),
                            ),
                            if (isExpressUrgency(parcel.urgency)) ...[const Gap(6), const ExpressBadge(small: true)],
                          ],
                        ),
                        Text(
                          DateFormat('d MMM · HH:mm').format(parcel.createdAt.toLocal()),
                          style: GoogleFonts.outfit(fontSize: 13, color: palette.fg(0.55)),
                        ),
                      ],
                    ),
                  ),
                  ParcelStatusBadge(status: parcel.status, small: true),
                ],
              ),
              const Gap(14),
              ParcelRouteStrip.of(parcel),
              const Gap(10),
              footer ??
                  Row(
                    children: [
                      HugeIcon(icon: HugeIcons.strokeRoundedUser, color: palette.fg(0.55), size: 16),
                      const Gap(6),
                      Expanded(
                        child: Text(
                          parcel.receiverName.isNotEmpty ? parcel.receiverName : 'Receiver not set',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.outfit(fontSize: 14, color: palette.fg(0.7)),
                        ),
                      ),
                      if (parcel.amount != null)
                        Text(
                          'TSh ${NumberFormat('#,###').format(parcel.amount)}',
                          style: GoogleFonts.outfit(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: AppTheme.tecOrange,
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

/// Search + scan row used by the operation screens.
class ParcelLookupBar extends StatelessWidget {
  const ParcelLookupBar({super.key, required this.field, required this.onScan});

  final Widget field;
  final VoidCallback onScan;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: field),
        const Gap(8),
        Tooltip(
          message: 'Scan parcel QR',
          child: Material(
            color: AppTheme.tecOrange,
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
