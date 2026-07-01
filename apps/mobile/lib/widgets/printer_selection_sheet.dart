import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:print_bluetooth_thermal/print_bluetooth_thermal.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:gap/gap.dart';
import '../providers/printer_provider.dart';
import '../theme/app_theme.dart';

class PrinterSelectionSheet extends StatefulWidget {
  final Function(BluetoothInfo device)? onDeviceSelected;
  const PrinterSelectionSheet({super.key, this.onDeviceSelected});

  static void show(BuildContext context, {Function(BluetoothInfo device)? onDeviceSelected}) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => PrinterSelectionSheet(onDeviceSelected: onDeviceSelected),
    );
  }

  @override
  State<PrinterSelectionSheet> createState() => _PrinterSelectionSheetState();
}

class _PrinterSelectionSheetState extends State<PrinterSelectionSheet> {
  String? _connectingMac;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<PrinterProvider>().scanDevices();
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<PrinterProvider>();

    return Container(
      height: MediaQuery.of(context).size.height * 0.7,
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
        children: [
          const Gap(12),
          Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: AppTheme.border,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          _buildHeader(provider),
          if (provider.isLoading && provider.devices.isEmpty)
            Expanded(
              child: Center(
                child: CircularProgressIndicator(color: AppTheme.cPrimary),
              ),
            )
          else if (provider.devices.isEmpty)
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(32),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        color: AppTheme.background,
                        shape: BoxShape.circle,
                        border: Border.all(color: AppTheme.border),
                      ),
                      child: HugeIcon(
                        icon: HugeIcons.strokeRoundedBluetooth,
                        color: AppTheme.textSecondary.withValues(alpha: 0.3),
                        size: 48,
                      ),
                    ),
                    const Gap(24),
                    Text(
                      "No Bluetooth Devices Found",
                      style: GoogleFonts.outfit(color: AppTheme.textPrimary, fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const Gap(8),
                    Text(
                      "Ensure Bluetooth is enabled and the thermal printer is paired in system settings.",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.inter(color: AppTheme.textSecondary, fontSize: 14, height: 1.5),
                    ),
                    const Gap(24),
                    ElevatedButton.icon(
                      onPressed: () => provider.scanDevices(),
                      icon: const HugeIcon(icon: HugeIcons.strokeRoundedSearch01, color: Colors.white, size: 16),
                      label: Text("Scan Devices", style: GoogleFonts.inter(fontWeight: FontWeight.bold, color: Colors.white)),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppTheme.cPrimary,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                      ),
                    ),
                  ],
                ),
              ),
            )
          else
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.fromLTRB(20, 8, 20, 40),
                itemCount: provider.devices.length,
                separatorBuilder: (context, index) => const SizedBox(height: 12),
                itemBuilder: (context, index) {
                  final device = provider.devices[index];
                  final isConnected = device.macAdress == provider.lastPrinterMac;
                  final isConnecting = _connectingMac == device.macAdress;
                  return _buildDeviceCard(device, isConnected, isConnecting, provider);
                },
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildHeader(PrinterProvider provider) {
    return Container(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Select Printer',
                style: GoogleFonts.outfit(
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                  color: AppTheme.textPrimary,
                ),
              ),
              IconButton(
                onPressed: provider.isLoading ? null : () => provider.scanDevices(),
                icon: HugeIcon(
                  icon: HugeIcons.strokeRoundedRefresh,
                  color: provider.isLoading ? AppTheme.textMuted : AppTheme.cPrimary,
                  size: 20,
                ),
                style: IconButton.styleFrom(
                  backgroundColor: AppTheme.background,
                  padding: const EdgeInsets.all(12),
                ),
              ),
            ],
          ),
          const Gap(8),
          Text(
            'Select a connected Bluetooth device to begin printing.',
            style: GoogleFonts.inter(
              color: AppTheme.textSecondary,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDeviceCard(
    BluetoothInfo device,
    bool isConnected,
    bool isConnecting,
    PrinterProvider provider,
  ) {
    final statusColor = isConnected ? Colors.green : AppTheme.textSecondary;

    return InkWell(
      onTap: isConnecting
          ? null
          : () async {
              if (!isConnected) {
                setState(() {
                  _connectingMac = device.macAdress;
                });
                final success = await provider.connect(device);
                if (mounted) {
                  setState(() {
                    _connectingMac = null;
                  });
                  if (success) {
                    if (widget.onDeviceSelected != null) {
                      widget.onDeviceSelected!(device);
                    }
                    Navigator.pop(context);
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
              } else {
                if (widget.onDeviceSelected != null) {
                  widget.onDeviceSelected!(device);
                }
                Navigator.pop(context);
              }
            },
      borderRadius: BorderRadius.circular(18),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppTheme.background,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: isConnected 
                ? Colors.green.withValues(alpha: 0.35) 
                : AppTheme.border,
            width: isConnected ? 1.5 : 1,
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
                    device.name.isNotEmpty ? device.name : 'Unknown Device',
                    style: GoogleFonts.outfit(
                      color: AppTheme.textPrimary,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const Gap(4),
                  Text(
                    device.macAdress,
                    style: GoogleFonts.inter(
                      color: AppTheme.textSecondary,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            if (isConnecting)
              SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(strokeWidth: 2, color: AppTheme.cPrimary),
              )
            else if (isConnected)
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: Colors.green.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.green.withValues(alpha: 0.2)),
                ),
                child: Text(
                  'ACTIVE',
                  style: GoogleFonts.inter(
                    color: Colors.green,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            else
              HugeIcon(icon: HugeIcons.strokeRoundedArrowRight01, color: AppTheme.textSecondary, size: 20),
          ],
        ),
      ),
    );
  }
}
