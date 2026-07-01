import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:print_bluetooth_thermal/print_bluetooth_thermal.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../providers/printer_provider.dart';
import '../../../theme/app_theme.dart';
import '../../../widgets/profile/premium_settings_components.dart';

class PrinterConfigurationScreen extends StatefulWidget {
  const PrinterConfigurationScreen({super.key});

  @override
  State<PrinterConfigurationScreen> createState() => _PrinterConfigurationScreenState();
}

class _PrinterConfigurationScreenState extends State<PrinterConfigurationScreen> {
  bool _bluetoothEnabled = false;

  @override
  void initState() {
    super.initState();
    _initBluetooth();
  }

  Future<void> _initBluetooth() async {
    // Request permissions for Android 12+
    await [
      Permission.bluetooth,
      Permission.bluetoothScan,
      Permission.bluetoothConnect,
      Permission.location,
    ].request();

    try {
      bool enabled = await PrintBluetoothThermal.bluetoothEnabled;
      setState(() {
        _bluetoothEnabled = enabled;
      });
      if (enabled && mounted) {
        context.read<PrinterProvider>().scanDevices();
      }
    } catch (e) {
      debugPrint("Error initializing bluetooth check: $e");
    }
  }

  Future<void> _connectToPrinter(BuildContext context, BluetoothInfo device) async {
    final provider = context.read<PrinterProvider>();
    if (provider.isConnected && provider.lastPrinterMac == device.macAdress) {
      _showPrinterOptions(context, device, provider);
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Connecting to ${device.name}..."),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        duration: const Duration(seconds: 1),
      ),
    );

    final success = await provider.connect(device);
    if (!context.mounted) return;

    if (success) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Successfully connected to ${device.name}"),
          backgroundColor: Colors.green,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Failed to connect to ${device.name}"),
          backgroundColor: Colors.red,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
      );
    }
  }

  void _showPrinterOptions(BuildContext context, BluetoothInfo device, PrinterProvider provider) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: AppTheme.surface,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(32)),
          border: Border(
            top: BorderSide(color: AppTheme.border),
            left: BorderSide(color: AppTheme.border),
            right: BorderSide(color: AppTheme.border),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: AppTheme.border,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            const Gap(32),
            Text(
              'PRINTER OPTIONS', 
              style: GoogleFonts.inter(color: AppTheme.cPrimary, fontSize: 10, fontWeight: FontWeight.w900, letterSpacing: 2)
            ),
            const Gap(12),
            Text(
              device.name.isNotEmpty ? device.name : 'Unknown Printer', 
              style: GoogleFonts.outfit(
                color: isDark ? Colors.white : const Color(0xFF0F172A),
                fontSize: 20,
                fontWeight: FontWeight.w900,
              ),
            ),
            const Gap(4),
            Text(
              'MAC: ${device.macAdress}', 
              style: GoogleFonts.inter(
                color: isDark ? Colors.white38 : const Color(0xFF64748B),
                fontSize: 12,
              ),
            ),
            const Gap(32),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.pop(context);
                  _printTestPage(context, device, provider);
                },
                icon: const HugeIcon(icon: HugeIcons.strokeRoundedPrinter, color: Colors.white, size: 20),
                label: Text('PRINT TEST PAGE', style: GoogleFonts.inter(fontWeight: FontWeight.bold, color: Colors.white)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.cPrimary,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
              ),
            ),
            const Gap(16),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: OutlinedButton.icon(
                onPressed: () {
                  Navigator.pop(context);
                  provider.disconnect();
                },
                icon: const HugeIcon(icon: HugeIcons.strokeRoundedPlugSocket, color: Colors.redAccent, size: 20),
                label: Text('DISCONNECT', style: GoogleFonts.inter(color: Colors.redAccent, fontWeight: FontWeight.bold)),
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Colors.redAccent),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
              ),
            ),
            const Gap(32),
          ],
        ),
      ),
    );
  }

  Future<void> _printTestPage(BuildContext context, BluetoothInfo device, PrinterProvider provider) async {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Printing test page to ${device.name}..."),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        duration: const Duration(seconds: 1),
      ),
    );

    final success = await provider.printTestTicket();

    if (!context.mounted) return;

    if (success) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text("Test page printed successfully!"),
          backgroundColor: Colors.green,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text("Failed to print test page"),
          backgroundColor: Colors.red,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
      );
    }
  }

  void _openScanModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) => _PairedDevicesModal(
        onConnect: (device) => _connectToPrinter(context, device),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<PrinterProvider>();
    final lastMac = provider.lastPrinterMac;
    final lastName = provider.lastPrinterName;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: const SettingsAppBar(title: 'Printer Configuration'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── Connected Printers Title ───────────────────────────────────
            Text(
              'CONNECTED PRINTERS',
              style: GoogleFonts.inter(
                color: isDark ? Colors.white38 : const Color(0xFF64748B),
                fontSize: 11,
                fontWeight: FontWeight.w900,
                letterSpacing: 1.5,
              ),
            ),
            const Gap(16),

            // ── Bluetooth Check Block ──────────────────────────────────────
            if (!_bluetoothEnabled)
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.red.withValues(alpha: 0.08),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.red.withValues(alpha: 0.2)),
                ),
                child: Row(
                  children: [
                    const HugeIcon(icon: HugeIcons.strokeRoundedBluetooth, color: Colors.red, size: 20),
                    const Gap(12),
                    Expanded(
                      child: Text(
                        'Bluetooth is disabled. Enable it in device settings.', 
                        style: GoogleFonts.inter(color: Colors.red, fontSize: 13)
                      ),
                    ),
                  ],
                ),
              )
            else if (provider.isConnected && lastMac != null)
              GestureDetector(
                onTap: () {
                  final device = BluetoothInfo(macAdress: lastMac, name: lastName ?? 'Unknown Printer');
                  _showPrinterOptions(context, device, provider);
                },
                child: _buildPrinterCard(
                  context,
                  lastName ?? 'Unknown Printer',
                  'Bluetooth • Connected',
                  HugeIcons.strokeRoundedBluetooth,
                  Colors.green,
                  isDefault: true,
                ),
              )
            else ...[
              // ── Previously connected ─────────────────────────────────────
              if (lastMac != null) ...[
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: AppTheme.surface,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: AppTheme.border),
                    boxShadow: isDark
                        ? null
                        : [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.02),
                              blurRadius: 8,
                              offset: const Offset(0, 2),
                            ),
                          ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'PREVIOUSLY CONNECTED', 
                        style: GoogleFonts.inter(
                          color: isDark ? Colors.white38 : const Color(0xFF64748B),
                          fontSize: 10,
                          fontWeight: FontWeight.w900,
                          letterSpacing: 1.5,
                        ),
                      ),
                      const Gap(12),
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: AppTheme.cPrimary.withValues(alpha: 0.1),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: HugeIcon(icon: HugeIcons.strokeRoundedBluetooth, color: AppTheme.cPrimary, size: 22),
                          ),
                          const Gap(14),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  lastName ?? 'Printer', 
                                  style: GoogleFonts.outfit(
                                    color: isDark ? Colors.white : const Color(0xFF0F172A),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                ),
                                const Gap(2),
                                Text(
                                  'MAC: $lastMac', 
                                  style: GoogleFonts.inter(
                                    color: isDark ? Colors.white38 : const Color(0xFF64748B),
                                    fontSize: 11,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const Gap(18),
                      Row(
                        children: [
                          Expanded(
                            child: SizedBox(
                              height: 48,
                              child: ElevatedButton.icon(
                                onPressed: () {
                                  final device = BluetoothInfo(macAdress: lastMac, name: lastName ?? 'Printer');
                                  _connectToPrinter(context, device);
                                },
                                icon: const HugeIcon(icon: HugeIcons.strokeRoundedBluetooth, color: Colors.white, size: 16),
                                label: Text('RECONNECT', style: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white)),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppTheme.cPrimary,
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                                  padding: EdgeInsets.zero,
                                ),
                              ),
                            ),
                          ),
                          const Gap(10),
                          Expanded(
                            child: SizedBox(
                              height: 48,
                              child: OutlinedButton.icon(
                                onPressed: () => _openScanModal(context),
                                icon: HugeIcon(icon: HugeIcons.strokeRoundedBluetoothSearch, color: AppTheme.cPrimary, size: 16),
                                label: Text('SCAN', style: GoogleFonts.inter(color: AppTheme.cPrimary, fontSize: 12, fontWeight: FontWeight.bold)),
                                style: OutlinedButton.styleFrom(
                                  side: BorderSide(color: AppTheme.cPrimary),
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                                  padding: EdgeInsets.zero,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ] else
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 28, horizontal: 16),
                  decoration: BoxDecoration(
                    color: AppTheme.surface,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: AppTheme.border,
                    ),
                    boxShadow: isDark
                        ? null
                        : [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.02),
                              blurRadius: 8,
                              offset: const Offset(0, 2),
                            ),
                          ],
                  ),
                  child: Column(
                    children: [
                      HugeIcon(
                        icon: HugeIcons.strokeRoundedPrinter,
                        color: isDark ? Colors.white38 : const Color(0xFFCBD5E1),
                        size: 36,
                      ),
                      const Gap(14),
                      Text(
                        'No printer connected',
                        style: GoogleFonts.inter(
                          color: isDark ? Colors.white38 : const Color(0xFF64748B),
                          fontSize: 14,
                        ),
                      ),
                      const Gap(6),
                      Text(
                        'Pair your thermal printer via Bluetooth settings first.', 
                        textAlign: TextAlign.center, 
                        style: GoogleFonts.inter(
                          color: isDark ? Colors.white24 : const Color(0xFF94A3B8),
                          fontSize: 12,
                        ),
                      ),
                      const Gap(18),
                      SizedBox(
                        width: double.infinity,
                        height: 48,
                        child: ElevatedButton.icon(
                          onPressed: () => _openScanModal(context),
                          icon: const HugeIcon(icon: HugeIcons.strokeRoundedBluetoothSearch, color: Colors.white, size: 18),
                          label: Text('SCAN FOR PRINTERS', style: GoogleFonts.inter(fontWeight: FontWeight.bold, color: Colors.white)),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppTheme.cPrimary,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
            ],
            const Gap(32),

            // ── Print History ──────────────────────────────────────────────
            _buildPrinterHistory(provider),
            const Gap(48),

            // ── Setup Guide ────────────────────────────────────────────────
            _buildSetupGuide(),
          ],
        ),
      ),
    );
  }

  Widget _buildPrinterCard(
    BuildContext context,
    String name,
    String status,
    dynamic icon,
    Color statusColor, {
    bool isDefault = false,
  }) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppTheme.surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isDefault
              ? AppTheme.cPrimary.withValues(alpha: isDark ? 0.3 : 0.6)
              : AppTheme.border,
        ),
        boxShadow: isDark
            ? null
            : [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.02),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppTheme.background,
              borderRadius: BorderRadius.circular(12),
            ),
            child: HugeIcon(
              icon: icon,
              color: isDefault ? AppTheme.cPrimary : (isDark ? Colors.white38 : const Color(0xFF64748B)),
              size: 24,
            ),
          ),
          const Gap(16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: GoogleFonts.outfit(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: isDark ? Colors.white : const Color(0xFF0F172A),
                  ),
                ),
                const Gap(4),
                Row(
                  children: [
                    Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(color: statusColor, shape: BoxShape.circle),
                    ),
                    const Gap(8),
                    Text(
                      status,
                      style: GoogleFonts.inter(
                        color: isDark ? Colors.white38 : const Color(0xFF64748B),
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          if (isDefault)
            const HugeIcon(icon: HugeIcons.strokeRoundedCheckmarkCircle02, color: Colors.green, size: 20)
          else
            HugeIcon(
              icon: HugeIcons.strokeRoundedArrowRight01,
              color: isDark ? Colors.white38 : const Color(0xFF94A3B8),
              size: 20,
            ),
        ],
      ),
    );
  }

  Widget _buildPrinterHistory(PrinterProvider provider) {
    final history = provider.history;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'PRINT HISTORY',
              style: GoogleFonts.inter(
                color: isDark ? Colors.white38 : const Color(0xFF64748B),
                fontSize: 12,
                fontWeight: FontWeight.w900,
                letterSpacing: 1.5,
              ),
            ),
            if (history.isNotEmpty)
              TextButton(
                onPressed: () => provider.clearHistory(),
                style: TextButton.styleFrom(padding: EdgeInsets.zero, minimumSize: Size.zero),
                child: Text('Clear', style: GoogleFonts.inter(color: Colors.redAccent, fontSize: 12, fontWeight: FontWeight.bold)),
              ),
          ],
        ),
        const Gap(16),
        if (history.isEmpty)
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 32),
              child: Text(
                'No print history found.', 
                style: GoogleFonts.inter(
                  color: isDark ? Colors.white24 : const Color(0xFF94A3B8),
                  fontSize: 12,
                ),
              ),
            ),
          )
        else
          ...history.map((item) => _buildHistoryItem(
                context,
                item.title,
                DateFormat('MM/dd/yyyy, HH:mm a').format(item.time),
                item.success,
              )),
      ],
    );
  }

  Widget _buildHistoryItem(BuildContext context, String title, String time, bool success) {
    final successColor = success ? Colors.green : Colors.red;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppTheme.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppTheme.border,
        ),
        boxShadow: isDark
            ? null
            : [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.02),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: successColor.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: HugeIcon(
              icon: HugeIcons.strokeRoundedDocumentValidation,
              color: successColor,
              size: 20,
            ),
          ),
          const Gap(16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.outfit(
                    color: isDark ? Colors.white : const Color(0xFF0F172A),
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                  ),
                ),
                const Gap(4),
                Text(
                  time,
                  style: GoogleFonts.inter(
                    color: isDark ? Colors.white38 : const Color(0xFF64748B),
                    fontSize: 11,
                  ),
                ),
              ],
            ),
          ),
          Text(
            success ? 'SUCCESS' : 'FAILED', 
            style: GoogleFonts.inter(color: successColor, fontSize: 10, fontWeight: FontWeight.bold)
          ),
        ],
      ),
    );
  }

  Widget _buildSetupGuide() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [AppTheme.cPrimary.withValues(alpha: 0.1), Colors.transparent],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: AppTheme.cPrimary.withValues(alpha: 0.1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              HugeIcon(icon: HugeIcons.strokeRoundedInformationCircle, color: AppTheme.cPrimary, size: 20),
              const Gap(12),
              Text(
                'QUICK SETUP GUIDE',
                style: GoogleFonts.inter(color: AppTheme.cPrimary, fontWeight: FontWeight.bold, fontSize: 12, letterSpacing: 1.0),
              ),
            ],
          ),
          const Gap(16),
          _buildGuideStep('1', 'Ensure your printer is powered on and in pairing mode.'),
          _buildGuideStep('2', 'Select the device from the available list above.'),
          _buildGuideStep('3', 'Print a test label to verify calibration.'),
        ],
      ),
    );
  }

  Widget _buildGuideStep(String num, String text) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            num,
            style: GoogleFonts.inter(color: AppTheme.cPrimary, fontWeight: FontWeight.bold, fontSize: 12),
          ),
          const Gap(12),
          Expanded(
            child: Text(
              text,
              style: GoogleFonts.inter(
                color: isDark ? Colors.white38 : const Color(0xFF64748B),
                fontSize: 13,
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _PairedDevicesModal extends StatefulWidget {
  final Function(BluetoothInfo) onConnect;

  const _PairedDevicesModal({required this.onConnect});

  @override
  State<_PairedDevicesModal> createState() => _PairedDevicesModalState();
}

class _PairedDevicesModalState extends State<_PairedDevicesModal> {
  bool _isScanning = false;
  List<BluetoothInfo> _availableDevices = [];

  @override
  void initState() {
    super.initState();
    _startScan();
  }

  Future<void> _startScan() async {
    if (mounted) setState(() => _isScanning = true);
    try {
      final List<BluetoothInfo> devices = await PrintBluetoothThermal.pairedBluetooths;
      if (mounted) {
        setState(() {
          _availableDevices = devices;
          _isScanning = false;
        });
      }
    } catch (e) {
      if (mounted) setState(() => _isScanning = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppTheme.surface,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(32)),
        border: Border(
          top: BorderSide(color: AppTheme.border),
          left: BorderSide(color: AppTheme.border),
          right: BorderSide(color: AppTheme.border),
        ),
      ),
      constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height * 0.7),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: AppTheme.border,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          const Gap(32),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'PAIRED DEVICES', 
                style: GoogleFonts.inter(
                  color: isDark ? Colors.white38 : const Color(0xFF64748B),
                  fontSize: 12,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 1.5,
                ),
              ),
              if (_isScanning)
                SizedBox(
                  width: 16,
                  height: 16,
                  child: CircularProgressIndicator(strokeWidth: 2, valueColor: AlwaysStoppedAnimation<Color>(AppTheme.cPrimary))
                )
              else
                TextButton.icon(
                  onPressed: _startScan,
                  icon: HugeIcon(icon: HugeIcons.strokeRoundedRefresh, size: 14, color: AppTheme.cPrimary),
                  label: Text('Refresh', style: GoogleFonts.inter(color: AppTheme.cPrimary, fontSize: 12)),
                ),
            ],
          ),
          const Gap(16),
          Expanded(
            child: _availableDevices.isEmpty && !_isScanning
                ? Center(
                    child: Text(
                      'No paired devices found.',
                      style: GoogleFonts.inter(
                        color: isDark ? Colors.white38 : const Color(0xFF64748B),
                        fontSize: 12,
                      ),
                    ),
                  )
                : ListView.builder(
                    itemCount: _availableDevices.length,
                    itemBuilder: (context, index) {
                      final device = _availableDevices[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                          widget.onConnect(device);
                        },
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 12),
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: AppTheme.surface,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: AppTheme.border,
                            ),
                            boxShadow: isDark
                                ? null
                                : [
                                    BoxShadow(
                                      color: Colors.black.withValues(alpha: 0.02),
                                      blurRadius: 8,
                                      offset: const Offset(0, 2),
                                    ),
                                  ],
                          ),
                          child: Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: AppTheme.background,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: HugeIcon(
                                  icon: HugeIcons.strokeRoundedBluetooth,
                                  color: isDark ? Colors.white38 : const Color(0xFF64748B),
                                  size: 24,
                                ),
                              ),
                              const Gap(16),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      device.name.isNotEmpty ? device.name : 'Unknown Device', 
                                      style: GoogleFonts.outfit(
                                        color: isDark ? Colors.white : const Color(0xFF0F172A),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                      ),
                                    ),
                                    const Gap(4),
                                    Text(
                                      'MAC: ${device.macAdress}', 
                                      style: GoogleFonts.inter(
                                        color: isDark ? Colors.white38 : const Color(0xFF64748B),
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
