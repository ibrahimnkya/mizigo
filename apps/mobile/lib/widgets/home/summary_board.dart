import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hugeicons/hugeicons.dart';

class SummaryBoard extends StatelessWidget {
  final int received;
  final int inTransit;
  final int delivered;

  const SummaryBoard({
    super.key,
    this.received = 0,
    this.inTransit = 0,
    this.delivered = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Row(
        children: [
          Expanded(
            child: _SummaryCard(
              label: 'Received',
              count: received,
              icon: HugeIcons.strokeRoundedPackageReceive,
              color: const Color(0xFF3B82F6),
            ),
          ),
          const Gap(12),
          Expanded(
            child: _SummaryCard(
              label: 'In Transit',
              count: inTransit,
              icon: HugeIcons.strokeRoundedSpeedTrain02,
              color: const Color(0xFFF59E0B),
            ),
          ),
          const Gap(12),
          Expanded(
            child: _SummaryCard(
              label: 'Delivered',
              count: delivered,
              icon: HugeIcons.strokeRoundedCheckmarkBadge01,
              color: const Color(0xFF10B981),
            ),
          ),
        ],
      ),
    );
  }
}

class _SummaryCard extends StatelessWidget {
  final String label;
  final int count;
  final dynamic icon;
  final Color color;

  const _SummaryCard({
    required this.label,
    required this.count,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1E293B),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.05),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: HugeIcon(
              icon: icon,
              color: color,
              size: 20,
            ),
          ),
          const Gap(12),
          Text(
            count.toString(),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
          const Gap(4),
          Text(
            label,
            style: const TextStyle(
              color: Color(0xFF94A3B8),
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
