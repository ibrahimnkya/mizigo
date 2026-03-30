import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:intl/intl.dart';

import '../../models/cargo_model.dart';
import '../../services/api_service.dart';
import '../../widgets/common/neo_container.dart';


class OperatorScannedDetailsScreen extends StatefulWidget {
  final CargoModel cargo;

  const OperatorScannedDetailsScreen({super.key, required this.cargo});

  @override
  State<OperatorScannedDetailsScreen> createState() =>
      _OperatorScannedDetailsScreenState();
}

class _OperatorScannedDetailsScreenState
    extends State<OperatorScannedDetailsScreen> {
  late CargoModel cargo;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    cargo = widget.cargo;
  }

  Future<void> _updateStatus(String newStatus) async {
    setState(() => _isLoading = true);
    try {
      await ApiService.updateCargoStatus(cargo.id, newStatus);
      final updatedJson = await ApiService.getCargoById(cargo.id);
      setState(() {
        cargo = CargoModel.fromJson(updatedJson);
      });
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Cargo updated to $newStatus'),
            backgroundColor: Colors.green,
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to update status: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  Future<void> _confirmDelivery() async {
    final otpControllers = List.generate(4, (_) => TextEditingController());
    final focusNodes = List.generate(4, (_) => FocusNode());
    bool verified = false;

    await showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (sheetCtx) {
        return StatefulBuilder(builder: (ctx, setSheetState) {
          final isDark = Theme.of(ctx).brightness == Brightness.dark;
          return Padding(
            padding: EdgeInsets.only(bottom: MediaQuery.of(ctx).viewInsets.bottom),
            child: Container(
              decoration: BoxDecoration(
                color: isDark ? const Color(0xFF1E293B) : Colors.white,
                borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
              ),
              padding: const EdgeInsets.fromLTRB(24, 16, 24, 32),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Handle bar
                  Container(
                    width: 40, height: 4,
                    decoration: BoxDecoration(
                      color: isDark ? const Color(0xFF475569) : const Color(0xFFE2E8F0),
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                  const Gap(24),
                  Container(
                    width: 64, height: 64,
                    decoration: BoxDecoration(
                      color: const Color(0xFF10B981).withValues(alpha: 0.1),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.verified_user_outlined, color: Color(0xFF10B981), size: 32),
                  ),
                  const Gap(16),
                  Text(
                    'Verify Delivery',
                    style: GoogleFonts.outfit(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: isDark ? Colors.white : const Color(0xFF0F172A),
                    ),
                  ),
                  const Gap(8),
                  Text(
                    'Ask the receiver for their 4-digit delivery code',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      color: const Color(0xFF64748B),
                    ),
                  ),
                  const Gap(32),
                  // OTP boxes
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(4, (i) {
                      return Container(
                        margin: const EdgeInsets.symmetric(horizontal: 8),
                        width: 60,
                        height: 64,
                        decoration: BoxDecoration(
                          color: isDark ? const Color(0xFF0F172A) : const Color(0xFFF8FAFC),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: isDark ? const Color(0xFF334155) : const Color(0xFFE2E8F0),
                            width: 1.5,
                          ),
                        ),
                        child: TextField(
                          controller: otpControllers[i],
                          focusNode: focusNodes[i],
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                          maxLength: 1,
                          style: GoogleFonts.outfit(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: isDark ? Colors.white : const Color(0xFF0F172A),
                          ),
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            counterText: '',
                          ),
                          onChanged: (val) {
                            if (val.isNotEmpty && i < 3) {
                              FocusScope.of(ctx).requestFocus(focusNodes[i + 1]);
                            } else if (val.isEmpty && i > 0) {
                              FocusScope.of(ctx).requestFocus(focusNodes[i - 1]);
                            }
                            setSheetState(() {});
                          },
                        ),
                      );
                    }),
                  ),
                  const Gap(32),
                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: ElevatedButton(
                      onPressed: () {
                        final otp = otpControllers.map((c) => c.text).join();
                        if (otp.length == 4) {
                          // OTP validation: In production, verify server-side.
                          // For MVP we accept any 4-digit code.
                          verified = true;
                          Navigator.pop(sheetCtx);
                        } else {
                          ScaffoldMessenger.of(ctx).showSnackBar(
                            const SnackBar(
                              content: Text('Enter the full 4-digit code'),
                              backgroundColor: Colors.orange,
                            ),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF10B981),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                        elevation: 0,
                      ),
                      child: Text(
                        'Confirm Delivery',
                        style: GoogleFonts.outfit(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
      },
    );

    if (verified && mounted) {
      final otp = otpControllers.map((c) => c.text).join();
      setState(() => _isLoading = true);
      try {
        await ApiService.deliverCargo(cargo.id, otp);
        final updatedJson = await ApiService.getCargoById(cargo.id);
        setState(() {
          cargo = CargoModel.fromJson(updatedJson);
          _isLoading = false;
        });
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Cargo marked as Delivered ✓'),
              backgroundColor: Color(0xFF10B981),
            ),
          );
        }
      } catch (e) {
        if (mounted) {
          setState(() => _isLoading = false);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Failed: $e'), backgroundColor: Colors.red),
          );
        }
      }
    }
  }

  Future<void> _cancelCargo() async {
    final reasonController = TextEditingController();
    final shouldCancel = await showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Theme.of(context).colorScheme.surface,
          title: Text('Cancel Cargo', style: GoogleFonts.outfit()),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Are you sure you want to cancel this cargo?',
                style: GoogleFonts.inter(),
              ),
              const Gap(16),
              TextField(
                controller: reasonController,
                decoration: const InputDecoration(
                  labelText: 'Reason for cancellation',
                  border: OutlineInputBorder(),
                ),
                maxLines: 3,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: const Text('Go Back'),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              onPressed: () => Navigator.pop(context, true),
              child: const Text('Confirm Cancel', style: TextStyle(color: Colors.white)),
            ),
          ],
        );
      },
    );

    if (shouldCancel == true && reasonController.text.isNotEmpty) {
      await _updateStatus('Canceled');
    } else if (shouldCancel == true) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Cancellation reason is required'), backgroundColor: Colors.red),
        );
      }
    }
  }

  void _printReceipt() {
    // Navigating back to the receipt screen or showing dialog
    context.push('/cargo/${cargo.id}/receipt');
  }

  Widget _buildTimelineEntry({
    required String label,
    required String time,
    required bool done,
    bool isLast = false,
    bool isFailed = false,
  }) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final color = isFailed
        ? const Color(0xFFE11D48)
        : done
            ? const Color(0xFF10B981)
            : const Color(0xFF64748B);

    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            width: 32,
            child: Column(
              children: [
                Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: done || isFailed
                        ? color.withValues(alpha: 0.2)
                        : (isDark ? const Color(0xFF1E293B) : const Color(0xFFF1F5F9)),
                    border: Border.all(
                      color: done || isFailed
                          ? color
                          : const Color(0xFF94A3B8),
                      width: 2,
                    ),
                  ),
                  child: Center(
                    child: done
                        ? Icon(isFailed ? Icons.close : Icons.check, size: 14, color: color)
                        : null,
                  ),
                ),
                if (!isLast)
                  Expanded(
                    child: Container(
                      width: 2,
                      color: done ? color : const Color(0xFFE2E8F0),
                    ),
                  ),
              ],
            ),
          ),
          const Gap(16),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: GoogleFonts.outfit(
                      fontSize: 16,
                      fontWeight: done ? FontWeight.w600 : FontWeight.w500,
                      color: done
                          ? (isDark ? Colors.white : Colors.black)
                          : const Color(0xFF94A3B8),
                    ),
                  ),
                  const Gap(4),
                  Text(
                    time,
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      color: const Color(0xFF64748B),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    
    // Status color logic matching recent_bookings_screen
    final Color statusBg = switch (cargo.status) {
      CargoStatus.delivered =>
        isDark ? const Color(0xFF052E16) : const Color(0xFFF0FDF4),
      CargoStatus.inTransit || CargoStatus.atStation =>
        isDark ? const Color(0xFF1E3A5F) : const Color(0xFFEFF6FF),
      CargoStatus.canceled =>
        isDark ? const Color(0xFF3B0764) : const Color(0xFFFFF1F2),
      CargoStatus.received =>
        isDark ? const Color(0xFF1C1917) : const Color(0xFFF8FAFC),
    };

    final Color statusFg = switch (cargo.status) {
      CargoStatus.delivered => const Color(0xFF16A34A),
      CargoStatus.inTransit || CargoStatus.atStation => const Color(0xFF2563EB),
      CargoStatus.canceled => const Color(0xFFE11D48),
      CargoStatus.received => const Color(0xFF64748B),
    };

    // Determine available CTAs based on status
    final canDispatch = cargo.status == CargoStatus.received;
    final canDeliver = cargo.status == CargoStatus.inTransit || cargo.status == CargoStatus.atStation;
    final canCancel = cargo.status == CargoStatus.received;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(
          'Cargo Details',
          style: GoogleFonts.outfit(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          if (canCancel)
            PopupMenuButton<String>(
              onSelected: (value) {
                if (value == 'cancel') {
                  _cancelCargo();
                }
              },
              itemBuilder: (context) => [
                PopupMenuItem(
                  value: 'cancel',
                  child: Row(
                    children: [
                      HugeIcon(
                        icon: HugeIcons.strokeRoundedCancelCircle,
                        color: Colors.red,
                        size: 20,
                      ),
                      const Gap(8),
                      Text('Cancel Cargo', style: GoogleFonts.inter(color: Colors.red)),
                    ],
                  ),
                ),
              ],
              icon: HugeIcon(
                icon: HugeIcons.strokeRoundedMoreVerticalCircle01,
                color: isDark ? Colors.white : Colors.black,
              ),
            ),
        ],
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  NeoContainer(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '#${cargo.id.toUpperCase().length > 8 ? cargo.id.toUpperCase().substring(0, 8) : cargo.id.toUpperCase()}',
                              style: GoogleFonts.outfit(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 6,
                              ),
                              decoration: BoxDecoration(
                                color: statusBg,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                cargo.status.name.toUpperCase(),
                                style: GoogleFonts.outfit(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: statusFg,
                                  letterSpacing: 0.5,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Gap(24),
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'SENDER',
                                    style: GoogleFonts.outfit(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: const Color(0xFF64748B),
                                      letterSpacing: 1,
                                    ),
                                  ),
                                  const Gap(4),
                                  Text(
                                    cargo.fromAddress,
                                    style: GoogleFonts.inter(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'RECEIVER',
                                    style: GoogleFonts.outfit(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: const Color(0xFF64748B),
                                      letterSpacing: 1,
                                    ),
                                  ),
                                  const Gap(4),
                                  Text(
                                    cargo.receiverName,
                                    style: GoogleFonts.inter(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const Gap(24),
                  
                  // Action Buttons
                  if (canDispatch || canDeliver || true) ...[
                    Text(
                      'Actions',
                      style: GoogleFonts.outfit(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Gap(16),
                    Row(
                      children: [
                        if (canDispatch)
                          Expanded(
                            child: ElevatedButton.icon(
                              onPressed: () => _updateStatus('In Transit'),
                              icon: const HugeIcon(icon: HugeIcons.strokeRoundedDeliveryTruck01, color: Colors.white, size: 20),
                              label: const Text('Dispatch', style: TextStyle(color: Colors.white)),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF3B82F6),
                                padding: const EdgeInsets.symmetric(vertical: 16),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                              ),
                            ),
                          ),
                        if (canDeliver)
                          Expanded(
                            child: ElevatedButton.icon(
                              onPressed: _confirmDelivery,
                              icon: const HugeIcon(icon: HugeIcons.strokeRoundedPackageDelivered, color: Colors.white, size: 20),
                              label: const Text('Deliver', style: TextStyle(color: Colors.white)),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF10B981),
                                padding: const EdgeInsets.symmetric(vertical: 16),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                              ),
                            ),
                          ),
                        if (canDispatch || canDeliver) const Gap(12),
                        Expanded(
                          child: OutlinedButton.icon(
                            onPressed: _printReceipt,
                            icon: HugeIcon(icon: HugeIcons.strokeRoundedPrinter, color: isDark ? Colors.white : Colors.black, size: 20),
                            label: Text('Print Receipt', style: TextStyle(color: isDark ? Colors.white : Colors.black)),
                            style: OutlinedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Gap(32),
                  ],

                  Text(
                    'Cargo Timeline',
                    style: GoogleFonts.outfit(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Gap(16),
                  NeoContainer(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        _buildTimelineEntry(
                          label: 'Received',
                          time: DateFormat('d MMM · HH:mm').format(cargo.createdAt),
                          done: true,
                        ),
                        _buildTimelineEntry(
                          label: 'In Transit',
                          time: DateFormat('d MMM').format(cargo.updatedAt),
                          done: cargo.status != CargoStatus.received && cargo.status != CargoStatus.canceled,
                        ),
                        _buildTimelineEntry(
                          label: 'At Station',
                          time: DateFormat('d MMM').format(cargo.updatedAt),
                          done: cargo.status == CargoStatus.atStation || cargo.status == CargoStatus.delivered,
                        ),
                        _buildTimelineEntry(
                          label: cargo.status == CargoStatus.canceled ? 'Canceled' : 'Delivered',
                          time: cargo.status == CargoStatus.delivered || cargo.status == CargoStatus.canceled
                              ? DateFormat('d MMM').format(cargo.updatedAt)
                              : 'Pending',
                          done: cargo.status == CargoStatus.delivered,
                          isLast: true,
                          isFailed: cargo.status == CargoStatus.canceled,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
