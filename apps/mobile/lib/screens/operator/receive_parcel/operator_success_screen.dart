import 'package:flutter/material.dart';
import 'operator_receiver_screen.dart' show ReceiveContactDraft;
import 'package:google_fonts/google_fonts.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:provider/provider.dart';

import '../../../providers/printer_provider.dart';
import '../../../widgets/printer_selection_sheet.dart';
import '../../../theme/staff_palette.dart';
import '../../../widgets/profile/premium_settings_components.dart';
import '../../../widgets/staff/parcel_cards.dart';
import '../../../widgets/staff/staff_settings.dart';

class OperatorSuccessScreen extends StatefulWidget {
  final Map<String, dynamic> packageData;

  const OperatorSuccessScreen({super.key, required this.packageData});

  @override
  State<OperatorSuccessScreen> createState() => _OperatorSuccessScreenState();
}

class _OperatorSuccessScreenState extends State<OperatorSuccessScreen> {
  bool _autoprintAttempted = false;

  @override
  void initState() {
    super.initState();
    ReceiveContactDraft.clear(); // parcel saved — next one starts empty
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _autoPrint();
    });
  }

  Future<void> _autoPrint() async {
    if (_autoprintAttempted) return;
    _autoprintAttempted = true;

    final provider = context.read<PrinterProvider>();

    // Attempt auto-connection if not already connected
    if (!provider.isConnected && provider.lastPrinterMac != null) {
      await provider.connectToLastPrinter();
    }

    if (provider.isConnected) {
      if (mounted) {
        await _executePrint(context, provider, false); // false = receipt
      }
    }
  }

  Future<void> _handlePrint(BuildContext context, {required bool isSticker}) async {
    final provider = context.read<PrinterProvider>();

    // If printer is already connected, print directly
    if (provider.isConnected) {
      _executePrint(context, provider, isSticker);
      return;
    }

    // Otherwise, select from the list of connected/available Bluetooth devices
    PrinterSelectionSheet.show(
      context,
      onDeviceSelected: (device) {
        _executePrint(context, provider, isSticker);
      },
    );
  }

  Future<void> _executePrint(BuildContext context, PrinterProvider provider, bool isSticker) async {
    MizigoToasts.showSuccess(context, isSticker ? 'Printing label…' : 'Printing receipt…');
    final ok = isSticker
        ? await provider.printLabel(widget.packageData)
        : await provider.printReceipt(widget.packageData);
    if (!context.mounted) return;
    if (ok) {
      MizigoToasts.showSuccess(context, isSticker ? 'Label printed' : 'Receipt printed');
    } else {
      MizigoToasts.showError(context, 'Print failed. Check the printer and try again.');
    }
  }

  @override
  Widget build(BuildContext context) {
    final palette = StaffPalette.of(context);
    final d = widget.packageData;
    final printerReady = context.watch<PrinterProvider>().isConnected;
    final tracking = (d['trackingId'] ?? '').toString();
    final item = (d['packageName'] ?? d['description'] ?? 'Parcel').toString();

    return PopScope(
      // The parcel is saved; going back would re-open the payment step.
      canPop: false,
      onPopInvokedWithResult: (didPop, _) {
        if (!didPop) context.go('/operations');
      },
      child: StaffSettingsScaffold(
        title: 'Parcel Received',
        bottom: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            StaffButton(
              label: 'Receive Another Parcel',
              icon: HugeIcons.strokeRoundedPackageReceive,
              onPressed: () => context.go('/operator-receive/details'),
            ),
            const Gap(10),
            StaffButton(
              label: 'Back to Operations',
              color: palette.fg(0.8),
              outlined: true,
              onPressed: () => context.go('/operations'),
            ),
          ],
        ),
        children: [
          const Gap(8),
          Center(
            child: TweenAnimationBuilder<double>(
              tween: Tween(begin: 0.6, end: 1),
              duration: const Duration(milliseconds: 450),
              curve: Curves.easeOutBack,
              builder: (_, scale, child) => Transform.scale(scale: scale, child: child),
              child: Container(
                width: 88,
                height: 88,
                decoration: BoxDecoration(color: kStaffSuccess.withValues(alpha: 0.18), shape: BoxShape.circle),
                child: Center(
                  child: Container(
                    width: 60,
                    height: 60,
                    decoration: const BoxDecoration(color: Color(0xFF059669), shape: BoxShape.circle),
                    child: const Icon(Icons.check_rounded, color: Colors.white, size: 36),
                  ),
                ),
              ),
            ),
          ),
          const Gap(16),
          Text(
            'Parcel registered',
            textAlign: TextAlign.center,
            style: GoogleFonts.outfit(fontSize: 24, fontWeight: FontWeight.w700, color: palette.fg()),
          ),
          const Gap(6),
          Text(
            '“$item” from ${d['senderName'] ?? 'the sender'} is ready to be dispatched.',
            textAlign: TextAlign.center,
            style: GoogleFonts.outfit(fontSize: 15, height: 1.4, color: palette.fg(0.7)),
          ),
          if (tracking.isNotEmpty) ...[
            const Gap(16),
            Center(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                decoration: BoxDecoration(
                  color: palette.surface(0.12),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: palette.fg(0.15)),
                ),
                child: Column(
                  children: [
                    Text('Tracking number', style: GoogleFonts.outfit(fontSize: 13, color: palette.fg(0.55))),
                    SelectableText(
                      tracking,
                      style: GoogleFonts.outfit(
                        fontSize: 24,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 2,
                        color: palette.fg(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
          const Gap(20),
          ParcelRouteStrip(
            from: (d['originStation'] ?? '—').toString(),
            to: (d['destinationStation'] ?? '—').toString(),
          ),
          const Gap(16),
          Row(
            children: [
              Expanded(
                child: _PrintTile(
                  icon: HugeIcons.strokeRoundedLabel,
                  title: 'Print Sticker',
                  subtitle: 'Label for the parcel',
                  ready: printerReady,
                  onTap: () => _handlePrint(context, isSticker: true),
                ),
              ),
              const Gap(10),
              Expanded(
                child: _PrintTile(
                  icon: HugeIcons.strokeRoundedPrinter,
                  title: 'Print Receipt',
                  subtitle: 'Copy for the sender',
                  ready: printerReady,
                  onTap: () => _handlePrint(context, isSticker: false),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _PrintTile extends StatelessWidget {
  const _PrintTile({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.ready,
    required this.onTap,
  });

  final List<List<dynamic>> icon;
  final String title;
  final String subtitle;
  final bool ready;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final palette = StaffPalette.of(context);
    return Material(
      color: palette.surface(0.10),
      borderRadius: BorderRadius.circular(18),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(18),
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 42,
                height: 42,
                decoration: BoxDecoration(color: kStaffAccent.withValues(alpha: 0.18), shape: BoxShape.circle),
                child: Center(
                  child: HugeIcon(icon: icon, color: kStaffAccent, size: 22),
                ),
              ),
              const Gap(12),
              Text(
                title,
                style: GoogleFonts.outfit(fontSize: 16, fontWeight: FontWeight.w600, color: palette.fg()),
              ),
              const Gap(2),
              Row(
                children: [
                  Container(
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(color: ready ? kStaffSuccess : palette.fg(0.35), shape: BoxShape.circle),
                  ),
                  const Gap(6),
                  Flexible(
                    child: Text(
                      ready ? subtitle : 'No printer connected',
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
