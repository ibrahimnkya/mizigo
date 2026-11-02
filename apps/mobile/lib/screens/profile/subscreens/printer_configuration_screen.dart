import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:print_bluetooth_thermal/print_bluetooth_thermal.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../providers/printer_provider.dart';
import '../../../theme/staff_palette.dart';
import '../../../widgets/profile/premium_settings_components.dart';
import '../../../widgets/staff/staff_settings.dart';

/// Printer Settings — same glass layout as App Settings: printer status with
/// its actions, recent print history and a short setup guide.
class PrinterConfigurationScreen extends StatefulWidget {
  const PrinterConfigurationScreen({super.key});

  @override
  State<PrinterConfigurationScreen> createState() => _PrinterConfigurationScreenState();
}

class _PrinterConfigurationScreenState extends State<PrinterConfigurationScreen> {
  static const _historyLimit = 10;

  /// null while checking.
  bool? _bluetoothEnabled;
  bool _printingTest = false;

  @override
  void initState() {
    super.initState();
    _checkBluetooth();
  }

  Future<void> _checkBluetooth() async {
    // Android 12+ needs these before Bluetooth can be queried.
    await [
      Permission.bluetooth,
      Permission.bluetoothScan,
      Permission.bluetoothConnect,
      Permission.location,
    ].request();

    var enabled = false;
    try {
      enabled = await PrintBluetoothThermal.bluetoothEnabled;
    } catch (e) {
      debugPrint('Error checking bluetooth: $e');
    }
    if (!mounted) return;
    setState(() => _bluetoothEnabled = enabled);
    if (enabled) context.read<PrinterProvider>().scanDevices();
  }

  Future<void> _connect(BluetoothInfo device) async {
    final provider = context.read<PrinterProvider>();
    final name = device.name.isNotEmpty ? device.name : 'printer';
    final ok = await provider.connect(device);
    if (!mounted) return;
    if (ok) {
      MizigoToasts.showSuccess(context, 'Connected to $name');
    } else {
      MizigoToasts.showError(context, 'Couldn’t connect to $name. Make sure it’s on and nearby.');
    }
  }

  Future<void> _reconnect() async {
    final provider = context.read<PrinterProvider>();
    final ok = await provider.connectToLastPrinter();
    if (!mounted) return;
    if (ok) {
      MizigoToasts.showSuccess(context, 'Connected to ${provider.lastPrinterName ?? 'printer'}');
    } else {
      MizigoToasts.showError(context, 'Couldn’t reconnect. Make sure the printer is on and nearby.');
    }
  }

  Future<void> _printTest() async {
    setState(() => _printingTest = true);
    final ok = await context.read<PrinterProvider>().printTestTicket();
    if (!mounted) return;
    setState(() => _printingTest = false);
    if (ok) {
      MizigoToasts.showSuccess(context, 'Test page printed');
    } else {
      MizigoToasts.showError(context, 'Failed to print the test page');
    }
  }

  Future<void> _disconnect() async {
    await context.read<PrinterProvider>().disconnect();
    if (mounted) MizigoToasts.showSuccess(context, 'Printer disconnected');
  }

  void _openPrinterPicker() {
    final provider = context.read<PrinterProvider>();
    provider.scanDevices();
    showStaffSheet<void>(
      context,
      title: 'Paired Printers',
      titleAction: Consumer<PrinterProvider>(
        builder: (context, p, _) => p.isLoading
            ? const Padding(
                padding: EdgeInsets.all(12),
                child: SizedBox(
                  width: 18,
                  height: 18,
                  child: CircularProgressIndicator(strokeWidth: 2, color: kStaffAccent),
                ),
              )
            : TextButton(
                onPressed: p.scanDevices,
                child: Text('Refresh', style: GoogleFonts.outfit(fontSize: 16, color: kStaffAccent)),
              ),
      ),
      builder: (sheetContext) => _PrinterPickerList(
        onSelect: (device) {
          Navigator.pop(sheetContext);
          _connect(device);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<PrinterProvider>();

    return StaffSettingsScaffold(
      title: 'Printer Settings',
      onBack: () => Navigator.pop(context),
      onRefresh: _checkBluetooth,
      children: [
        StaffGlassCard(
          title: 'Printer',
          child: _buildPrinterSection(provider),
        ),
        const Gap(10),
        StaffGlassCard(
          title: 'Print History',
          titleAction: provider.history.isEmpty
              ? null
              : GestureDetector(
                  onTap: provider.clearHistory,
                  child: Text('Clear', style: GoogleFonts.outfit(fontSize: 16, color: kStaffDanger)),
                ),
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
          child: _buildHistory(provider),
        ),
        const Gap(10),
        const StaffGlassCard(
          title: 'Setup Guide',
          child: _SetupGuide(),
        ),
      ],
    );
  }

  Widget _buildPrinterSection(PrinterProvider provider) {
    final lastName = provider.lastPrinterName;
    final lastMac = provider.lastPrinterMac;
    final hasLast = lastMac != null && lastMac.isNotEmpty;

    if (_bluetoothEnabled == null) {
      return const Padding(
        padding: EdgeInsets.symmetric(vertical: 16),
        child: Center(child: CircularProgressIndicator(strokeWidth: 2, color: kStaffAccent)),
      );
    }

    if (_bluetoothEnabled == false) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const _PrinterStatus(
            icon: HugeIcons.strokeRoundedBluetoothNotConnected,
            name: 'Bluetooth is off',
            detail: 'Turn on Bluetooth in your phone’s settings to connect a printer.',
            statusColor: kStaffDanger,
          ),
          const Gap(16),
          StaffButton(
            label: 'Check Again',
            icon: HugeIcons.strokeRoundedRefresh,
            onPressed: _checkBluetooth,
          ),
        ],
      );
    }

    if (provider.isConnected && hasLast) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _PrinterStatus(
            icon: HugeIcons.strokeRoundedPrinter,
            name: lastName ?? 'Printer',
            detail: 'Connected • $lastMac',
            statusColor: kStaffSuccess,
          ),
          const Gap(16),
          Row(
            children: [
              Expanded(
                child: StaffButton(
                  label: 'Print Test',
                  icon: HugeIcons.strokeRoundedPrinter,
                  loading: _printingTest,
                  onPressed: _printTest,
                ),
              ),
              const Gap(10),
              Expanded(
                child: StaffButton(
                  label: 'Disconnect',
                  icon: HugeIcons.strokeRoundedPlugSocket,
                  color: kStaffDanger,
                  outlined: true,
                  onPressed: _disconnect,
                ),
              ),
            ],
          ),
          const Gap(6),
          Center(
            child: TextButton(
              onPressed: _openPrinterPicker,
              child: Text('Use a different printer', style: GoogleFonts.outfit(fontSize: 15, color: kStaffAccent)),
            ),
          ),
        ],
      );
    }

    if (hasLast) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _PrinterStatus(
            icon: HugeIcons.strokeRoundedPrinter,
            name: lastName ?? 'Printer',
            detail: 'Not connected • $lastMac',
            statusColor: StaffPalette.of(context).fg(0.4),
          ),
          const Gap(16),
          Row(
            children: [
              Expanded(
                child: StaffButton(
                  label: 'Reconnect',
                  icon: HugeIcons.strokeRoundedLink01,
                  loading: provider.isConnecting,
                  onPressed: _reconnect,
                ),
              ),
              const Gap(10),
              Expanded(
                child: StaffButton(
                  label: 'Find Printers',
                  icon: HugeIcons.strokeRoundedSearch01,
                  color: kStaffAccent,
                  outlined: true,
                  onPressed: provider.isConnecting ? null : _openPrinterPicker,
                ),
              ),
            ],
          ),
        ],
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _PrinterStatus(
          icon: HugeIcons.strokeRoundedPrinter,
          name: 'No printer yet',
          detail: 'Pair your thermal printer in your phone’s Bluetooth settings, then find it here.',
          statusColor: StaffPalette.of(context).fg(0.4),
        ),
        const Gap(16),
        StaffButton(
          label: 'Find Printers',
          icon: HugeIcons.strokeRoundedSearch01,
          loading: provider.isConnecting,
          onPressed: _openPrinterPicker,
        ),
      ],
    );
  }

  Widget _buildHistory(PrinterProvider provider) {
    final palette = StaffPalette.of(context);
    final history = provider.history.take(_historyLimit).toList();

    if (history.isEmpty) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 12),
        child: Text(
          'Receipts and labels you print will show up here.',
          style: GoogleFonts.outfit(fontSize: 15, color: palette.fg(0.6)),
        ),
      );
    }

    final format = DateFormat('d MMM, h:mm a');
    return Column(
      children: [
        for (var i = 0; i < history.length; i++) ...[
          if (i == 0) const StaffDivider(),
          SizedBox(
            height: 60,
            child: Row(
              children: [
                HugeIcon(
                  icon: history[i].success
                      ? HugeIcons.strokeRoundedCheckmarkCircle02
                      : HugeIcons.strokeRoundedAlertCircle,
                  color: history[i].success ? kStaffSuccess : kStaffDanger,
                  size: 22,
                ),
                const Gap(16),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        history[i].title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.outfit(fontSize: 16, color: palette.fg()),
                      ),
                      Text(
                        format.format(history[i].time),
                        style: GoogleFonts.outfit(fontSize: 13, color: palette.fg(0.55)),
                      ),
                    ],
                  ),
                ),
                Text(
                  history[i].success ? 'Printed' : 'Failed',
                  style: GoogleFonts.outfit(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: history[i].success ? kStaffSuccess : kStaffDanger,
                  ),
                ),
              ],
            ),
          ),
          if (i < history.length - 1) const StaffDivider(),
        ],
      ],
    );
  }
}

/// Printer icon tile with a status dot, name and a detail line.
class _PrinterStatus extends StatelessWidget {
  const _PrinterStatus({
    required this.icon,
    required this.name,
    required this.detail,
    required this.statusColor,
  });

  final List<List<dynamic>> icon;
  final String name;
  final String detail;
  final Color statusColor;

  @override
  Widget build(BuildContext context) {
    final palette = StaffPalette.of(context);
    return Row(
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              width: 52,
              height: 52,
              decoration: BoxDecoration(color: palette.surface(0.15), borderRadius: BorderRadius.circular(14)),
              child: Center(child: HugeIcon(icon: icon, color: palette.fg(), size: 26)),
            ),
            Positioned(
              top: -3,
              right: -3,
              child: Container(
                width: 14,
                height: 14,
                decoration: BoxDecoration(
                  color: statusColor,
                  shape: BoxShape.circle,
                  border: Border.all(color: palette.navBackground, width: 2),
                ),
              ),
            ),
          ],
        ),
        const Gap(16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.outfit(fontSize: 18, fontWeight: FontWeight.w600, color: palette.fg()),
              ),
              const Gap(2),
              Text(detail, style: GoogleFonts.outfit(fontSize: 14, height: 1.35, color: palette.fg(0.6))),
            ],
          ),
        ),
      ],
    );
  }
}

/// Paired Bluetooth devices, shown in the "Paired Printers" sheet.
class _PrinterPickerList extends StatelessWidget {
  const _PrinterPickerList({required this.onSelect});

  final ValueChanged<BluetoothInfo> onSelect;

  @override
  Widget build(BuildContext context) {
    final palette = StaffPalette.of(context);
    final provider = context.watch<PrinterProvider>();
    final devices = provider.devices;

    if (devices.isEmpty) {
      return Padding(
        padding: const EdgeInsets.fromLTRB(24, 8, 24, 24),
        child: Text(
          provider.isLoading
              ? 'Looking for paired printers…'
              : 'No paired printers found. Pair your printer in your phone’s Bluetooth settings, then tap Refresh.',
          style: GoogleFonts.outfit(fontSize: 15, height: 1.4, color: palette.fg(0.6)),
        ),
      );
    }

    return ListView.builder(
      shrinkWrap: true,
      padding: const EdgeInsets.only(bottom: 8),
      itemCount: devices.length,
      itemBuilder: (context, i) {
        final d = devices[i];
        final isCurrent = provider.isConnected && provider.lastPrinterMac == d.macAdress;
        return StaffSheetTile(
          icon: HugeIcons.strokeRoundedPrinter,
          label: d.name.isNotEmpty ? d.name : 'Unknown device',
          subtitle: d.macAdress,
          selected: isCurrent,
          onTap: isCurrent ? null : () => onSelect(d),
        );
      },
    );
  }
}

class _SetupGuide extends StatelessWidget {
  const _SetupGuide();

  static const _steps = [
    'Turn the printer on and put it in pairing mode.',
    'Pair it in your phone’s Bluetooth settings.',
    'Tap Find Printers above and choose it.',
    'Print a test page to check the paper and alignment.',
  ];

  @override
  Widget build(BuildContext context) {
    final palette = StaffPalette.of(context);
    return Column(
      children: [
        for (var i = 0; i < _steps.length; i++)
          Padding(
            padding: const EdgeInsets.only(bottom: 14),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 26,
                  height: 26,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(color: kStaffAccent.withValues(alpha: 0.18), shape: BoxShape.circle),
                  child: Text(
                    '${i + 1}',
                    style: GoogleFonts.outfit(fontSize: 14, fontWeight: FontWeight.w700, color: kStaffAccent),
                  ),
                ),
                const Gap(14),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 3),
                    child: Text(_steps[i], style: GoogleFonts.outfit(fontSize: 15, height: 1.35, color: palette.fg(0.8))),
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}
