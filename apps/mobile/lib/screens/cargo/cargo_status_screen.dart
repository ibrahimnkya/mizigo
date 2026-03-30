import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:gap/gap.dart';
import '../../theme/app_theme.dart';
import '../../providers/cargo_provider.dart';
import '../../models/cargo_model.dart';

class CargoStatusScreen extends StatefulWidget {
  final String cargoId;
  const CargoStatusScreen({super.key, required this.cargoId});
  @override
  State<CargoStatusScreen> createState() => _CargoStatusScreenState();
}

class _CargoStatusScreenState extends State<CargoStatusScreen> {
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
    final data = await context.read<CargoProvider>().pollStatus(widget.cargoId);
    if (mounted && data != null) {
      setState(() { _statusData = data; _loading = false; });
      final status = data['status'] as String?;
      // Auto-navigate on key transitions
      if (status == 'PAYMENT_PENDING' && mounted) {
        _timer?.cancel();
        context.go('/cargo/${widget.cargoId}/payment');
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
    final status = CargoStatus.fromString(_statusData?['status'] ?? 'PENDING');
    final uiState = _statusData?['uiState'] as Map<String, dynamic>?;

    return Scaffold(
      backgroundColor: AppTheme.background,
      appBar: AppBar(
        title: Text('Cargo #${widget.cargoId.substring(widget.cargoId.length - 6).toUpperCase()}'),
        leading: IconButton(icon: const Icon(Icons.arrow_back), onPressed: () => context.go('/home')),
      ),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  const Gap(20),
                  // Status icon
                  _StatusIcon(status: status),
                  const Gap(24),
                  Text(status.displayLabel, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w900, color: AppTheme.textPrimary, letterSpacing: -0.5)),
                  const Gap(8),
                  Text(uiState?['message'] ?? '', textAlign: TextAlign.center, style: const TextStyle(color: AppTheme.textSecondary, fontSize: 15)),
                  if (status == CargoStatus.canceled && _statusData?['rejectionReason'] != null) ...[
                    const Gap(16),
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(color: AppTheme.danger.withValues(alpha: 0.06), borderRadius: BorderRadius.circular(12), border: Border.all(color: AppTheme.danger.withValues(alpha: 0.2))),
                      child: Text('Reason: ${_statusData!['rejectionReason']}', style: const TextStyle(color: AppTheme.danger, fontWeight: FontWeight.w600)),
                    ),
                  ],
                  const Gap(40),
                  // Timeline
                  _Timeline(currentStatus: status),
                  const Gap(32),
                  // Actions
                  if (status == CargoStatus.delivered)
                    SizedBox(
                      width: double.infinity,
                      height: 56,
                      child: ElevatedButton.icon(
                        icon: const Icon(Icons.receipt_long_outlined),
                        label: Text('View Receipt', style: GoogleFonts.inter(fontWeight: FontWeight.w700)),
                        onPressed: () => context.go('/cargo/${widget.cargoId}/receipt'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF3B82F6),
                          foregroundColor: Colors.white,
                          elevation: 0,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                        ),
                      ),
                    ),
                  if (status == CargoStatus.received) ...[
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      const SizedBox(width: 16, height: 16, child: CircularProgressIndicator(strokeWidth: 2, color: AppTheme.accent)),
                      const Gap(10),
                      const Text('Auto-refreshing every 10s', style: TextStyle(color: AppTheme.textMuted, fontSize: 13)),
                    ]),
                  ],
                ],
              ),
            ),
    );
  }
}

class _StatusIcon extends StatelessWidget {
  final CargoStatus status;
  const _StatusIcon({required this.status});

  Color get color {
    switch (status) {
      case CargoStatus.received: return AppTheme.warning;
      case CargoStatus.inTransit: return const Color(0xFF3B82F6);
      case CargoStatus.atStation: return AppTheme.accent;
      case CargoStatus.delivered: return AppTheme.success;
      case CargoStatus.canceled: return AppTheme.danger;
    }
  }

  IconData get icon {
    switch (status) {
      case CargoStatus.received: return Icons.inventory_2_outlined;
      case CargoStatus.inTransit: return Icons.local_shipping_outlined;
      case CargoStatus.atStation: return Icons.store_outlined;
      case CargoStatus.delivered: return Icons.check_circle_outline;
      case CargoStatus.canceled: return Icons.cancel_outlined;
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
  final CargoStatus currentStatus;
  const _Timeline({required this.currentStatus});

  static const _steps = [
    (CargoStatus.received, 'Received', 'Package received at station'),
    (CargoStatus.inTransit, 'In Transit', 'Package is on the way'),
    (CargoStatus.atStation, 'At Station', 'Ready for delivery'),
    (CargoStatus.delivered, 'Delivered', 'Shipment complete'),
  ];

  @override
  Widget build(BuildContext context) {
    final statusIndex = _steps.indexWhere((s) => s.$1 == currentStatus);

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
                    color: isDone ? AppTheme.accent : Colors.white,
                    border: Border.all(color: isDone ? AppTheme.accent : AppTheme.border, width: 2),
                  ),
                  child: isDone ? const Icon(Icons.check, color: Colors.white, size: 14) : null,
                ),
                if (i < _steps.length - 1)
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    width: 2, height: 40,
                    color: i < statusIndex ? AppTheme.accent : AppTheme.border,
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
                    Text(step.$2, style: TextStyle(fontWeight: FontWeight.w700, color: isDone ? AppTheme.accent : AppTheme.textMuted)),
                    if (isActive) Text(step.$3, style: const TextStyle(fontSize: 12, color: AppTheme.textSecondary)),
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
