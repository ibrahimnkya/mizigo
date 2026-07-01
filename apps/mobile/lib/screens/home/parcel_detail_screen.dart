import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gap/gap.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'track_screen.dart';
import 'live_track_screen.dart';
import '../../widgets/home/premium_ui_components.dart';
import '../../widgets/printer_selection_sheet.dart';
import '../../providers/printer_provider.dart';
import '../../services/api_service.dart';
import '../../models/parcel_model.dart';

class ParcelDetailScreen extends StatefulWidget {
  final ShipmentData shipment;
  const ParcelDetailScreen({super.key, required this.shipment});

  @override
  State<ParcelDetailScreen> createState() => _ParcelDetailScreenState();
}

class _ParcelDetailScreenState extends State<ParcelDetailScreen> {
  ParcelModel? _parcel;
  bool _isLoading = false;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _fetchFullParcel();
  }

  Future<void> _fetchFullParcel() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });
    try {
      final json = await ApiService.getParcelById(widget.shipment.id);
      if (mounted) {
        setState(() {
          _parcel = ParcelModel.fromJson(json);
          _isLoading = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _errorMessage = e.toString();
          _isLoading = false;
        });
      }
    }
  }

  bool get _canCancel {
    if (_parcel != null) {
      return _parcel!.status == ParcelStatus.received;
    }
    final raw = widget.shipment.rawStatus.toLowerCase();
    return raw == 'received' || raw == 'pending' || raw == 'booked';
  }

  ShipmentData get _currentShipmentData {
    if (_parcel != null) {
      return ShipmentData.fromParcel(_parcel!);
    }
    return widget.shipment;
  }

  String get _currentRawStatus {
    if (_parcel != null) {
      return _parcel!.status.name;
    }
    return widget.shipment.rawStatus;
  }

  String get _currentStatusLabel {
    if (_parcel != null) {
      return _parcel!.status.displayLabel;
    }
    return widget.shipment.statusLabel;
  }

  Future<void> _handlePrintReceipt() async {
    final provider = context.read<PrinterProvider>();
    final s = _currentShipmentData;
    
    final packageData = {
      'trackingId': s.trackingId,
      'description': _parcel?.parcelType ?? 'Standard Cargo',
      'senderName': 'Owner',
      'receiverName': s.receiverName,
      'origin': s.from,
      'destination': s.to,
      'price': _parcel?.amount ?? 15000.0,
      'quantity': 1,
    };

    if (provider.isConnected) {
      _executePrint(provider, packageData);
    } else {
      PrinterSelectionSheet.show(
        context,
        onDeviceSelected: (device) {
          _executePrint(provider, packageData);
        },
      );
    }
  }

  Future<void> _executePrint(PrinterProvider provider, Map<String, dynamic> packageData) async {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            const SizedBox(
              width: 16,
              height: 16,
              child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
            ),
            const Gap(12),
            const Text("Printing POS receipt..."),
          ],
        ),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        duration: const Duration(seconds: 1),
      ),
    );

    final success = await provider.printReceipt(packageData);
    
    if (!mounted) return;
    
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(success ? "Receipt printed successfully!" : "Printing failed. Try again."),
        backgroundColor: success ? const Color(0xFF10B981) : Colors.red,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }

  Future<void> _cancelParcel() async {
    final reasonController = TextEditingController();
    final shouldCancel = await showDialog<bool>(
      context: context,
      builder: (context) {
        final theme = Theme.of(context);
        return AlertDialog(
          backgroundColor: theme.colorScheme.surface,
          title: Text(
            'Cancel Parcel',
            style: GoogleFonts.outfit(fontWeight: FontWeight.bold),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Are you sure you want to cancel this parcel?',
                style: GoogleFonts.inter(color: theme.textTheme.bodyMedium?.color),
              ),
              const Gap(16),
              TextField(
                controller: reasonController,
                decoration: InputDecoration(
                  labelText: 'Reason for cancellation',
                  labelStyle: GoogleFonts.inter(fontSize: 13),
                  alignLabelWithHint: true,
                  border: const OutlineInputBorder(),
                ),
                maxLines: 3,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: Text(
                'Go Back',
                style: GoogleFonts.inter(color: theme.textTheme.bodySmall?.color),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: theme.colorScheme.error,
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              ),
              onPressed: () => Navigator.pop(context, true),
              child: Text(
                'Confirm Cancel',
                style: GoogleFonts.inter(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        );
      },
    );

    if (shouldCancel == true) {
      if (reasonController.text.trim().isEmpty) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Cancellation reason is required'),
              backgroundColor: Colors.red,
            ),
          );
        }
        return;
      }

      setState(() => _isLoading = true);
      try {
        await ApiService.updateParcelStatus(
          widget.shipment.id,
          'Canceled',
          location: 'Canceled by user. Reason: ${reasonController.text.trim()}',
        );
        await _fetchFullParcel();
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Parcel canceled successfully ✓'),
              backgroundColor: Color(0xFF10B981),
            ),
          );
        }
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Failed to cancel parcel: $e'),
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
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final s = _currentShipmentData;
    final status = _currentRawStatus;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            // ── Header ──────────────────────────────────────────
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.of(context).pop(),
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: theme.cardTheme.color,
                        shape: BoxShape.circle,
                        border: Border.all(color: theme.dividerColor, width: 1.5),
                      ),
                      child: Center(
                        child: HugeIcon(
                          icon: HugeIcons.strokeRoundedArrowLeft01,
                          size: 20,
                          color: theme.iconTheme.color,
                        ),
                      ),
                    ),
                  ),
                  const Gap(16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Parcel Details',
                          style: GoogleFonts.outfit(
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                            color: theme.textTheme.headlineSmall?.color,
                          ),
                        ),
                        Text(
                          s.trackingId,
                          style: GoogleFonts.inter(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: theme.textTheme.bodyMedium?.color?.withValues(alpha: 0.6),
                          ),
                        ),
                      ],
                    ),
                  ),
                  _StatusBadge(status: status, statusLabel: _currentStatusLabel),
                ],
              ),
            ),

            if (_errorMessage != null)
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.error.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.error_outline_rounded, color: theme.colorScheme.error, size: 16),
                      const Gap(8),
                      Expanded(
                        child: Text(
                          'Failed to sync: $_errorMessage',
                          style: GoogleFonts.inter(color: theme.colorScheme.error, fontSize: 11),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

            const Gap(20),

            Expanded(
              child: _isLoading && _parcel == null
                  ? const Center(child: CircularProgressIndicator())
                  : SingleChildScrollView(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // ── Route Visualizer Card ───────────────────
                          _RouteCard(
                            from: s.from,
                            to: s.to,
                            status: status,
                          ),

                          const Gap(20),

                          // ── Details card ───────────────────────────
                          Container(
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color: theme.cardTheme.color,
                              borderRadius: BorderRadius.circular(24),
                              border: Border.all(color: theme.dividerColor, width: 1.5),
                              boxShadow: [
                                BoxShadow(
                                  color: theme.shadowColor.withValues(alpha: theme.brightness == Brightness.dark ? 0.2 : 0.04),
                                  blurRadius: 24,
                                  offset: const Offset(0, 8),
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    const HugeIcon(
                                      icon: HugeIcons.strokeRoundedPackage,
                                      color: Colors.grey,
                                      size: 18,
                                    ),
                                    const Gap(8),
                                    Text(
                                      'Package Details',
                                      style: GoogleFonts.outfit(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: theme.textTheme.titleMedium?.color,
                                      ),
                                    ),
                                  ],
                                ),
                                const Gap(16),
                                GridView.count(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  crossAxisCount: 2,
                                  childAspectRatio: 2.2,
                                  crossAxisSpacing: 12,
                                  mainAxisSpacing: 12,
                                  children: [
                                    _DetailItem(
                                      icon: HugeIcons.strokeRoundedPackage,
                                      label: 'Size',
                                      value: s.size,
                                    ),
                                    _DetailItem(
                                      icon: HugeIcons.strokeRoundedWeightScale,
                                      label: 'Weight',
                                      value: s.weight,
                                    ),
                                    _DetailItem(
                                      icon: HugeIcons.strokeRoundedDeliveryTruck02,
                                      label: 'Service',
                                      value: s.service,
                                    ),
                                    _DetailItem(
                                      icon: HugeIcons.strokeRoundedShield01,
                                      label: 'Insurance',
                                      value: s.insurance,
                                    ),
                                    if (s.condition.isNotEmpty)
                                      _DetailItem(
                                        icon: HugeIcons.strokeRoundedInspectCode,
                                        label: 'Parcel Condition',
                                        value: s.condition,
                                      ),
                                    if (s.urgency.isNotEmpty)
                                      _DetailItem(
                                        icon: HugeIcons.strokeRoundedSpeedTrain02,
                                        label: 'Delivery Priority',
                                        value: s.urgency,
                                      ),
                                    _DetailItem(
                                      icon: HugeIcons.strokeRoundedUser,
                                      label: 'Receiver',
                                      value: s.receiverName,
                                    ),
                                    _DetailItem(
                                      icon: HugeIcons.strokeRoundedCreditCard,
                                      label: 'Price',
                                      value: _parcel?.amount != null
                                          ? 'TSh ${NumberFormat('#,###').format(_parcel!.amount)}'
                                          : 'N/A',
                                    ),
                                  ],
                                ),
                                const Gap(20),
                                const DashedDivider(),
                                const Gap(16),
                                // Action buttons inside card (Live Track)
                                Row(
                                  children: [
                                    Expanded(
                                      child: _ActionButton(
                                        label: 'Live Track',
                                        icon: HugeIcons.strokeRoundedSpeedTrain02,
                                        onTap: () {
                                          Navigator.of(context).push(
                                            MaterialPageRoute(
                                              builder: (_) => LiveTrackScreen(shipment: s),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),

                          const Gap(28),

                          // ── Timeline ───────────────────────────────
                          _buildTimeline(context, status),

                          const Gap(32),
                        ],
                      ),
                    ),
            ),
            
            // ── Bottom Action CTAs ────────────────────────────
            if (!_isLoading || _parcel != null)
              Container(
                padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
                decoration: BoxDecoration(
                  color: theme.cardTheme.color,
                  border: Border(top: BorderSide(color: theme.dividerColor, width: 1.5)),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: theme.colorScheme.primary,
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              elevation: 0,
                            ),
                            onPressed: _handlePrintReceipt,
                            icon: const HugeIcon(icon: HugeIcons.strokeRoundedPrinter, color: Colors.white, size: 20),
                            label: Text(
                              'Print Receipt',
                              style: GoogleFonts.inter(fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        if (_canCancel) ...[
                          const Gap(12),
                          Expanded(
                            child: OutlinedButton.icon(
                              style: OutlinedButton.styleFrom(
                                foregroundColor: theme.colorScheme.error,
                                side: BorderSide(color: theme.colorScheme.error, width: 1.5),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                                padding: const EdgeInsets.symmetric(vertical: 16),
                              ),
                              onPressed: _cancelParcel,
                              icon: HugeIcon(icon: HugeIcons.strokeRoundedCancelCircle, color: theme.colorScheme.error, size: 20),
                              label: Text(
                                'Cancel Parcel',
                                style: GoogleFonts.inter(fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ],
                      ],
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildTimeline(BuildContext context, String currentStatus) {
    final s = _currentShipmentData;
    
    final bool isCanceled = currentStatus.toLowerCase() == 'canceled';
    final bool isDelivered = currentStatus.toLowerCase() == 'delivered';
    final bool isInTransit = currentStatus.toLowerCase() == 'intransit' || currentStatus.toLowerCase() == 'dispatched';
    final bool isReceived = currentStatus.toLowerCase() == 'received';
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Shipment Timeline',
          style: GoogleFonts.outfit(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).textTheme.titleLarge?.color,
          ),
        ),
        const Gap(16),
        _TimelineItem(
          label: 'Booked',
          date: s.createdAt != null ? _formatDateTime(s.createdAt!) : 'N/A',
          isDone: true,
          isActive: currentStatus.toLowerCase() == 'booked' || currentStatus.toLowerCase() == 'pending',
          icon: HugeIcons.strokeRoundedCalendar01,
        ),
        _TimelineItem(
          label: 'Received at Station',
          date: isReceived || isInTransit || isDelivered
              ? (s.updatedAt != null ? _formatDateTime(s.updatedAt!) : 'Completed')
              : 'Pending',
          isDone: isReceived || isInTransit || isDelivered,
          isActive: isReceived,
          icon: HugeIcons.strokeRoundedWarehouse,
        ),
        _TimelineItem(
          label: 'In Transit',
          date: isInTransit
              ? 'Active'
              : (isDelivered)
                  ? (s.updatedAt != null ? _formatDateTime(s.updatedAt!) : 'Completed')
                  : 'Pending',
          isDone: isDelivered,
          isActive: isInTransit,
          icon: HugeIcons.strokeRoundedSpeedTrain02,
        ),
        _TimelineItem(
          label: isCanceled ? 'Canceled' : 'Delivered',
          date: isDelivered || isCanceled
              ? (s.updatedAt != null ? _formatDateTime(s.updatedAt!) : 'Completed')
              : 'Pending',
          isDone: isDelivered || isCanceled,
          isActive: isDelivered || isCanceled,
          isLast: true,
          icon: isCanceled ? HugeIcons.strokeRoundedCancelCircle : HugeIcons.strokeRoundedHome01,
          isFailed: isCanceled,
        ),
      ],
    );
  }

  String _formatDateTime(DateTime dt) {
    final hourStr = dt.hour.toString().padLeft(2, '0');
    final minStr = dt.minute.toString().padLeft(2, '0');
    final monthStr = _monthAbbr(dt.month);
    final dayStr = dt.day.toString();
    return '$dayStr $monthStr · $hourStr:$minStr';
  }

  String _monthAbbr(int m) {
    return switch (m) {
      1 => 'Jan',
      2 => 'Feb',
      3 => 'Mar',
      4 => 'Apr',
      5 => 'May',
      6 => 'Jun',
      7 => 'Jul',
      8 => 'Aug',
      9 => 'Sep',
      10 => 'Oct',
      11 => 'Nov',
      12 => 'Dec',
      _ => '',
    };
  }
}

// ─── Status Badge Widget ──────────────────────────────────────────────────────

class _StatusBadge extends StatelessWidget {
  final String status;
  final String statusLabel;

  const _StatusBadge({required this.status, required this.statusLabel});

  @override
  Widget build(BuildContext context) {
    Color bg;
    Color text;

    switch (status.toLowerCase()) {
      case 'delivered':
        bg = const Color(0xFF10B981).withValues(alpha: 0.15);
        text = const Color(0xFF10B981);
        break;
      case 'intransit':
      case 'dispatched':
        bg = const Color(0xFF3B82F6).withValues(alpha: 0.15);
        text = const Color(0xFF3B82F6);
        break;
      case 'canceled':
        bg = const Color(0xFFEF4444).withValues(alpha: 0.15);
        text = const Color(0xFFEF4444);
        break;
      case 'received':
      case 'pending':
      case 'booked':
      default:
        bg = const Color(0xFFF59E0B).withValues(alpha: 0.15);
        text = const Color(0xFFF59E0B);
        break;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        statusLabel.toUpperCase(),
        style: GoogleFonts.inter(
          fontSize: 10,
          fontWeight: FontWeight.bold,
          color: text,
          letterSpacing: 0.5,
        ),
      ),
    );
  }
}

// ─── Route Visualizer Card Widget ─────────────────────────────────────────────

class _RouteCard extends StatelessWidget {
  final String from;
  final String to;
  final String status;

  const _RouteCard({
    required this.from,
    required this.to,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    double progress = 0.2;
    if (status == 'received') {
      progress = 0.45;
    } else if (status == 'dispatched' || status == 'inTransit') {
      progress = 0.75;
    } else if (status == 'delivered') {
      progress = 1.0;
    } else if (status == 'canceled') {
      progress = 0.0;
    }

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: theme.cardTheme.color,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: theme.dividerColor, width: 1.5),
        boxShadow: [
          BoxShadow(
            color: theme.shadowColor.withValues(alpha: theme.brightness == Brightness.dark ? 0.2 : 0.04),
            blurRadius: 16,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Origin',
                      style: GoogleFonts.inter(
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                        color: theme.textTheme.bodySmall?.color,
                      ),
                    ),
                    const Gap(4),
                    Text(
                      from,
                      style: GoogleFonts.outfit(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: theme.textTheme.bodyLarge?.color,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'Destination',
                      style: GoogleFonts.inter(
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                        color: theme.textTheme.bodySmall?.color,
                      ),
                    ),
                    const Gap(4),
                    Text(
                      to,
                      style: GoogleFonts.outfit(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: theme.textTheme.bodyLarge?.color,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Gap(24),
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                height: 4,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: theme.dividerColor,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: FractionallySizedBox(
                  widthFactor: progress,
                  child: Container(
                    height: 4,
                    decoration: BoxDecoration(
                      color: status == 'canceled' ? Colors.red : theme.colorScheme.primary,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ),
              ),
              if (status != 'canceled')
                AnimatedAlign(
                  alignment: Alignment(progress * 2 - 1, 0),
                  duration: const Duration(milliseconds: 800),
                  curve: Curves.easeOutBack,
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: theme.colorScheme.primary,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: theme.colorScheme.primary.withValues(alpha: 0.3),
                          blurRadius: 8,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    child: const HugeIcon(
                      icon: HugeIcons.strokeRoundedSpeedTrain02,
                      color: Colors.white,
                      size: 16,
                    ),
                  ),
                )
              else
                Align(
                  alignment: const Alignment(-1.0, 0),
                  child: Container(
                    padding: const EdgeInsets.all(6),
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.close_rounded,
                      color: Colors.white,
                      size: 14,
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}

// ─── Detail Grid Item Widget ──────────────────────────────────────────────────

class _DetailItem extends StatelessWidget {
  final dynamic icon;
  final String label;
  final String value;

  const _DetailItem({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: theme.scaffoldBackgroundColor.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: theme.dividerColor, width: 1.0),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: theme.colorScheme.primary.withValues(alpha: 0.08),
              borderRadius: BorderRadius.circular(12),
            ),
            child: HugeIcon(
              icon: icon,
              color: theme.colorScheme.primary,
              size: 18,
            ),
          ),
          const Gap(10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  label,
                  style: GoogleFonts.inter(
                    fontSize: 10,
                    color: theme.textTheme.bodySmall?.color,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Gap(2),
                Text(
                  value,
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: theme.textTheme.bodyLarge?.color,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ─── Timeline Item Widget ─────────────────────────────────────────────────────

class _TimelineItem extends StatelessWidget {
  final String label;
  final String date;
  final bool isDone;
  final bool isActive;
  final bool isLast;
  final dynamic icon;
  final bool isFailed;

  const _TimelineItem({
    required this.label,
    required this.date,
    required this.isDone,
    required this.isActive,
    required this.icon,
    this.isLast = false,
    this.isFailed = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    Color circleColor;
    Color iconColor;
    
    if (isFailed) {
      circleColor = const Color(0xFFEF4444);
      iconColor = Colors.white;
    } else if (isActive) {
      circleColor = theme.colorScheme.primary;
      iconColor = Colors.white;
    } else if (isDone) {
      circleColor = theme.colorScheme.primary.withValues(alpha: 0.15);
      iconColor = theme.colorScheme.primary;
    } else {
      circleColor = theme.dividerColor;
      iconColor = theme.textTheme.bodySmall?.color ?? Colors.grey;
    }

    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 40,
            child: Column(
              children: [
                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: circleColor,
                    border: isActive && !isFailed
                        ? Border.all(color: theme.colorScheme.primary.withValues(alpha: 0.3), width: 3)
                        : null,
                  ),
                  child: Center(
                    child: HugeIcon(
                      icon: icon,
                      size: 16,
                      color: iconColor,
                    ),
                  ),
                ),
                if (!isLast)
                  Expanded(
                    child: Container(
                      width: 2,
                      margin: const EdgeInsets.symmetric(vertical: 4),
                      decoration: BoxDecoration(
                        color: isDone && !isFailed
                            ? theme.colorScheme.primary.withValues(alpha: 0.3)
                            : theme.dividerColor,
                        borderRadius: BorderRadius.circular(1),
                      ),
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
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          label,
                          style: GoogleFonts.inter(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                            color: isActive
                                ? theme.colorScheme.primary
                                : isFailed
                                    ? const Color(0xFFEF4444)
                                    : theme.textTheme.titleMedium?.color,
                          ),
                        ),
                      ),
                      const Gap(8),
                      Text(
                        date,
                        style: GoogleFonts.inter(
                          fontSize: 12,
                          color: theme.textTheme.bodySmall?.color ?? const Color(0xFF94A3B8),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ─── Driver Chip Widget ───────────────────────────────────────────────────────

// ─── Action Button Widget (Details Card) ──────────────────────────────────────

class _ActionButton extends StatelessWidget {
  final String label;
  final dynamic icon;
  final VoidCallback onTap;

  const _ActionButton({
    required this.label,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: theme.dividerColor, width: 1.5),
          color: theme.scaffoldBackgroundColor.withValues(alpha: 0.4),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            HugeIcon(
              icon: icon,
              color: theme.colorScheme.primary,
              size: 18,
            ),
            const Gap(8),
            Text(
              label,
              style: GoogleFonts.inter(
                fontSize: 13,
                fontWeight: FontWeight.bold,
                color: theme.textTheme.bodyLarge?.color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
