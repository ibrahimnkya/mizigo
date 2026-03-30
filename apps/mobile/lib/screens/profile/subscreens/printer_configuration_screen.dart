import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../../providers/printer_provider.dart';
import '../../../theme/app_theme.dart';
import '../../../widgets/common/neo_container.dart';
import '../../../widgets/common/wheel_rotate.dart';

class PrinterConfigurationScreen extends StatefulWidget {
  const PrinterConfigurationScreen({super.key});

  @override
  State<PrinterConfigurationScreen> createState() => _PrinterConfigurationScreenState();
}

class _PrinterConfigurationScreenState extends State<PrinterConfigurationScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    // Start a scan automatically when entering the screen
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<PrinterProvider>().scanDevices();
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final printerProvider = context.watch<PrinterProvider>();

    return Scaffold(
      backgroundColor: AppTheme.cBlackMain,
      body: Stack(
        children: [
          // Decorative Wheel Background (consistent with ChangePasswordScreen)
          Positioned(
            top: -100,
            right: -100,
            child: WheelRotate(
              size: 300,
              color: AppTheme.cPrimary,
            ),
          ),

          // Main content
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Gap(10),
                _buildHeader(context, printerProvider),
                const Gap(20),
                _buildStatusSection(printerProvider),
                const Gap(24),
                _buildTabs(),
                Expanded(
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      _buildBluetoothSection(printerProvider),
                      _buildUsbSection(printerProvider),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: _buildFABs(context, printerProvider),
    );
  }

  Widget _buildHeader(BuildContext context, PrinterProvider printerProvider) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () => context.pop(),
                icon: const HugeIcon(icon: HugeIcons.strokeRoundedArrowLeft01, color: Colors.white, size: 20),
                style: IconButton.styleFrom(
                  backgroundColor: Colors.white.withValues(alpha: 0.05),
                  padding: const EdgeInsets.all(12),
                ),
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () => _showLogsModal(context, printerProvider),
                    icon: const HugeIcon(icon: HugeIcons.strokeRoundedTask01, color: Colors.white, size: 20),
                    style: IconButton.styleFrom(
                      backgroundColor: Colors.white.withValues(alpha: 0.05),
                      padding: const EdgeInsets.all(12),
                    ),
                  ),
                  const Gap(8),
                  IconButton(
                    onPressed: () => _showHelpModal(context),
                    icon: const HugeIcon(icon: HugeIcons.strokeRoundedHelpCircle, color: Colors.white, size: 20),
                    style: IconButton.styleFrom(
                      backgroundColor: Colors.white.withValues(alpha: 0.05),
                      padding: const EdgeInsets.all(12),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const Gap(24),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Configuration",
                  style: TextStyle(
                    color: Color(0xFF94A3B8),
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Gap(4),
                Text(
                  "Hardware Setup",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatusSection(PrinterProvider provider) {
    final isConnected = provider.isConnected || provider.isUsbPrinter;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.white.withValues(alpha: 0.05),
            Colors.white.withValues(alpha: 0.02),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.white.withValues(alpha: 0.08)),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: (isConnected ? Colors.green : Colors.red).withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                ),
                child: HugeIcon(
                  icon: isConnected ? HugeIcons.strokeRoundedCheckmarkCircle01 : HugeIcons.strokeRoundedAlertCircle,
                  color: isConnected ? Colors.green : Colors.red,
                  size: 24,
                ),
              ),
              const Gap(16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      isConnected ? "Printer Connected" : (provider.statusMessage.contains("Scanning") ? "Searching..." : "No Printer Connected"),
                      style: GoogleFonts.outfit(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      provider.isUsbPrinter ? "Using Internal USB Printer" : (isConnected ? "Active & Ready" : "Printer Offline - Reconnect"),
                      style: GoogleFonts.inter(
                        color: isConnected ? Colors.green.withValues(alpha: 0.7) : Colors.redAccent.withValues(alpha: 0.7),
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              if (isConnected)
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.green.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.green.withValues(alpha: 0.2)),
                  ),
                  child: Text(
                    "ONLINE",
                    style: GoogleFonts.inter(color: Colors.green, fontSize: 10, fontWeight: FontWeight.bold),
                  ),
                ),
            ],
          ),
          if (isConnected) ...[
            const Gap(20),
            Divider(color: Colors.white.withValues(alpha: 0.05)),
            const Gap(12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const HugeIcon(icon: HugeIcons.strokeRoundedAnalytics01, color: Colors.green, size: 14),
                    const Gap(6),
                    Text(
                      "Operational",
                      style: GoogleFonts.inter(color: Colors.green.withValues(alpha: 0.8), fontWeight: FontWeight.w600, fontSize: 12),
                    ),
                  ],
                ),
                if (!provider.isUsbPrinter)
                  TextButton(
                    onPressed: () => provider.disconnect(),
                    style: TextButton.styleFrom(padding: EdgeInsets.zero, minimumSize: Size.zero, tapTargetSize: MaterialTapTargetSize.shrinkWrap),
                    child: Text(
                      "Disconnect",
                      style: GoogleFonts.inter(color: Colors.red.withValues(alpha: 0.6), fontWeight: FontWeight.bold, fontSize: 13),
                    ),
                  ),
              ],
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildTabs() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.03),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.white.withValues(alpha: 0.05)),
        ),
        child: TabBar(
          controller: _tabController,
          indicator: BoxDecoration(
            color: AppTheme.cPrimary,
            borderRadius: BorderRadius.circular(12),
          ),
          indicatorSize: TabBarIndicatorSize.tab,
          dividerColor: Colors.transparent,
          labelColor: AppTheme.cBlackMain,
          unselectedLabelColor: Colors.white54,
          labelStyle: GoogleFonts.inter(fontWeight: FontWeight.bold, fontSize: 13),
          tabs: const [
            Tab(text: "Bluetooth"),
            Tab(text: "USB / Internal"),
          ],
        ),
      ),
    );
  }

  Widget _buildBluetoothSection(PrinterProvider provider) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 100),
      children: [
        // ── Section label ──────────────────────────────────────────────
        Text(
          'AVAILABLE BLUETOOTH PRINTERS',
          style: GoogleFonts.inter(
            color: const Color(0xFF64748B),
            fontSize: 11,
            fontWeight: FontWeight.w800,
            letterSpacing: 1.5,
          ),
        ),
        const Gap(12),

        // ── Printer candidates ─────────────────────────────────────────
        if (provider.isLoading && provider.devices.isEmpty)
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 32),
            child: Center(child: CircularProgressIndicator(color: AppTheme.cPrimary)),
          )
        else if (provider.devices.isEmpty)
          _emptyPrinters()
        else
          ...provider.devices.map((device) {
            final isSelected = provider.connectedMacAddress == device.macAdress;
            final isConnected = isSelected && provider.isConnected;

            // Status label + color
            final String statusLabel;
            final Color statusColor;
            if (isConnected) {
              statusLabel = 'Printer Connected';
              statusColor = Colors.green;
            } else if (isSelected && !provider.isConnected) {
              statusLabel = 'Printer Offline — Reconnect';
              statusColor = Colors.orange;
            } else {
              statusLabel = 'No Printer Connected';
              statusColor = const Color(0xFF64748B);
            }

            return Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFF1E293B),
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(
                    color: isConnected
                        ? Colors.green.withValues(alpha: 0.35)
                        : isSelected
                            ? Colors.orange.withValues(alpha: 0.35)
                            : Colors.white.withValues(alpha: 0.06),
                    width: isSelected ? 1.5 : 1,
                  ),
                ),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: statusColor.withValues(alpha: 0.1),
                        shape: BoxShape.circle,
                      ),
                      child: HugeIcon(
                        icon: HugeIcons.strokeRoundedPrinter,
                        color: statusColor,
                        size: 22,
                      ),
                    ),
                    const Gap(14),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            device.name,
                            style: GoogleFonts.outfit(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 15,
                            ),
                          ),
                          const Gap(2),
                          Row(
                            children: [
                              Container(
                                width: 6, height: 6,
                                decoration: BoxDecoration(
                                  color: statusColor,
                                  shape: BoxShape.circle,
                                ),
                              ),
                              const Gap(6),
                              Text(
                                statusLabel,
                                style: GoogleFonts.inter(
                                  color: statusColor.withValues(alpha: 0.9),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            device.macAdress,
                            style: GoogleFonts.inter(
                              color: Colors.white24,
                              fontSize: 11,
                              letterSpacing: 0.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (isConnected)
                      ElevatedButton(
                        onPressed: () => provider.disconnect(),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red.withValues(alpha: 0.15),
                          foregroundColor: Colors.red,
                          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                          elevation: 0,
                        ),
                        child: Text(
                          'Disconnect',
                          style: GoogleFonts.inter(fontWeight: FontWeight.w800, fontSize: 13),
                        ),
                      )
                    else
                      ElevatedButton(
                        onPressed: () => provider.connect(device),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: isSelected ? Colors.orange.withValues(alpha: 0.15) : AppTheme.cPrimary,
                          foregroundColor: isSelected ? Colors.orange : AppTheme.cBlackMain,
                          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                          elevation: 0,
                        ),
                        child: Text(
                          isSelected ? 'Reconnect' : 'Connect',
                          style: GoogleFonts.inter(fontWeight: FontWeight.w800, fontSize: 13),
                        ),
                      ),
                  ],
                ),
              ),
            );
          }),
      ],
    );
  }

  Widget _emptyPrinters() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: Container(
        padding: const EdgeInsets.all(28),
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.02),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.white.withValues(alpha: 0.05)),
        ),
        child: Column(
          children: [
            HugeIcon(
              icon: HugeIcons.strokeRoundedBluetooth,
              color: Colors.white.withValues(alpha: 0.12),
              size: 52,
            ),
            const Gap(16),
            Text(
              'No Bluetooth Printers Found',
              style: GoogleFonts.outfit(color: Colors.white70, fontSize: 16, fontWeight: FontWeight.w700),
            ),
            const Gap(6),
            Text(
              'Pair your thermal printer via Bluetooth settings first, then tap scan.',
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(color: const Color(0xFF64748B), fontSize: 13, height: 1.5),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildUsbSection(PrinterProvider provider) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.03),
                shape: BoxShape.circle,
              ),
              child: HugeIcon(
                icon: HugeIcons.strokeRoundedSettings01,
                color: provider.isUsbPrinter ? AppTheme.cPrimary : Colors.white.withValues(alpha: 0.1),
                size: 48,
              ),
            ),
            const Gap(24),
            Text(
              provider.isUsbPrinter ? "Internal Printer Active" : "No USB Printer Detected",
              style: GoogleFonts.outfit(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const Gap(8),
            Text(
              provider.isUsbPrinter ? "POS built-in printing is ready for use." : "Plug in a USB printer or use a POS device with built-in printing.",
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(color: Colors.white38, fontSize: 14),
            ),
            const Gap(32),
            if (!provider.isUsbPrinter)
              SizedBox(
                width: 200,
                height: 50,
                child: OutlinedButton(
                  onPressed: () => provider.scanUsbDevices(),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.white,
                    side: const BorderSide(color: Colors.white24),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  child: provider.isLoading
                      ? const SizedBox(width: 20, height: 20, child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white))
                      : Text("Scan for USB", style: GoogleFonts.inter(fontWeight: FontWeight.bold)),
                ),
              ),
          ],
        ),
      ),
    );
  }

  void _showLogsModal(BuildContext context, PrinterProvider provider) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height * 0.6,
        decoration: const BoxDecoration(
          color: Color(0xFF0F172A),
          borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
        ),
        child: Column(
          children: [
            const Gap(12),
            Container(width: 40, height: 4, decoration: BoxDecoration(color: Colors.white10, borderRadius: BorderRadius.circular(2))),
            const Gap(24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Connection Logs", style: GoogleFonts.outfit(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
                  TextButton(
                    onPressed: () => provider.clearLogs(),
                    child: Text("Clear", style: GoogleFonts.inter(color: Colors.redAccent)),
                  ),
                ],
              ),
            ),
            const Gap(16),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                itemCount: provider.logs.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: Text(
                      provider.logs[index],
                      style: GoogleFonts.firaCode(color: Colors.white38, fontSize: 12),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showHelpModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height * 0.75,
        decoration: const BoxDecoration(
          color: Color(0xFF0F172A),
          borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
        ),
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Gap(8),
            Center(child: Container(width: 40, height: 4, decoration: BoxDecoration(color: Colors.white10, borderRadius: BorderRadius.circular(2)))),
            const Gap(24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Connection Guide',
                  style: GoogleFonts.outfit(
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                  ),
                ),
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.close_rounded, color: Colors.white38),
                ),
              ],
            ),
            const Gap(8),
            Text(
              'Follow these steps to connect your thermal printer.',
              style: GoogleFonts.inter(color: Colors.white38, fontSize: 14),
            ),
            const Gap(32),
            Expanded(
              child: ListView(
                children: [
                  _helpItem(
                    'Bluetooth Pairing',
                    'Go to your device settings and pair the printer via Bluetooth. Default PIN is usually 0000 or 1234.',
                    HugeIcons.strokeRoundedBluetooth,
                  ),
                  _helpItem(
                    'Internal USB (POS)',
                    'On POS terminals with built-in printers, ensure the paper is loaded and the printer door is latched.',
                    HugeIcons.strokeRoundedSettings01,
                  ),
                  _helpItem(
                    'Selection',
                    'Return to this screen and select your device from the corresponding tab (Bluetooth or USB).',
                    HugeIcons.strokeRoundedCursor01,
                  ),
                  _helpItem(
                    'Verification',
                    'Always perform a "Test Print" to ensure the thermal head is working and aligned correctly.',
                    HugeIcons.strokeRoundedCheckmarkBadge01,
                  ),
                ],
              ),
            ),
            const Gap(16),
            SizedBox(
              width: double.infinity,
              height: 56,
              child: FilledButton(
                onPressed: () => Navigator.pop(context),
                style: FilledButton.styleFrom(
                  backgroundColor: AppTheme.cPrimary,
                  foregroundColor: AppTheme.cBlackMain,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                ),
                child: Text(
                  'Understood',
                  style: GoogleFonts.inter(fontWeight: FontWeight.w900, fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _helpItem(String title, String desc, dynamic icon) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.03),
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: Colors.white.withValues(alpha: 0.05)),
            ),
            child: HugeIcon(icon: icon, color: AppTheme.cPrimary, size: 22),
          ),
          const Gap(16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.outfit(fontSize: 16, fontWeight: FontWeight.w700, color: Colors.white),
                ),
                const Gap(4),
                Text(
                  desc,
                  style: GoogleFonts.inter(fontSize: 13, color: Colors.white38, height: 1.5),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFABs(BuildContext context, PrinterProvider provider) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        if (provider.isConnected || provider.isUsbPrinter)
          FloatingActionButton.extended(
            heroTag: "test_print",
            onPressed: () async {
              final success = await provider.printTestTicket();
              if (!context.mounted) return;
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(success ? "Test ticket printed!" : "Print failed"),
                  backgroundColor: success ? Colors.green : Colors.red,
                  behavior: SnackBarBehavior.floating,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  margin: const EdgeInsets.all(20),
                ),
              );
            },
            icon: const HugeIcon(icon: HugeIcons.strokeRoundedCheckmarkBadge01, color: AppTheme.cBlackMain, size: 20),
            label: Text("Test Print", style: GoogleFonts.inter(color: AppTheme.cBlackMain, fontWeight: FontWeight.w900)),
            backgroundColor: AppTheme.cPrimary,
          )
        else
          FloatingActionButton(
            heroTag: "scan",
            onPressed: () {
              if (_tabController.index == 0) {
                provider.scanDevices();
              } else {
                provider.scanUsbDevices();
              }
            },
            backgroundColor: AppTheme.cPrimary,
            child: provider.isLoading
                ? const SizedBox(width: 24, height: 24, child: CircularProgressIndicator(strokeWidth: 2, color: AppTheme.cBlackMain))
                : const HugeIcon(icon: HugeIcons.strokeRoundedSearch01, color: AppTheme.cBlackMain, size: 24),
          ),
      ],
    );
  }
}
