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

    if (widget.operation == ParcelOperation.view) {
      final success = await context.read<ScannerProvider>().processCode(code);
      if (mounted) {
        if (success) {
          final parcel = context.read<ScannerProvider>().scannedParcel;
          if (parcel != null) {
            context.pushReplacement('/operator/scanned-details', extra: parcel);
          }
        } else {
          context.pushReplacement('/scanner/message', extra: {'success': false});
        }
      }
    } else {
      // For Dispatch, Offload, Deliver: Just return the code to the calling screen
      context.pop(code);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scannerProvider = context.watch<ScannerProvider>();

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: theme.appBarTheme.backgroundColor ?? theme.primaryColor,
        elevation: 0,
        scrolledUnderElevation: 0,
        surfaceTintColor: Colors.transparent,
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: HugeIcon(
            icon: HugeIcons.strokeRoundedArrowLeft01,
            color: theme.appBarTheme.iconTheme?.color ?? Colors.white,
          ),
        ),
        title: Text(
          widget.operation.displayLabel,
          style: GoogleFonts.outfit(
            fontSize: 28,
            fontWeight: FontWeight.w600,
            color: theme.appBarTheme.titleTextStyle?.color ?? Colors.white,
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
              color: theme.appBarTheme.iconTheme?.color ?? Colors.white,
            ),
          ),
          IconButton(
            onPressed: () async {
              await controller?.flipCamera();
            },
            icon: HugeIcon(
              icon: HugeIcons.strokeRoundedCamera01,
              color: theme.appBarTheme.iconTheme?.color ?? Colors.white,
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
                borderColor: theme.colorScheme.primary,
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
                    hintText: 'enter Parcel number',
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
                      borderSide: BorderSide(
                        color: theme.colorScheme.primary,
                        width: 2,
                      ),
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
                      icon: HugeIcon(
                        icon: HugeIcons.strokeRoundedSearch01,
                        color: theme.colorScheme.primary,
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
