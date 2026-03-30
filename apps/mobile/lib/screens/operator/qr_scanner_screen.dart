import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qr_code_scanner_plus/qr_code_scanner_plus.dart';
import 'package:go_router/go_router.dart';

import '../../providers/scanner_provider.dart';
import '../../models/operation_model.dart';
import '../../widgets/common/neo_container.dart';
import '../../widgets/common/wheel_rotate.dart';

class QrCodeScannerScreen extends StatefulWidget {
  final ParcelOperation operation;
  const QrCodeScannerScreen({super.key, required this.operation});

  @override
  State<QrCodeScannerScreen> createState() => _QrCodeScannerScreenState();
}

class _QrCodeScannerScreenState extends State<QrCodeScannerScreen> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  final TextEditingController _manualEntryController = TextEditingController();
  bool _isFlashOn = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ScannerProvider>().setOperation(widget.operation);
    });
  }

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller?.pauseCamera();
    }
    controller?.resumeCamera();
  }

  @override
  void dispose() {
    // controller?.dispose(); // No longer necessary
    _manualEntryController.dispose();
    super.dispose();
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      if (scanData.code != null) {
        _processCode(scanData.code!);
      }
    });
  }

  Future<void> _processCode(String code) async {
    // Pause camera while processing to prevent duplicate scans
    await controller?.pauseCamera();
    
    if (!mounted) return;
    final success = await context.read<ScannerProvider>().processCode(code);
    
    if (mounted) {
      if (success) {
        if (widget.operation == ParcelOperation.view) {
           final cargo = context.read<ScannerProvider>().scannedCargo;
           if (cargo != null) {
              context.pushReplacement('/operator/scanned-details', extra: cargo);
           }
        } else {
           context.pushReplacement('/scanner/message', extra: {'success': true});
        }
      } else {
        context.pushReplacement('/scanner/message', extra: {'success': false});
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final scannerProvider = context.watch<ScannerProvider>();
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: const Color(0xFF0F172A), // Match Home Screen / MainScaffold background
        elevation: 0,
        scrolledUnderElevation: 0,
        surfaceTintColor: Colors.transparent,
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: HugeIcon(
            icon: HugeIcons.strokeRoundedArrowLeft01,
            color: isDark ? Colors.white : Colors.black,
          ),
        ),
        title: Text(
          widget.operation.displayLabel,
          style: GoogleFonts.outfit(
            fontSize: 28,
            fontWeight: FontWeight.w600,
            color: isDark ? Colors.white : Colors.black,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () async {
              await controller?.toggleFlash();
              setState(() {
                _isFlashOn = !_isFlashOn;
              });
            },
            icon: HugeIcon(
              icon: _isFlashOn ? HugeIcons.strokeRoundedFlashOff : HugeIcons.strokeRoundedFlash,
              color: isDark ? Colors.white : Colors.black,
            ),
          ),
          IconButton(
            onPressed: () async {
              await controller?.flipCamera();
            },
            icon: HugeIcon(
              icon: HugeIcons.strokeRoundedCamera01,
              color: isDark ? Colors.white : Colors.black,
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          // QR Scanner View
          Positioned.fill(
            child: QRView(
              key: qrKey,
              onQRViewCreated: _onQRViewCreated,
              overlay: QrScannerOverlayShape(
                borderColor: const Color(0xFF3B82F6),
                borderRadius: 20,
                borderLength: 30,
                borderWidth: 10,
                cutOutSize: MediaQuery.of(context).size.width * 0.7,
              ),
            ),
          ),

          // Content Overlays
          Positioned(
            left: 20,
            right: 20,
            top: 40,
            child: Column(
              children: [
                NeoContainer(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  child: Row(
                    children: [
                      const HugeIcon(
                        icon: HugeIcons.strokeRoundedQrCode,
                        color: Colors.white,
                        size: 24,
                      ),
                      const Gap(12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Scan QR Code',
                              style: GoogleFonts.outfit(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              'Position the code inside the frame to scan',
                              style: GoogleFonts.inter(
                                fontSize: 12,
                                color: Colors.white70,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Bottom Search Bar for Manual Entry
          Positioned(
            left: 20,
            right: 20,
            bottom: 40,
            child: Column(
              children: [
                Text(
                  'OR ENTER MANUALLY',
                  style: GoogleFonts.outfit(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                    color: Colors.white.withValues(alpha: 0.8),
                  ),
                ),
                const Gap(16),
                TextField(
                  controller: _manualEntryController,
                  style: GoogleFonts.inter(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                  decoration: InputDecoration(
                    hintText: 'Enter Tracking ID',
                    hintStyle: GoogleFonts.inter(
                      color: const Color(0xFF64748B),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide.none,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: Colors.white.withValues(alpha: 0.05),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                    suffixIcon: IconButton(
                      onPressed: () {
                        if (_manualEntryController.text.isNotEmpty) {
                          _processCode(_manualEntryController.text);
                        }
                      },
                      icon: const HugeIcon(
                        icon: HugeIcons.strokeRoundedSearch01,
                        color: Color(0xFF3B82F6),
                      ),
                    ),
                  ),
                  onSubmitted: (value) {
                    if (value.isNotEmpty) {
                      _processCode(value);
                    }
                  },
                ),
              ],
            ),
          ),

          // Loading Overlay
          if (scannerProvider.loading)
            Container(
              color: Colors.black.withValues(alpha: 0.7),
              child: const Center(
                child: WheelRotate(),
              ),
            ),
        ],
      ),
    );
  }
}
