import 'dart:io';
import 'dart:ui' show ImageFilter;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qr_code_scanner_plus/qr_code_scanner_plus.dart';
import 'package:go_router/go_router.dart';

import '../../providers/scanner_provider.dart';
import '../../models/operation_model.dart';
import '../../widgets/staff/parcel_number_field.dart';
import '../../widgets/staff/staff_settings.dart';

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

  // Extract the raw tracking ID / parcel ID from whatever the QR contains.
  // Receipts encode "https://mizigo.app/track/<id>" — we only need the last segment.
  String _extractId(String raw) {
    final trimmed = raw.trim();
    final uri = Uri.tryParse(trimmed);
    if (uri != null && (uri.scheme == 'http' || uri.scheme == 'https') && uri.pathSegments.isNotEmpty) {
      return uri.pathSegments.last;
    }
    return trimmed;
  }

  Future<void> _processCode(String code) async {
    // Pause camera while processing to prevent duplicate scans
    await controller?.pauseCamera();

    if (!mounted) return;

    final id = _extractId(code);

    if (widget.operation == ParcelOperation.view) {
      final success = await context.read<ScannerProvider>().processCode(id);
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
      // For Dispatch, Offload, Deliver: return the extracted ID to the calling screen
      context.pop(id);
    }
  }

  void _submitManual() {
    final value = _manualEntryController.text.trim();
    if (value.isEmpty) return;
    FocusScope.of(context).unfocus();
    _processCode(value);
  }

  @override
  Widget build(BuildContext context) {
    final scannerProvider = context.watch<ScannerProvider>();
    final topInset = MediaQuery.of(context).padding.top;
    final cutOut = MediaQuery.of(context).size.width * 0.68;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        backgroundColor: Colors.black,
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            // Camera with an orange scan frame.
            Positioned.fill(
              child: QRView(
                key: qrKey,
                onQRViewCreated: _onQRViewCreated,
                overlay: QrScannerOverlayShape(
                  borderColor: kStaffAccent,
                  overlayColor: Colors.black.withValues(alpha: 0.6),
                  borderRadius: 24,
                  borderLength: 36,
                  borderWidth: 6,
                  cutOutSize: cutOut,
                ),
              ),
            ),

            // Top bar: back, title, flash, flip.
            Positioned(
              top: topInset + 8,
              left: 12,
              right: 12,
              child: Row(
                children: [
                  _GlassIconButton(
                    icon: HugeIcons.strokeRoundedArrowLeft02,
                    tooltip: 'Back',
                    onTap: () => context.pop(),
                  ),
                  Expanded(
                    child: Text(
                      widget.operation.displayLabel,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.outfit(fontSize: 22, fontWeight: FontWeight.w700, color: Colors.white),
                    ),
                  ),
                  _GlassIconButton(
                    icon: _isFlashOn ? HugeIcons.strokeRoundedFlashOff : HugeIcons.strokeRoundedFlash,
                    tooltip: _isFlashOn ? 'Flash off' : 'Flash on',
                    active: _isFlashOn,
                    onTap: () async {
                      await controller?.toggleFlash();
                      setState(() => _isFlashOn = !_isFlashOn);
                    },
                  ),
                  const Gap(8),
                  _GlassIconButton(
                    icon: HugeIcons.strokeRoundedCameraRotated01,
                    tooltip: 'Switch camera',
                    onTap: () async => controller?.flipCamera(),
                  ),
                ],
              ),
            ),

            // Hint above the frame.
            Positioned(
              left: 0,
              right: 0,
              top: topInset + 76,
              child: Center(
                child: _Glass(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const HugeIcon(icon: HugeIcons.strokeRoundedQrCode, color: kStaffAccent, size: 20),
                      const Gap(10),
                      Text(
                        'Place the parcel QR code inside the frame',
                        style: GoogleFonts.outfit(fontSize: 14, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // Manual entry, lifted above the keyboard.
            Positioned(
              left: 16,
              right: 16,
              bottom: MediaQuery.of(context).viewInsets.bottom + MediaQuery.of(context).padding.bottom + 24,
              child: _Glass(
                padding: const EdgeInsets.all(14),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'No code? Enter the parcel number',
                      style: GoogleFonts.outfit(fontSize: 14, color: Colors.white.withValues(alpha: 0.75)),
                    ),
                    const Gap(10),
                    Row(
                      children: [
                        Expanded(
                          child: ParcelNumberField(
                            controller: _manualEntryController,
                            onDark: true,
                            onSubmitted: (_) => _submitManual(),
                          ),
                        ),
                        const Gap(8),
                        Material(
                          color: kStaffAccent,
                          borderRadius: BorderRadius.circular(12),
                          child: InkWell(
                            onTap: _submitManual,
                            borderRadius: BorderRadius.circular(12),
                            child: const SizedBox(
                              width: 48,
                              height: 48,
                              child: Center(
                                child: HugeIcon(icon: HugeIcons.strokeRoundedArrowRight02, color: Colors.white, size: 24),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            if (scannerProvider.loading)
              Positioned.fill(
                child: ColoredBox(
                  color: Colors.black.withValues(alpha: 0.6),
                  child: Center(
                    child: _Glass(
                      padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 22),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const SizedBox(
                            width: 28,
                            height: 28,
                            child: CircularProgressIndicator(strokeWidth: 2.5, color: kStaffAccent),
                          ),
                          const Gap(14),
                          Text('Finding parcel…', style: GoogleFonts.outfit(fontSize: 16, color: Colors.white)),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

/// Frosted dark panel used over the camera.
class _Glass extends StatelessWidget {
  const _Glass({required this.child, this.padding = EdgeInsets.zero});

  final Widget child;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 14, sigmaY: 14),
        child: Container(
          padding: padding,
          decoration: BoxDecoration(
            color: Colors.black.withValues(alpha: 0.45),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.white.withValues(alpha: 0.15)),
          ),
          child: child,
        ),
      ),
    );
  }
}

class _GlassIconButton extends StatelessWidget {
  const _GlassIconButton({required this.icon, required this.tooltip, required this.onTap, this.active = false});

  final List<List<dynamic>> icon;
  final String tooltip;
  final VoidCallback onTap;
  final bool active;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: tooltip,
      child: GestureDetector(
        onTap: onTap,
        child: ClipOval(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
            child: Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: active ? kStaffAccent : Colors.black.withValues(alpha: 0.45),
                border: Border.all(color: Colors.white.withValues(alpha: 0.15)),
              ),
              child: Center(child: HugeIcon(icon: icon, color: Colors.white, size: 22)),
            ),
          ),
        ),
      ),
    );
  }
}
