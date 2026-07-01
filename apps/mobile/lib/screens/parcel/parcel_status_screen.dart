import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:gap/gap.dart';
import '../../theme/app_theme.dart';
import '../../providers/parcel_provider.dart';
import '../../models/parcel_model.dart';
import '../../widgets/common/shimmer_utils.dart';

class ParcelStatusScreen extends StatefulWidget {
  final String parcelId;
  const ParcelStatusScreen({super.key, required this.parcelId});
  @override
  State<ParcelStatusScreen> createState() => _ParcelStatusScreenState();
}

class _ParcelStatusScreenState extends State<ParcelStatusScreen> {
  Timer? _timer;
  Map<String, dynamic>? _statusData;
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _poll();
    // Poll every 10 seconds
    _timer = Timer.periodic(const Duration(seconds: 10), (_) => _poll());
  }

  Future<void> _poll() async {
    final data = await context.read<ParcelProvider>().pollStatus(widget.parcelId);
    if (mounted && data != null) {
      setState(() { _statusData = data; _loading = false; });
      final status = data['status'] as String?;
      // Auto-navigate on key transitions
      if (status == 'PAYMENT_PENDING' && mounted) {
        _timer?.cancel();
        context.go('/parcel/${widget.parcelId}/payment');
      }
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final status = ParcelStatus.fromString(_statusData?['status'] ?? 'PENDING');
    final uiState = _statusData?['uiState'] as Map<String, dynamic>?;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text('Parcel #${widget.parcelId.substring(widget.parcelId.length - 6).toUpperCase()}'),
        leading: IconButton(
          icon: const HugeIcon(icon: HugeIcons.strokeRoundedArrowLeft01, color: Colors.white, size: 22),
          onPressed: () => context.go('/home'),
        ),
      ),
      body: _loading
          ? const _StatusSkeleton()
          : SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  const Gap(20),
                  // Status icon
                  _StatusIcon(status: status),
                  const Gap(24),
                  Text(status.displayLabel, style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900, color: AppTheme.textPrimary, letterSpacing: -0.5)),
                  const Gap(8),
                  Text(uiState?['message'] ?? '', textAlign: TextAlign.center, style: TextStyle(color: AppTheme.textSecondary, fontSize: 15)),
                  if (status == ParcelStatus.canceled && _statusData?['rejectionReason'] != null) ...[
                    const Gap(16),
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(color: AppTheme.danger.withValues(alpha: 0.06), borderRadius: BorderRadius.circular(12), border: Border.all(color: AppTheme.danger.withValues(alpha: 0.2))),
                      child: Text('Reason: ${_statusData!['rejectionReason']}', style: TextStyle(color: AppTheme.danger, fontWeight: FontWeight.w600)),
                    ),
                  ],
                  const Gap(40),
                  // Timeline
                  _Timeline(currentStatus: status),
                  const Gap(32),
                  // Actions
                  if (status == ParcelStatus.delivered)
                    SizedBox(
                      width: double.infinity,
                      height: 56,
                      child: ElevatedButton.icon(
                        icon: const Icon(Icons.receipt_long_outlined),
                        label: Text('View Receipt', style: GoogleFonts.inter(fontWeight: FontWeight.w700)),
                        onPressed: () => context.go('/parcel/${widget.parcelId}/receipt'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF3B82F6),
                          foregroundColor: Colors.white,
                          elevation: 0,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                        ),
                      ),
                    ),
                  if (status == ParcelStatus.received) ...[
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      const SizedBox(width: 16, height: 16, child: CircularProgressIndicator(strokeWidth: 2, color: Color(0xFF3B82F6))),
                      const Gap(10),
                      Text('Auto-refreshing every 10s', style: TextStyle(color: AppTheme.textSecondary, fontSize: 13)),
                    ]),
                    const Gap(12),
                  ],
                ],
              ),
            ),
    );
  }
}

class _StatusSkeleton extends StatelessWidget {
  const _StatusSkeleton();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          const Gap(20),
          const CircleSkeleton(size: 100),
          const Gap(32),
          const BoxSkeleton(width: 200, height: 24, borderRadius: 8),
          const Gap(40),
          // Timeline skeleton
          ...List.generate(4, (index) => Padding(
            padding: const EdgeInsets.only(bottom: 24),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CircleSkeleton(size: 28),
                const Gap(16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const BoxSkeleton(width: 120, height: 16),
                      const Gap(8),
                      const BoxSkeleton(width: double.infinity, height: 12),
                    ],
                  ),
                ),
              ],
            ),
          )),
        ],
      ),
    );
  }
}

class _StatusIcon extends StatelessWidget {
  final ParcelStatus status;
  const _StatusIcon({required this.status});

  Color get color {
    switch (status) {
      case ParcelStatus.received: return AppTheme.warning;
      case ParcelStatus.dispatched:
      case ParcelStatus.offloaded:
      case ParcelStatus.inTransit: return const Color(0xFF3B82F6);
      case ParcelStatus.atStation: return AppTheme.accent;
      case ParcelStatus.delivered: return AppTheme.success;
      case ParcelStatus.canceled: return AppTheme.danger;
    }
  }

  IconData get icon {
    switch (status) {
      case ParcelStatus.received: return Icons.inventory_2_outlined;
      case ParcelStatus.dispatched:
      case ParcelStatus.offloaded:
      case ParcelStatus.inTransit: return Icons.local_shipping_outlined;
      case ParcelStatus.atStation: return Icons.store_outlined;
      case ParcelStatus.delivered: return Icons.check_circle_outline;
      case ParcelStatus.canceled: return Icons.cancel_outlined;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100, height: 100,
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        shape: BoxShape.circle,
        border: Border.all(color: color.withValues(alpha: 0.3), width: 3),
      ),
      child: Icon(icon, color: color, size: 48),
    );
  }
}

class _Timeline extends StatelessWidget {
  final ParcelStatus currentStatus;
  const _Timeline({required this.currentStatus});

  static const _steps = [
    (ParcelStatus.received, 'Received', 'Package received at station'),
    (ParcelStatus.inTransit, 'In Transit', 'Package is on the way'),
    (ParcelStatus.atStation, 'At Station', 'Ready for delivery'),
    (ParcelStatus.delivered, 'Delivered', 'Shipment complete'),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final statusIndex = _steps.indexWhere((s) => s.$1 == currentStatus);
    final activeColor = theme.colorScheme.primary;

    return Column(
      children: _steps.asMap().entries.map((entry) {
        final i = entry.key;
        final step = entry.value;
        final isDone = i <= statusIndex;
        final isActive = i == statusIndex;

        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  width: 28, height: 28,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isDone ? activeColor : (theme.cardTheme.color ?? theme.cardColor),
                    border: Border.all(
                      color: isDone ? activeColor : theme.colorScheme.outline,
                      width: 2,
                    ),
                  ),
                  child: isDone ? const Icon(Icons.check, color: Colors.white, size: 14) : null,
                ),
                if (i < _steps.length - 1)
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    width: 2, height: 40,
                    color: i < statusIndex ? activeColor : theme.colorScheme.outline,
                  ),
              ],
            ),
            const Gap(16),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(step.$2, style: TextStyle(fontWeight: FontWeight.w700, color: isDone ? activeColor : theme.textTheme.bodyMedium?.color?.withValues(alpha: 0.6))),
                    if (isActive) Text(step.$3, style: TextStyle(fontSize: 12, color: theme.textTheme.bodyMedium?.color?.withValues(alpha: 0.8))),
                  ],
                ),
              ),
            ),
          ],
        );
      }).toList(),
    );
  }
}
