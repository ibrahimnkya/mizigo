import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:intl/intl.dart';

import '../../models/parcel_model.dart';
import '../../services/api_service.dart';
import '../../theme/app_theme.dart';
import '../../widgets/common/neo_container.dart';


class OperatorScannedDetailsScreen extends StatefulWidget {
  final ParcelModel parcel;

  const OperatorScannedDetailsScreen({super.key, required this.parcel});

  @override
  State<OperatorScannedDetailsScreen> createState() =>
      _OperatorScannedDetailsScreenState();
}

class _OperatorScannedDetailsScreenState
    extends State<OperatorScannedDetailsScreen> {
  late ParcelModel parcel;
  bool _isLoading = false;

  Future<void> _showDispatchDialog() async {
    String? selectedTrain;
    String? selectedGuard;
    final List<String> mockTrains = ['SGR Express 01', 'Cargo Liner 402', 'LRT Shuttle 09'];
    final List<String> mockGuards = ['Juma Kapuya', 'Sarah Mwasame', 'Bakari Jenge'];

    final result = await showDialog<Map<String, String>>(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setDialogState) => AlertDialog(
          backgroundColor: AppTheme.surface,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
          title: Text(
            'Dispatch Assignment',
            style: GoogleFonts.outfit(
              color: AppTheme.textPrimary,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildDialogDropdown(
                context,
                hint: 'Select Train',
                value: selectedTrain,
                items: mockTrains,
                onChanged: (val) => setDialogState(() => selectedTrain = val),
              ),
              const Gap(16),
              _buildDialogDropdown(
                context,
                hint: 'Select Guard',
                value: selectedGuard,
                items: mockGuards,
                onChanged: (val) => setDialogState(() => selectedGuard = val),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(
                'Cancel', 
                style: const TextStyle(
                  color: Color(0xFF64748B),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: (selectedTrain == null || selectedGuard == null) 
                ? null 
                : () => Navigator.pop(context, {'train': selectedTrain!, 'guard': selectedGuard!}),
              style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF3B82F6)),
              child: const Text('Dispatch', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );

    if (result != null) {
      await _updateStatus('In Transit', 
        location: 'Loaded on ${result['train']} (Guard: ${result['guard']})');
    }
  }

  Widget _buildDialogDropdown(
    BuildContext context, {
    required String hint,
    required String? value,
    required List<String> items,
    required Function(String?) onChanged,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: AppTheme.background,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppTheme.border),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: value,
          hint: Text(
            hint,
            style: const TextStyle(
              color: Color(0xFF94A3B8),
              fontSize: 14,
            ),
          ),
          dropdownColor: AppTheme.surface,
          isExpanded: true,
          items: items.map((c) => DropdownMenuItem(
            value: c,
            child: Text(
              c,
              style: const TextStyle(
                color: Color(0xFF0F172A),
                fontSize: 14,
              ),
            ),
          )).toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    parcel = widget.parcel;
  }

  Future<void> _showOffloadDialog() async {
    String? selectedClerk;
    final List<String> mockClerks = ['Kassim Majaliwa', 'Neema Shayo', 'Said Mwema'];

    final result = await showDialog<String>(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppTheme.surface,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        title: Text(
          'Assign Clerk',
          style: GoogleFonts.outfit(
            color: AppTheme.textPrimary,
            fontWeight: FontWeight.bold,
          ),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Select the destination clerk who will receive this parcel.',
              style: GoogleFonts.inter(
                color: AppTheme.textSecondary,
                fontSize: 13,
              ),
            ),
            const Gap(20),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: AppTheme.background,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppTheme.border),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: selectedClerk,
                  hint: const Text(
                    'Select Clerk',
                    style: TextStyle(
                      color: Color(0xFF94A3B8),
                    ),
                  ),
                  dropdownColor: AppTheme.surface,
                  isExpanded: true,
                  items: mockClerks.map((c) => DropdownMenuItem(
                    value: c,
                    child: Text(
                      c,
                      style: const TextStyle(
                        color: Color(0xFF0F172A),
                      ),
                    ),
                  )).toList(),
                  onChanged: (val) => Navigator.pop(context, val),
                ),
              ),
            ),
          ],
        ),
      ),
    );

    if (result != null) {
      await _updateStatus('Offloaded', location: 'Received by Clerk: $result');
    }
  }

  Future<void> _updateStatus(String newStatus, {String? location}) async {
    setState(() => _isLoading = true);
    try {
      await ApiService.updateParcelStatus(parcel.id, newStatus, location: location);
      final updatedJson = await ApiService.getParcelById(parcel.id);
      setState(() {
        parcel = ParcelModel.fromJson(updatedJson);
      });
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Parcel updated to $newStatus'),
            backgroundColor: const Color(0xFF10B981),
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed: $e'), backgroundColor: Colors.red),
        );
      }
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  Future<void> _confirmDelivery() async {
    final otpControllers = List.generate(6, (_) => TextEditingController());
    final focusNodes = List.generate(6, (_) => FocusNode());
    bool verified = false;

    await showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (sheetCtx) {
        return StatefulBuilder(builder: (ctx, setSheetState) {
          return Padding(
            padding: EdgeInsets.only(bottom: MediaQuery.of(ctx).viewInsets.bottom),
            child: Container(
              decoration: BoxDecoration(
                color: AppTheme.surface,
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
                      color: AppTheme.border,
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
                      color: AppTheme.textPrimary,
                    ),
                  ),
                  const Gap(8),
                  Text(
                    'Ask the receiver for their 6-digit delivery code',
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
                    children: List.generate(6, (i) {
                      return Container(
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        width: 48,
                        height: 56,
                        decoration: BoxDecoration(
                          color: AppTheme.background,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: AppTheme.border,
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
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: AppTheme.textPrimary,
                          ),
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            counterText: '',
                          ),
                          onChanged: (val) {
                            if (val.isNotEmpty && i < 5) {
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
                        if (otp.length == 6) {
                          verified = true;
                          Navigator.pop(sheetCtx);
                        } else {
                          ScaffoldMessenger.of(ctx).showSnackBar(
                            const SnackBar(
                              content: Text('Please enter a valid 6-digit code.'),
                              backgroundColor: Colors.redAccent,
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
        await ApiService.deliverParcel(parcel.id, otp);
        final updatedJson = await ApiService.getParcelById(parcel.id);
        setState(() {
          parcel = ParcelModel.fromJson(updatedJson);
          _isLoading = false;
        });
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Parcel marked as Delivered ✓'),
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

  Future<void> _cancelParcel() async {
    final reasonController = TextEditingController();
    final shouldCancel = await showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Theme.of(context).colorScheme.surface,
          title: Text('Cancel Parcel', style: GoogleFonts.outfit()),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Are you sure you want to cancel this parcel?',
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
    context.push('/parcel/${parcel.id}/receipt');
  }

  Widget _buildTimelineEntry({
    required String label,
    required String time,
    required bool done,
    bool isLast = false,
    bool isFailed = false,
  }) {
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
                        : AppTheme.background,
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
                          ? AppTheme.textPrimary
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
    final Color statusBg = switch (parcel.status) {
      ParcelStatus.delivered => const Color(0xFFF0FDF4),
      ParcelStatus.inTransit || ParcelStatus.atStation || ParcelStatus.dispatched || ParcelStatus.offloaded => const Color(0xFFEFF6FF),
      ParcelStatus.canceled => const Color(0xFFFFF1F2),
      ParcelStatus.received => const Color(0xFFF8FAFC),
    };

    final Color statusFg = switch (parcel.status) {
      ParcelStatus.delivered => const Color(0xFF16A34A),
      ParcelStatus.inTransit || ParcelStatus.atStation || ParcelStatus.dispatched || ParcelStatus.offloaded => const Color(0xFF2563EB),
      ParcelStatus.canceled => const Color(0xFFE11D48),
      ParcelStatus.received => const Color(0xFF64748B),
    };

    // Determine available CTAs based on status
    final canDispatch = parcel.status == ParcelStatus.received;
    final canOffload = parcel.status == ParcelStatus.inTransit || parcel.status == ParcelStatus.dispatched;
    final canDeliver = parcel.status == ParcelStatus.atStation;
    final canCancel = parcel.status == ParcelStatus.received;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(
          'Parcel Details',
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
                  _cancelParcel();
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
                      Text('Cancel Parcel', style: GoogleFonts.inter(color: Colors.red)),
                    ],
                  ),
                ),
              ],
              icon: const HugeIcon(
                icon: HugeIcons.strokeRoundedMoreVerticalCircle01,
                color: Colors.black,
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
                              '#${parcel.id.toUpperCase().length > 8 ? parcel.id.toUpperCase().substring(0, 8) : parcel.id.toUpperCase()}',
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
                                parcel.status.name.toUpperCase(),
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
                                    parcel.fromAddress,
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
                                    parcel.receiverName,
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
                              onPressed: _showDispatchDialog,
                              icon: const HugeIcon(icon: HugeIcons.strokeRoundedDeliveryTruck01, color: Colors.white, size: 20),
                              label: const Text('Dispatch', style: TextStyle(color: Colors.white)),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF3B82F6),
                                padding: const EdgeInsets.symmetric(vertical: 16),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                              ),
                            ),
                          ),
                        if (canOffload)
                          Expanded(
                            child: ElevatedButton.icon(
                              onPressed: _showOffloadDialog,
                              icon: const HugeIcon(icon: HugeIcons.strokeRoundedPackage01, color: Colors.white, size: 20),
                              label: const Text('Offload', style: TextStyle(color: Colors.white)),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFFF59E0B),
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
                        if (canDispatch || canOffload || canDeliver) const Gap(12),
                        Expanded(
                          child: OutlinedButton.icon(
                            onPressed: _printReceipt,
                            icon: const HugeIcon(icon: HugeIcons.strokeRoundedPrinter, color: Colors.black, size: 20),
                            label: const Text('Print Receipt', style: TextStyle(color: Colors.black)),
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
                    'Parcel Timeline',
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
                          time: DateFormat('d MMM · HH:mm').format(parcel.createdAt),
                          done: true,
                        ),
                        _buildTimelineEntry(
                          label: 'In Transit',
                          time: DateFormat('d MMM').format(parcel.updatedAt),
                          done: parcel.status != ParcelStatus.received && parcel.status != ParcelStatus.canceled,
                        ),
                        _buildTimelineEntry(
                          label: 'At Station',
                          time: DateFormat('d MMM').format(parcel.updatedAt),
                          done: parcel.status == ParcelStatus.atStation || parcel.status == ParcelStatus.delivered,
                        ),
                        _buildTimelineEntry(
                          label: parcel.status == ParcelStatus.canceled ? 'Canceled' : 'Delivered',
                          time: parcel.status == ParcelStatus.delivered || parcel.status == ParcelStatus.canceled
                              ? DateFormat('d MMM').format(parcel.updatedAt)
                              : 'Pending',
                          done: parcel.status == ParcelStatus.delivered,
                          isLast: true,
                          isFailed: parcel.status == ParcelStatus.canceled,
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
