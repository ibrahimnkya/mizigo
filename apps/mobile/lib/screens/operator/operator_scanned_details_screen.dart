import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:intl/intl.dart';
import 'package:printing/printing.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../models/parcel_model.dart';
import '../../services/api_service.dart';
import 'package:provider/provider.dart';
import '../../providers/printer_provider.dart';
import '../../widgets/printer_selection_sheet.dart';
import '../../theme/staff_palette.dart';
import '../../widgets/staff/parcel_badges.dart';
import '../../widgets/auth/clerk_auth_widgets.dart';
import '../../utils/receipt_pdf_generator.dart';
import '../../widgets/profile/premium_settings_components.dart';
import '../../widgets/staff/staff_settings.dart';


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

  /// Bottom drawer: pick the wagon/train, then a train guard (filtered to that
  /// wagon when guards are assigned to one).
  Future<void> _showDispatchDialog() async {
    setState(() => _isLoading = true);
    List<Map<String, dynamic>> vehicles = [];
    List<Map<String, dynamic>> guards = [];
    try {
      final results = await Future.wait([ApiService.getVehicles(), ApiService.getOperators()]);
      vehicles = List<Map<String, dynamic>>.from(results[0]);
      final allOps = List<Map<String, dynamic>>.from(results[1]);
      guards = allOps.where((o) => (o['role']?['name'] ?? '') == 'TRAIN_GUARD').toList();
    } catch (_) {}
    if (mounted) setState(() => _isLoading = false);
    if (!mounted) return;

    String? vehicleId;
    String? guardId;

    final result = await showStaffSheet<Map<String, String>>(
      context,
      title: 'Dispatch Parcel',
      builder: (sheetContext) => StatefulBuilder(
        builder: (ctx, setSheet) {
          final palette = StaffPalette.of(ctx);
          final forVehicle = vehicleId == null
              ? guards
              : guards.where((g) => (g['wagon']?['id'] ?? g['wagonId']) == vehicleId).toList();
          final shownGuards = forVehicle.isEmpty ? guards : forVehicle;

          Widget empty(String text) => Padding(
                padding: const EdgeInsets.fromLTRB(24, 8, 24, 8),
                child: Text(text, style: GoogleFonts.outfit(fontSize: 15, color: palette.fg(0.55))),
              );

          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const StaffSheetSectionLabel('Wagon / Train'),
                if (vehicles.isEmpty) empty('No wagons available.'),
                for (final v in vehicles)
                  StaffSheetTile(
                    icon: HugeIcons.strokeRoundedSpeedTrain01,
                    label: (v['plateNumber'] as String?) ?? 'Unknown',
                    selected: vehicleId == v['id'],
                    onTap: () => setSheet(() {
                      vehicleId = v['id'] as String?;
                      guardId = null;
                    }),
                  ),
                const StaffSheetSectionLabel('Train Guard'),
                if (shownGuards.isEmpty) empty('No train guards available.'),
                for (final g in shownGuards)
                  StaffSheetTile(
                    icon: HugeIcons.strokeRoundedUser,
                    label: (g['name'] as String?) ?? 'Unknown',
                    selected: guardId == g['id'],
                    onTap: () => setSheet(() => guardId = g['id'] as String?),
                  ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(24, 16, 24, 0),
                  child: StaffButton(
                    label: 'Dispatch Parcel',
                    icon: HugeIcons.strokeRoundedDeliveryTruck01,
                    onPressed: vehicleId == null || guardId == null
                        ? null
                        : () => Navigator.pop(sheetContext, {'vehicleId': vehicleId!, 'guardId': guardId!}),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );

    if (result != null) {
      await _updateStatus('In Transit', vehicleId: result['vehicleId']);
    }
  }

  @override
  void initState() {
    super.initState();
    parcel = widget.parcel;
    // The parcel passed in may be a list/search snapshot; fetch the latest.
    _refresh();
  }

  Future<void> _refresh() async {
    try {
      final json = await ApiService.getParcelById(parcel.id);
      if (mounted) setState(() => parcel = ParcelModel.fromJson(json));
    } catch (_) {
      // Keep showing what we have.
    }
  }

  Future<void> _shareReceipt() async {
    MizigoToasts.showSuccess(context, 'Preparing receipt…');
    try {
      final bytes = await ReceiptPdfGenerator.generate(
        trackingId: parcel.trackingNumber ?? parcel.id,
        fromAddress: parcel.fromAddress,
        toAddress: parcel.toAddress,
        serviceType: parcel.serviceType,
        parcelSize: parcel.parcelSize,
        parcelType: parcel.parcelType,
        senderName: parcel.senderName ?? 'N/A',
        senderPhone: parcel.senderPhone ?? 'N/A',
        receiverName: parcel.receiverName,
        receiverPhone: parcel.receiverPhone,
        price: (parcel.amount ?? 0).toDouble(),
        receiverPays: parcel.receiverPays,
        status: parcel.status.displayLabel,
        createdAt: parcel.createdAt,
      );
      await Printing.sharePdf(
        bytes: bytes,
        filename: 'mizigo_receipt_${(parcel.trackingNumber ?? parcel.id).toUpperCase()}.pdf',
      );
    } catch (_) {
      if (mounted) MizigoToasts.showError(context, 'Couldn’t generate the receipt');
    }
  }

  /// Bottom drawer: choose the destination clerk (loaded from the server,
  /// destination-station clerks first), then confirm.
  Future<void> _showOffloadDialog() async {
    setState(() => _isLoading = true);
    var clerks = <Map<String, dynamic>>[];
    var loadFailed = false;
    try {
      final ops = List<Map<String, dynamic>>.from(await ApiService.getOperators());
      clerks = ops.where((o) => (o['role']?['name'] ?? '') == 'CLERK').toList();
    } catch (_) {
      loadFailed = true;
    }
    if (mounted) setState(() => _isLoading = false);
    if (!mounted) return;

    String stationOf(Map<String, dynamic> c) => (c['station']?['name'] as String?)?.trim() ?? '';
    final destination = parcel.toAddress.trim().toLowerCase();
    bool atDestination(Map<String, dynamic> c) {
      final station = stationOf(c).toLowerCase();
      return station.isNotEmpty && destination.isNotEmpty &&
          (destination.contains(station) || station.contains(destination.split(',').first.trim()));
    }

    clerks.sort((a, b) {
      final da = atDestination(a) ? 0 : 1, db = atDestination(b) ? 0 : 1;
      if (da != db) return da - db;
      return ((a['name'] as String?) ?? '').compareTo((b['name'] as String?) ?? '');
    });

    String? selectedId;

    final confirmed = await showStaffSheet<bool>(
      context,
      title: 'Offload Parcel',
      builder: (sheetContext) => StatefulBuilder(
        builder: (ctx, setSheet) {
          final palette = StaffPalette.of(ctx);
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(24, 0, 24, 4),
                  child: Text(
                    'Select the destination clerk who will receive this parcel.',
                    style: GoogleFonts.outfit(fontSize: 15, height: 1.4, color: palette.fg(0.7)),
                  ),
                ),
                if (clerks.isEmpty)
                  Padding(
                    padding: const EdgeInsets.fromLTRB(24, 12, 24, 8),
                    child: Text(
                      loadFailed
                          ? 'Couldn’t load clerks. Check your connection and try again.'
                          : 'No clerks found in your organization.',
                      style: GoogleFonts.outfit(fontSize: 15, color: palette.fg(0.55)),
                    ),
                  ),
                for (final c in clerks)
                  StaffSheetTile(
                    icon: HugeIcons.strokeRoundedUser,
                    label: (c['name'] as String?) ?? 'Unnamed clerk',
                    subtitle: [
                      if (stationOf(c).isNotEmpty) stationOf(c),
                      if (atDestination(c)) 'Destination station',
                    ].join(' • ').ifEmptyNull,
                    selected: selectedId == c['id'],
                    onTap: () => setSheet(() => selectedId = c['id'] as String?),
                  ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(24, 16, 24, 0),
                  child: StaffButton(
                    label: 'Confirm Offload',
                    icon: HugeIcons.strokeRoundedPackage01,
                    onPressed: selectedId == null ? null : () => Navigator.pop(sheetContext, true),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );

    if (confirmed == true) {
      await _updateStatus('Offloaded', receivingClerkId: selectedId);
    }
  }

  Future<void> _updateStatus(String newStatus, {String? vehicleId, String? reason, String? receivingClerkId}) async {
    setState(() => _isLoading = true);
    try {
      switch (newStatus) {
        case 'In Transit':
          await ApiService.dispatchParcel(parcel.id, vehicleId ?? '', DateTime.now());
        case 'Offloaded':
          await ApiService.offloadParcel(parcel.id, receivingClerkId: receivingClerkId);
        case 'Canceled':
          await ApiService.cancelParcel(parcel.id, reason ?? '');
        default:
          break;
      }
      final updatedJson = await ApiService.getParcelById(parcel.id);
      if (!mounted) return;
      setState(() => parcel = ParcelModel.fromJson(updatedJson));
      MizigoToasts.showSuccess(context, 'Parcel updated to $newStatus');
    } catch (e) {
      if (mounted) MizigoToasts.showError(context, 'Update failed: $e');
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  /// Bottom drawer: receiver's 6-digit delivery code; submits on the 6th digit.
  Future<void> _confirmDelivery() async {
    final codeController = TextEditingController();

    final code = await showStaffSheet<String>(
      context,
      title: 'Verify Delivery',
      builder: (sheetContext) {
        final palette = StaffPalette.of(sheetContext);
        void submit() {
          if (codeController.text.length == 6) Navigator.pop(sheetContext, codeController.text);
        }

        return Padding(
          padding: EdgeInsets.fromLTRB(24, 4, 24, 8 + MediaQuery.of(sheetContext).viewInsets.bottom),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Ask the receiver for their 6-digit delivery code.',
                style: GoogleFonts.outfit(fontSize: 15, height: 1.4, color: palette.fg(0.7)),
              ),
              const Gap(18),
              ClerkCodeField(
                controller: codeController,
                foreground: palette.fg(),
                onCompleted: (_) => submit(),
              ),
              const Gap(24),
              ListenableBuilder(
                listenable: codeController,
                builder: (_, _) => StaffButton(
                  label: 'Confirm Delivery',
                  icon: HugeIcons.strokeRoundedPackageDelivered,
                  color: const Color(0xFF10B981),
                  onPressed: codeController.text.length == 6 ? submit : null,
                ),
              ),
            ],
          ),
        );
      },
    );
    // Dispose after the sheet's close animation, which still reads it.
    Future.delayed(const Duration(milliseconds: 500), codeController.dispose);
    if (code == null || !mounted) return;

    setState(() => _isLoading = true);
    try {
      await ApiService.deliverParcel(parcel.id, code);
      final updatedJson = await ApiService.getParcelById(parcel.id);
      if (!mounted) return;
      setState(() => parcel = ParcelModel.fromJson(updatedJson));
      MizigoToasts.showSuccess(context, 'Parcel marked as delivered');
    } catch (e) {
      if (mounted) MizigoToasts.showError(context, 'Delivery failed: $e');
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  /// Bottom drawer: a reason is required before the parcel can be canceled.
  Future<void> _cancelParcel() async {
    final reasonController = TextEditingController();

    final reason = await showStaffSheet<String>(
      context,
      title: 'Cancel Parcel',
      builder: (sheetContext) {
        final palette = StaffPalette.of(sheetContext);
        return Padding(
          padding: EdgeInsets.fromLTRB(24, 4, 24, 8 + MediaQuery.of(sheetContext).viewInsets.bottom),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'This can’t be undone. Tell us why the parcel is being canceled.',
                style: GoogleFonts.outfit(fontSize: 15, height: 1.4, color: palette.fg(0.7)),
              ),
              const Gap(16),
              StaffTextField(
                label: 'Reason',
                hint: 'e.g. Sender requested cancellation',
                controller: reasonController,
                icon: HugeIcons.strokeRoundedNote,
                maxLines: 3,
                autofocus: true,
              ),
              const Gap(20),
              ListenableBuilder(
                listenable: reasonController,
                builder: (_, _) => StaffButton(
                  label: 'Cancel Parcel',
                  icon: HugeIcons.strokeRoundedCancelCircle,
                  color: kStaffDanger,
                  onPressed: reasonController.text.trim().isEmpty
                      ? null
                      : () => Navigator.pop(sheetContext, reasonController.text.trim()),
                ),
              ),
              const Gap(10),
              StaffButton(
                label: 'Go Back',
                color: palette.fg(0.7),
                outlined: true,
                onPressed: () => Navigator.pop(sheetContext),
              ),
            ],
          ),
        );
      },
    );
    Future.delayed(const Duration(milliseconds: 500), reasonController.dispose);

    if (reason != null && reason.isNotEmpty) {
      await _updateStatus('Canceled', reason: reason);
    }
  }

  Future<void> _markLost() async {
    final reasonController = TextEditingController();
    final confirmed = await showStaffSheet<bool>(
      context,
      title: 'Mark as Lost',
      builder: (sheetContext) {
        final palette = StaffPalette.of(sheetContext);
        return Padding(
          padding: EdgeInsets.fromLTRB(24, 4, 24, 8 + MediaQuery.of(sheetContext).viewInsets.bottom),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Use this when the parcel can’t be located. The sender and receiver will see it as under review.',
                style: GoogleFonts.outfit(fontSize: 15, height: 1.4, color: palette.fg(0.7)),
              ),
              const Gap(16),
              StaffTextField(
                label: 'Reason (optional)',
                hint: 'e.g. Not found on arrival at Dodoma',
                controller: reasonController,
                icon: HugeIcons.strokeRoundedNote,
                maxLines: 3,
              ),
              const Gap(20),
              StaffButton(
                label: 'Mark as Lost',
                icon: HugeIcons.strokeRoundedPackageSearch,
                color: kStaffDanger,
                onPressed: () => Navigator.pop(sheetContext, true),
              ),
              const Gap(10),
              StaffButton(
                label: 'Go Back',
                color: palette.fg(0.7),
                outlined: true,
                onPressed: () => Navigator.pop(sheetContext),
              ),
            ],
          ),
        );
      },
    );
    final reason = reasonController.text.trim();
    Future.delayed(const Duration(milliseconds: 500), reasonController.dispose);
    if (confirmed != true || !mounted) return;

    setState(() => _isLoading = true);
    try {
      await ApiService.markParcelLost(parcel.id, reason);
      final updatedJson = await ApiService.getParcelById(parcel.id);
      if (!mounted) return;
      setState(() => parcel = ParcelModel.fromJson(updatedJson));
      MizigoToasts.showSuccess(context, 'Parcel marked as lost');
    } catch (e) {
      if (mounted) MizigoToasts.showError(context, 'Couldn’t mark as lost: $e');
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  /// Prints straight to the thermal printer from the parcel already loaded
  /// here (no receipt screen, no extra API call). Without a connected printer,
  /// the printer picker opens first and printing continues once one is chosen.
  void _printReceipt() {
    final printer = context.read<PrinterProvider>();
    if (printer.isConnected) {
      _sendToPrinter(printer);
    } else {
      PrinterSelectionSheet.show(context, onDeviceSelected: (_) => _sendToPrinter(printer));
    }
  }

  Future<void> _sendToPrinter(PrinterProvider printer) async {
    MizigoToasts.showSuccess(context, 'Printing receipt…');
    final ok = await printer.printReceipt({
      'trackingId': parcel.trackingNumber ?? parcel.id,
      'description': parcel.parcelType.isNotEmpty ? parcel.parcelType : parcel.serviceType,
      'senderName': parcel.senderName ?? '',
      'senderPhone': parcel.senderPhone ?? '',
      'receiverName': parcel.receiverName,
      'receiverPhone': parcel.receiverPhone,
      'origin': parcel.fromAddress,
      'destination': parcel.toAddress,
      'price': parcel.amount ?? 0,
      'quantity': 1,
      'urgency': parcel.urgency,
      'paymentStatus': parcel.additionalServices?['paymentStatus'],
      'additionalServices': parcel.additionalServices,
    });
    if (!mounted) return;
    if (ok) {
      MizigoToasts.showSuccess(context, 'Receipt printed');
    } else {
      MizigoToasts.showError(context, 'Print failed. Check the printer and try again.');
    }
  }

  static String _city(String address) {
    final first = address.split(',').first.trim();
    return first.isEmpty ? '—' : first;
  }

  Future<void> _call(String phone) async {
    var ok = false;
    try {
      ok = await launchUrl(Uri(scheme: 'tel', path: phone.replaceAll(' ', '')));
    } catch (_) {}
    if (!ok && mounted) MizigoToasts.showError(context, 'Couldn’t open the dialer');
  }

  /// Timeline steps that apply to this parcel: a canceled parcel only shows
  /// when it was received and when it was canceled.
  List<_TimelineStep> _timeline() {
    final booked = DateFormat('d MMM · HH:mm').format(parcel.createdAt.toLocal());
    final updated = DateFormat('d MMM · HH:mm').format(parcel.updatedAt.toLocal());
    if (parcel.status == ParcelStatus.canceled) {
      return [
        _TimelineStep(label: 'Received', time: booked, done: true),
        _TimelineStep(label: 'Canceled', time: updated, done: false, failed: true, isLast: true),
      ];
    }
    final status = parcel.status;
    final moved = status != ParcelStatus.received;
    final arrived = status == ParcelStatus.atStation || status == ParcelStatus.delivered;
    final delivered = status == ParcelStatus.delivered;
    return [
      _TimelineStep(label: 'Received', time: booked, done: true),
      _TimelineStep(label: 'In Transit', time: moved ? updated : 'Pending', done: moved),
      _TimelineStep(label: 'At Station', time: arrived ? updated : 'Pending', done: arrived),
      _TimelineStep(label: 'Delivered', time: delivered ? updated : 'Pending', done: delivered, isLast: true),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final palette = StaffPalette.of(context);
    final printerReady = context.watch<PrinterProvider>().isConnected;
    final canDispatch = parcel.status == ParcelStatus.received;
    final canOffload = parcel.status == ParcelStatus.inTransit || parcel.status == ParcelStatus.dispatched;
    final canDeliver = parcel.status == ParcelStatus.atStation;
    final canCancel = parcel.status == ParcelStatus.received;
    final canMarkLost = !{ParcelStatus.delivered, ParcelStatus.canceled, ParcelStatus.lost}.contains(parcel.status);
    final reference = (parcel.trackingNumber?.isNotEmpty ?? false)
        ? parcel.trackingNumber!
        : '#${parcel.id.toUpperCase().substring(0, parcel.id.length > 8 ? 8 : parcel.id.length)}';
    final isExpress = parcel.urgency.toLowerCase().contains('express') || parcel.urgency.toUpperCase() == 'MGR';

    if (_isLoading) {
      return StaffSettingsScaffold(
        title: 'Parcel Details',
        onBack: () => context.pop(),
        children: const [
          Padding(
            padding: EdgeInsets.only(top: 80),
            child: Center(child: CircularProgressIndicator(strokeWidth: 2.5, color: kStaffAccent)),
          ),
        ],
      );
    }

    return StaffSettingsScaffold(
      title: 'Parcel Details',
      onBack: () => context.pop(),
      onRefresh: _refresh,
      children: [
        // Header: reference, status, booking date
        StaffGlassCard(
          padding: const EdgeInsets.all(18),
          child: Row(
            children: [
              Container(
                width: 52,
                height: 52,
                decoration: BoxDecoration(color: palette.surface(0.15), borderRadius: BorderRadius.circular(14)),
                child: Center(child: Image.asset('assets/images/staff_parcel.png', width: 32, height: 32)),
              ),
              const Gap(14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      reference,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.outfit(
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 1,
                        color: palette.fg(),
                      ),
                    ),
                    const Gap(2),
                    Text(
                      'Booked ${DateFormat('d MMM yyyy · HH:mm').format(parcel.createdAt.toLocal())}',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.outfit(fontSize: 13, color: palette.fg(0.6)),
                    ),
                  ],
                ),
              ),
              const Gap(10),
              ParcelStatusBadge(status: parcel.status),
            ],
          ),
        ),
        const Gap(10),

        // Route
        StaffGlassCard(
          title: 'Route',
          titleAction: isExpress ? const ExpressBadge() : null,
          child: _RouteView(
            fromCity: _city(parcel.fromAddress),
            fromAddress: parcel.fromAddress,
            toCity: _city(parcel.toAddress),
            toAddress: parcel.toAddress,
          ),
        ),
        const Gap(10),

        // People
        StaffGlassCard(
          title: 'Sender & Receiver',
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
          child: Column(
            children: [
              _ContactRow(
                role: 'Sender',
                name: (parcel.senderName ?? '').trim(),
                phone: (parcel.senderPhone ?? '').trim(),
                onCall: _call,
              ),
              const StaffDivider(),
              _ContactRow(
                role: 'Receiver',
                name: parcel.receiverName.trim(),
                phone: parcel.receiverPhone.trim(),
                onCall: _call,
              ),
            ],
          ),
        ),
        const Gap(10),

        // Parcel details grid
        StaffGlassCard(
          title: 'Parcel Details',
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: _DetailTile(
                      icon: HugeIcons.strokeRoundedPackage,
                      label: 'Type',
                      value: parcel.parcelType.isNotEmpty ? parcel.parcelType : '—',
                    ),
                  ),
                  const Gap(10),
                  Expanded(
                    child: _DetailTile(
                      icon: HugeIcons.strokeRoundedRuler,
                      label: 'Size',
                      value: parcel.parcelSize.isNotEmpty ? parcel.parcelSize : '—',
                    ),
                  ),
                ],
              ),
              const Gap(10),
              Row(
                children: [
                  Expanded(
                    child: _DetailTile(
                      icon: HugeIcons.strokeRoundedDeliveryTruck01,
                      label: 'Service',
                      value: parcel.serviceType.isNotEmpty ? parcel.serviceType : 'Standard',
                    ),
                  ),
                  const Gap(10),
                  Expanded(
                    child: _DetailTile(
                      icon: HugeIcons.strokeRoundedMoney02,
                      label: 'Price',
                      value: parcel.amount != null ? 'TSh ${NumberFormat('#,###').format(parcel.amount)}' : '—',
                      highlight: true,
                    ),
                  ),
                ],
              ),
              if (parcel.receiverPays) ...[
                const Gap(12),
                const StaffBadge(
                  label: 'Receiver pays on collection',
                  color: Color(0xFFEA7A12),
                  icon: HugeIcons.strokeRoundedMoney02,
                ),
              ],
            ],
          ),
        ),
        const Gap(10),

        // Actions
        StaffGlassCard(
          title: 'Actions',
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (canDispatch)
                StaffButton(
                  label: 'Dispatch',
                  icon: HugeIcons.strokeRoundedDeliveryTruck01,
                  onPressed: _showDispatchDialog,
                ),
              if (canOffload)
                StaffButton(
                  label: 'Offload',
                  icon: HugeIcons.strokeRoundedPackage01,
                  onPressed: _showOffloadDialog,
                ),
              if (canDeliver)
                StaffButton(
                  label: 'Deliver',
                  icon: HugeIcons.strokeRoundedPackageDelivered,
                  color: const Color(0xFF10B981),
                  onPressed: _confirmDelivery,
                ),
              if (canDispatch || canOffload || canDeliver) const Gap(10),
              Row(
                children: [
                  Expanded(
                    child: _ActionTile(
                      icon: HugeIcons.strokeRoundedPrinter,
                      title: 'Print Receipt',
                      subtitle: printerReady ? 'Printer connected' : 'No printer connected',
                      statusColor: printerReady ? kStaffSuccess : palette.fg(0.35),
                      onTap: _printReceipt,
                    ),
                  ),
                  const Gap(10),
                  Expanded(
                    child: _ActionTile(
                      icon: HugeIcons.strokeRoundedShare08,
                      title: 'Share',
                      subtitle: 'PDF receipt',
                      onTap: _shareReceipt,
                    ),
                  ),
                ],
              ),
              if (canCancel) ...[
                const Gap(10),
                StaffButton(
                  label: 'Cancel Parcel',
                  icon: HugeIcons.strokeRoundedCancelCircle,
                  color: kStaffDanger,
                  outlined: true,
                  onPressed: _cancelParcel,
                ),
              ],
              if (canMarkLost) ...[
                const Gap(10),
                StaffButton(
                  label: 'Mark as Lost',
                  icon: HugeIcons.strokeRoundedPackageSearch,
                  color: kStaffDanger,
                  outlined: true,
                  onPressed: _markLost,
                ),
              ],
            ],
          ),
        ),
        const Gap(10),

        // Timeline
        StaffGlassCard(
          title: 'Timeline',
          child: Column(children: _timeline()),
        ),
      ],
    );
  }
}

/// Square-ish action tile: icon in an accent circle, title and a short hint.
/// [statusColor] adds a small status dot before the hint (e.g. printer state).
class _ActionTile extends StatelessWidget {
  const _ActionTile({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
    this.statusColor,
  });

  final List<List<dynamic>> icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;
  final Color? statusColor;

  @override
  Widget build(BuildContext context) {
    final palette = StaffPalette.of(context);
    return Material(
      color: palette.surface(0.08),
      borderRadius: BorderRadius.circular(18),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(18),
        child: Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            border: Border.all(color: palette.fg(0.12)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 42,
                height: 42,
                decoration: BoxDecoration(color: kStaffAccent.withValues(alpha: 0.18), shape: BoxShape.circle),
                child: Center(child: HugeIcon(icon: icon, color: kStaffAccent, size: 22)),
              ),
              const Gap(12),
              Text(title, style: GoogleFonts.outfit(fontSize: 16, fontWeight: FontWeight.w600, color: palette.fg())),
              const Gap(2),
              Row(
                children: [
                  if (statusColor != null) ...[
                    Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(color: statusColor, shape: BoxShape.circle),
                    ),
                    const Gap(6),
                  ],
                  Flexible(
                    child: Text(
                      subtitle,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.outfit(fontSize: 13, color: palette.fg(0.6)),
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

/// Origin → destination as a vertical route: dot, connecting line, pin.
class _RouteView extends StatelessWidget {
  const _RouteView({
    required this.fromCity,
    required this.fromAddress,
    required this.toCity,
    required this.toAddress,
  });

  final String fromCity;
  final String fromAddress;
  final String toCity;
  final String toAddress;

  @override
  Widget build(BuildContext context) {
    final palette = StaffPalette.of(context);

    Widget stop(String label, String city, String address) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label, style: GoogleFonts.outfit(fontSize: 13, color: palette.fg(0.55))),
            const Gap(2),
            Text(city, style: GoogleFonts.outfit(fontSize: 18, fontWeight: FontWeight.w600, color: palette.fg())),
            if (address.trim().isNotEmpty && address.trim() != city)
              Padding(
                padding: const EdgeInsets.only(top: 2),
                child: Text(
                  address.trim(),
                  style: GoogleFonts.outfit(fontSize: 14, height: 1.3, color: palette.fg(0.6)),
                ),
              ),
          ],
        );

    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            width: 28,
            child: Column(
              children: [
                const Gap(18),
                Container(
                  width: 14,
                  height: 14,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: kStaffAccent, width: 3),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: CustomPaint(
                      painter: _DashedLinePainter(palette.fg(0.35)),
                      child: const SizedBox(width: 2),
                    ),
                  ),
                ),
                const HugeIcon(icon: HugeIcons.strokeRoundedLocation01, color: kStaffAccent, size: 22),
                const Gap(14),
              ],
            ),
          ),
          const Gap(12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                stop('From', fromCity, fromAddress),
                const Gap(22),
                stop('To', toCity, toAddress),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _DashedLinePainter extends CustomPainter {
  _DashedLinePainter(this.color);

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.round;
    const dash = 4.0, gap = 4.0;
    final x = size.width / 2;
    for (var y = 0.0; y < size.height; y += dash + gap) {
      canvas.drawLine(Offset(x, y), Offset(x, (y + dash).clamp(0, size.height)), paint);
    }
  }

  @override
  bool shouldRepaint(_DashedLinePainter old) => old.color != color;
}

/// Person row: initials avatar, role, name, phone, and a call button.
class _ContactRow extends StatelessWidget {
  const _ContactRow({required this.role, required this.name, required this.phone, required this.onCall});

  final String role;
  final String name;
  final String phone;
  final ValueChanged<String> onCall;

  String get _initials {
    final parts = name.split(RegExp(r'\s+')).where((p) => p.isNotEmpty).toList();
    if (parts.isEmpty) return '?';
    final first = parts.first[0];
    final last = parts.length > 1 ? parts.last[0] : '';
    return (first + last).toUpperCase();
  }

  @override
  Widget build(BuildContext context) {
    final palette = StaffPalette.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(color: kStaffAccent.withValues(alpha: 0.18), shape: BoxShape.circle),
            child: Center(
              child: Text(
                _initials,
                style: GoogleFonts.outfit(fontSize: 16, fontWeight: FontWeight.w700, color: kStaffAccent),
              ),
            ),
          ),
          const Gap(14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(role, style: GoogleFonts.outfit(fontSize: 13, color: palette.fg(0.55))),
                Text(
                  name.isNotEmpty ? name : 'Not provided',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.outfit(fontSize: 17, fontWeight: FontWeight.w600, color: palette.fg()),
                ),
                if (phone.isNotEmpty)
                  Text(phone, style: GoogleFonts.outfit(fontSize: 14, color: palette.fg(0.7))),
              ],
            ),
          ),
          if (phone.isNotEmpty)
            Tooltip(
              message: 'Call $role',
              child: Material(
                color: palette.surface(0.15),
                shape: const CircleBorder(),
                child: InkWell(
                  customBorder: const CircleBorder(),
                  onTap: () => onCall(phone),
                  child: const SizedBox(
                    width: 42,
                    height: 42,
                    child: Center(child: HugeIcon(icon: HugeIcons.strokeRoundedCall, color: kStaffAccent, size: 20)),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

/// Small tile in the parcel details grid.
class _DetailTile extends StatelessWidget {
  const _DetailTile({required this.icon, required this.label, required this.value, this.highlight = false});

  final List<List<dynamic>> icon;
  final String label;
  final String value;
  final bool highlight;

  @override
  Widget build(BuildContext context) {
    final palette = StaffPalette.of(context);
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(color: palette.surface(0.08), borderRadius: BorderRadius.circular(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HugeIcon(icon: icon, color: palette.fg(0.8), size: 20),
          const Gap(10),
          Text(label, style: GoogleFonts.outfit(fontSize: 13, color: palette.fg(0.55))),
          const Gap(2),
          Text(
            value,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.outfit(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: highlight ? kStaffAccent : palette.fg(),
            ),
          ),
        ],
      ),
    );
  }
}

class _TimelineStep extends StatelessWidget {
  const _TimelineStep({
    required this.label,
    required this.time,
    required this.done,
    this.failed = false,
    this.isLast = false,
  });

  final String label;
  final String time;
  final bool done;
  final bool failed;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    final palette = StaffPalette.of(context);
    final active = done || failed;
    final color = failed ? kStaffDanger : (done ? kStaffSuccess : palette.fg(0.35));

    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            width: 28,
            child: Column(
              children: [
                Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: active ? color.withValues(alpha: 0.2) : Colors.transparent,
                    border: Border.all(color: color, width: 2),
                  ),
                  child: active
                      ? Icon(failed ? Icons.close_rounded : Icons.check_rounded, size: 14, color: color)
                      : null,
                ),
                if (!isLast)
                  Expanded(
                    child: Container(width: 2, color: done ? kStaffSuccess : palette.fg(0.15)),
                  ),
              ],
            ),
          ),
          const Gap(16),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(bottom: isLast ? 0 : 22),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: GoogleFonts.outfit(
                      fontSize: 16,
                      fontWeight: active ? FontWeight.w600 : FontWeight.w400,
                      color: active ? palette.fg() : palette.fg(0.55),
                    ),
                  ),
                  const Gap(2),
                  Text(time, style: GoogleFonts.outfit(fontSize: 14, color: palette.fg(0.55))),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

extension on String {
  /// null when empty — for optional subtitles.
  String? get ifEmptyNull => isEmpty ? null : this;
}
