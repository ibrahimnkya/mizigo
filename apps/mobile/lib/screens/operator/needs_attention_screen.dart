import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:provider/provider.dart';

import '../../models/parcel_model.dart';
import '../../providers/auth_provider.dart';
import '../../providers/parcel_provider.dart';
import '../../theme/staff_palette.dart';
import '../../widgets/staff/bridge_card.dart';
import '../../widgets/staff/parcel_cards.dart';
import '../../widgets/staff/staff_settings.dart';

/// A group of parcels waiting on the same next step.
class AttentionGroup {
  const AttentionGroup({
    required this.title,
    required this.hint,
    required this.actionLabel,
    required this.route,
    required this.icon,
    required this.statuses,
  });

  final String title;
  final String hint;
  final String actionLabel;
  final String route;
  final List<List<dynamic>> icon;
  final Set<ParcelStatus> statuses;
}

const _dispatchGroup = AttentionGroup(
  title: 'Ready to dispatch',
  hint: 'Received and waiting for a wagon',
  actionLabel: 'Dispatch',
  route: '/send-parcel',
  icon: HugeIcons.strokeRoundedSpeedTrain01,
  statuses: {ParcelStatus.received},
);
const _offloadGroup = AttentionGroup(
  title: 'In transit',
  hint: 'Offload them when the train arrives',
  actionLabel: 'Offload',
  route: '/offload-parcel',
  icon: HugeIcons.strokeRoundedPackageReceive,
  statuses: {ParcelStatus.inTransit, ParcelStatus.dispatched},
);
const _deliverGroup = AttentionGroup(
  title: 'Waiting for pickup',
  hint: 'Hand over with the receiver’s code',
  actionLabel: 'Deliver',
  route: '/deliver-parcel',
  icon: HugeIcons.strokeRoundedPackageDelivered,
  statuses: {ParcelStatus.atStation, ParcelStatus.offloaded},
);

/// The next-step groups that apply to [role].
List<AttentionGroup> attentionGroupsFor(String role) => switch (role) {
  'CLERK' => const [_deliverGroup],
  'TRAIN_GUARD' => const [_dispatchGroup, _offloadGroup],
  _ => const [_dispatchGroup, _offloadGroup, _deliverGroup],
};

/// Every parcel waiting on [role]'s next step, oldest first.
List<ParcelModel> parcelsNeedingAttention(String role, List<ParcelModel> parcels) {
  final statuses = {for (final g in attentionGroupsFor(role)) ...g.statuses};
  return parcels.where((p) => statuses.contains(p.status)).toList()..sort((a, b) => a.createdAt.compareTo(b.createdAt));
}

/// All parcels that need the signed-in user's next step, grouped by step.
class NeedsAttentionScreen extends StatefulWidget {
  const NeedsAttentionScreen({super.key});

  @override
  State<NeedsAttentionScreen> createState() => _NeedsAttentionScreenState();
}

class _NeedsAttentionScreenState extends State<NeedsAttentionScreen> {
  /// Selected group filter; null shows every group.
  AttentionGroup? _filter;

  static String _age(DateTime since) {
    final d = DateTime.now().difference(since);
    if (d.inDays >= 1) return '${d.inDays} day${d.inDays == 1 ? '' : 's'}';
    if (d.inHours >= 1) return '${d.inHours} hr${d.inHours == 1 ? '' : 's'}';
    return '${d.inMinutes.clamp(1, 59)} min';
  }

  @override
  Widget build(BuildContext context) {
    final palette = StaffPalette.of(context);
    final role = context.watch<AuthProvider>().user?.role?.toUpperCase() ?? '';
    final provider = context.watch<ParcelProvider>();
    final waiting = parcelsNeedingAttention(role, provider.parcels);
    final groups = [
      for (final g in attentionGroupsFor(role)) (g, waiting.where((p) => g.statuses.contains(p.status)).toList()),
    ];
    final shown = groups.where((e) => e.$2.isNotEmpty && (_filter == null || _filter == e.$1)).toList();
    final overdue = waiting.where((p) => DateTime.now().difference(p.createdAt).inDays >= 2).length;

    return StaffSettingsScaffold(
      title: 'Needs Attention',
      onBack: () => context.pop(),
      onRefresh: () => context.read<ParcelProvider>().fetchMyParcels(),
      children: [
        // ── Summary ──
        BridgeCard(
          colors: const [Color(0xFF7A1424), Color(0xFF3A060E)],
          child: _Summary(
            total: waiting.length,
            oldest: waiting.isEmpty ? null : _age(waiting.first.createdAt),
            overdue: overdue,
            groups: [for (final (g, list) in groups) (g, list.length)],
          ),
        ),

        if (waiting.isEmpty) ...[
          const Gap(16),
          StaffGlassCard(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                Container(
                  width: 64,
                  height: 64,
                  decoration: BoxDecoration(color: kStaffSuccess.withValues(alpha: 0.16), shape: BoxShape.circle),
                  child: const Center(
                    child: HugeIcon(icon: HugeIcons.strokeRoundedCheckmarkCircle02, color: kStaffSuccess, size: 32),
                  ),
                ),
                const Gap(14),
                Text(
                  'All caught up',
                  style: GoogleFonts.outfit(fontSize: 19, fontWeight: FontWeight.w700, color: palette.fg()),
                ),
                const Gap(4),
                Text(
                  'No parcels are waiting on your next step. Pull down to refresh.',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.outfit(fontSize: 14, height: 1.4, color: palette.fg(0.6)),
                ),
              ],
            ),
          ),
        ] else ...[
          // ── Filters (only when there's more than one kind of work) ──
          if (groups.where((e) => e.$2.isNotEmpty).length > 1) ...[
            const Gap(16),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  StaffChoiceChip(
                    label: 'All · ${waiting.length}',
                    selected: _filter == null,
                    onTap: () => setState(() => _filter = null),
                  ),
                  for (final (g, list) in groups)
                    if (list.isNotEmpty) ...[
                      const Gap(8),
                      StaffChoiceChip(
                        label: '${g.actionLabel} · ${list.length}',
                        selected: _filter == g,
                        onTap: () => setState(() => _filter = g),
                      ),
                    ],
                ],
              ),
            ),
          ],

          // ── Groups ──
          for (final (g, list) in shown) ...[
            const Gap(20),
            _GroupHeader(group: g, count: list.length),
            const Gap(12),
            for (final p in list)
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: ParcelSummaryCard(
                  parcel: p,
                  onTap: () => context.push('/operator/scanned-details', extra: p),
                  footer: _WaitingFooter(parcel: p, age: _age(p.createdAt)),
                ),
              ),
          ],
        ],
      ],
    );
  }
}

class _Summary extends StatelessWidget {
  const _Summary({required this.total, required this.oldest, required this.overdue, required this.groups});

  final int total;
  final String? oldest;
  final int overdue;
  final List<(AttentionGroup, int)> groups;

  @override
  Widget build(BuildContext context) {
    final white75 = Colors.white.withValues(alpha: 0.75);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.18),
                borderRadius: BorderRadius.circular(999),
              ),
              child: Text(
                'Your queue',
                style: GoogleFonts.outfit(fontSize: 13, fontWeight: FontWeight.w600, color: Colors.white),
              ),
            ),
            const Spacer(),
            if (overdue > 0)
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(color: kStaffAccent, borderRadius: BorderRadius.circular(999)),
                child: Text(
                  '$overdue waiting 2+ days',
                  style: GoogleFonts.outfit(fontSize: 12.5, fontWeight: FontWeight.w700, color: Colors.white),
                ),
              ),
          ],
        ),
        const Gap(16),
        if (total == 0) ...[
          Text(
            'Nothing waiting',
            style: GoogleFonts.outfit(fontSize: 24, fontWeight: FontWeight.w700, color: Colors.white),
          ),
          Text('New work will appear here as it comes in.', style: GoogleFonts.outfit(fontSize: 14, color: white75)),
        ] else ...[
          Text('Parcels waiting on you', style: GoogleFonts.outfit(fontSize: 14, color: white75)),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '$total',
                style: GoogleFonts.outfit(fontSize: 42, fontWeight: FontWeight.w800, height: 1.1, color: Colors.white),
              ),
              const Gap(10),
              if (oldest != null)
                Padding(
                  padding: const EdgeInsets.only(bottom: 7),
                  child: Text('oldest $oldest', style: GoogleFonts.outfit(fontSize: 14, color: white75)),
                ),
            ],
          ),
        ],
        const Gap(14),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 6),
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.12),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            children: [
              for (var i = 0; i < groups.length; i++) ...[
                if (i > 0) Container(width: 1, height: 32, color: Colors.white.withValues(alpha: 0.2)),
                Expanded(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          HugeIcon(icon: groups[i].$1.icon, color: kStaffAccent, size: 15),
                          const Gap(5),
                          Text(
                            groups[i].$2 == 0 ? '–' : '${groups[i].$2}',
                            style: GoogleFonts.outfit(fontSize: 17, fontWeight: FontWeight.w700, color: Colors.white),
                          ),
                        ],
                      ),
                      Text(groups[i].$1.actionLabel, style: GoogleFonts.outfit(fontSize: 12.5, color: white75)),
                    ],
                  ),
                ),
              ],
            ],
          ),
        ),
      ],
    );
  }
}

/// Section title with the step's icon, hint and a button to go do it.
class _GroupHeader extends StatelessWidget {
  const _GroupHeader({required this.group, required this.count});

  final AttentionGroup group;
  final int count;

  @override
  Widget build(BuildContext context) {
    final palette = StaffPalette.of(context);
    return Row(
      children: [
        Container(
          width: 42,
          height: 42,
          decoration: BoxDecoration(
            color: kStaffAccent.withValues(alpha: 0.16),
            borderRadius: BorderRadius.circular(14),
          ),
          child: Center(
            child: HugeIcon(icon: group.icon, color: kStaffAccent, size: 21),
          ),
        ),
        const Gap(12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Flexible(
                    child: Text(
                      group.title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.outfit(fontSize: 18, fontWeight: FontWeight.w700, color: palette.fg()),
                    ),
                  ),
                  const Gap(8),
                  Text('$count', style: GoogleFonts.outfit(fontSize: 16, color: palette.fg(0.5))),
                ],
              ),
              Text(
                group.hint,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.outfit(fontSize: 13, color: palette.fg(0.6)),
              ),
            ],
          ),
        ),
        const Gap(8),
        Material(
          color: kStaffAccent,
          borderRadius: BorderRadius.circular(999),
          child: InkWell(
            onTap: () => context.push(group.route),
            borderRadius: BorderRadius.circular(999),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(14, 8, 10, 8),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    group.actionLabel,
                    style: GoogleFonts.outfit(fontSize: 14, fontWeight: FontWeight.w700, color: Colors.white),
                  ),
                  const Gap(4),
                  const HugeIcon(icon: HugeIcons.strokeRoundedArrowRight02, color: Colors.white, size: 16),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

/// Receiver on the left, how long it's been waiting on the right
/// (highlighted once it's been 2+ days).
class _WaitingFooter extends StatelessWidget {
  const _WaitingFooter({required this.parcel, required this.age});

  final ParcelModel parcel;
  final String age;

  @override
  Widget build(BuildContext context) {
    final palette = StaffPalette.of(context);
    final late = DateTime.now().difference(parcel.createdAt).inDays >= 2;
    final color = late ? kStaffAccent : palette.fg(0.6);
    return Row(
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
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
          decoration: BoxDecoration(
            color: late ? kStaffAccent.withValues(alpha: 0.16) : palette.surface(0.10),
            borderRadius: BorderRadius.circular(999),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              HugeIcon(icon: HugeIcons.strokeRoundedClock01, color: color, size: 13),
              const Gap(4),
              Text(
                'Waiting $age',
                style: GoogleFonts.outfit(fontSize: 12.5, fontWeight: FontWeight.w600, color: color),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
