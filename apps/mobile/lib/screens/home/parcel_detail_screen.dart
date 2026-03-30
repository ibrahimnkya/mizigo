import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gap/gap.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'track_screen.dart';
import 'live_track_screen.dart';
import '../../widgets/home/premium_ui_components.dart';

class ParcelDetailScreen extends StatelessWidget {
  final ShipmentData shipment;
  const ParcelDetailScreen({super.key, required this.shipment});



  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final s = shipment;

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
                  // Parcel icon
                  const ParcelIcon(),
                  const Gap(12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(children: [
                          Flexible(
                            child: Text(
                              'Parcel ',
                              style: GoogleFonts.outfit(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: theme.textTheme.headlineSmall?.color,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ]),
                        Text(
                          s.trackingId,
                          style: GoogleFonts.inter(
                            fontSize: 13,
                            color: theme.textTheme.bodyMedium?.color?.withValues(alpha: 0.6),
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  // Close button — X
                  GestureDetector(
                    onTap: () => Navigator.of(context).pop(),
                    child: Container(
                      width: 38,
                      height: 38,
                      decoration: BoxDecoration(
                        color: theme.cardTheme.color,
                        shape: BoxShape.circle,
                        border:
                            Border.all(color: theme.dividerColor, width: 1.5),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: theme.brightness == Brightness.dark ? 0.2 : 0.04),
                            blurRadius: 8,
                          ),
                        ],
                      ),
                      child: Center(
                        child: HugeIcon(
                          icon: HugeIcons.strokeRoundedCancel01,
                          size: 18,
                          color: theme.iconTheme.color?.withValues(alpha: 0.7),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const Gap(20),

            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // ── Details card ───────────────────────────
                    Container(
                      padding: const EdgeInsets.fromLTRB(20, 16, 20, 20),
                      decoration: BoxDecoration(
                        color: theme.cardTheme.color,
                        borderRadius: BorderRadius.circular(22),
                        boxShadow: [
                          BoxShadow(
                            color:
                                theme.primaryColor.withValues(alpha: 0.07),
                            blurRadius: 24,
                            offset: const Offset(0, 6),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          _DetailRow('From', s.from),
                          _DetailRow('To', s.to),
                          _DetailRow('Service', s.service),
                          _DetailRow('Size', s.size),
                          _DetailRow('Weight', s.weight),
                          _DetailRow('Insurance', s.insurance),
                          _DetailRow('Receiver Name', s.receiverName),
                          const Gap(12),
                          // Dashed divider
                          const DashedDivider(),
                          const Gap(16),
                          // Action buttons
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              _ActionBtn(
                                icon: HugeIcons.strokeRoundedShare01,
                                onTap: () => _generateAndSharePdf(context, s),
                              ),
                              const Gap(16),
                              _ActionBtn(
                                icon: HugeIcons.strokeRoundedSpeedTrain02,
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (_) =>
                                          LiveTrackScreen(shipment: s),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    const Gap(28),

                    // ── Timeline ───────────────────────────────
                    _TimelineItem(
                      label: 'Booked',
                      date: '23 Nov · 11:48 AM',
                      isDone: true,
                      isActive: false,
                    ),
                    _TimelineItem(
                      label: 'Picked up',
                      date: '23 Nov · 11:48 AM',
                      isDone: true,
                      isActive: false,
                    ),
                    _TimelineItem(
                      label: 'In Transit',
                      date: '23 Nov · 11:48 AM',
                      isDone: false,
                      isActive: true,
                      driver: const _DriverChip(
                        name: 'Milton Juma',
                        rating: 4.5,
                      ),
                    ),
                    _TimelineItem(
                      label: 'Delivered',
                      date: 'Pending',
                      isDone: false,
                      isActive: false,
                      isLast: true,
                    ),

                    const Gap(32),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _generateAndSharePdf(BuildContext context, ShipmentData s) async {
    final pdf = pw.Document();

    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Header(
                level: 0,
                child: pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Text('Mizigo Parcel Details',
                        style: pw.TextStyle(
                            fontSize: 24, fontWeight: pw.FontWeight.bold)),
                    pw.Text('#${s.trackingId}',
                        style: const pw.TextStyle(fontSize: 16)),
                  ],
                ),
              ),
              pw.SizedBox(height: 20),
              pw.Text('Shipment Information',
                  style: pw.TextStyle(
                      fontSize: 18, fontWeight: pw.FontWeight.bold)),
              pw.Divider(),
              _pdfRow('From:', s.from),
              _pdfRow('To:', s.to),
              _pdfRow('Service:', s.service),
              pw.SizedBox(height: 10),
              pw.Text('Package Details',
                  style: pw.TextStyle(
                      fontSize: 16, fontWeight: pw.FontWeight.bold)),
              _pdfRow('Size:', s.size),
              _pdfRow('Weight:', s.weight),
              _pdfRow('Insurance:', s.insurance),
              pw.SizedBox(height: 10),
              pw.Text('Receiver Information',
                  style: pw.TextStyle(
                      fontSize: 16, fontWeight: pw.FontWeight.bold)),
              _pdfRow('Name:', s.receiverName),
              pw.SizedBox(height: 20),
              pw.Text('Status: ${s.statusLabel}',
                  style: pw.TextStyle(
                      fontSize: 14, fontWeight: pw.FontWeight.bold)),
              pw.SizedBox(height: 40),
              pw.Center(
                child: pw.Text('Thank you for choosing Mizigo!',
                    style: const pw.TextStyle(fontSize: 12, color: PdfColors.grey)),
              ),
            ],
          );
        },
      ),
    );

    await Printing.sharePdf(
      bytes: await pdf.save(),
      filename: 'mizigo_parcel_${s.trackingId}.pdf',
    );
  }

  pw.Widget _pdfRow(String label, String value) {
    return pw.Padding(
      padding: const pw.EdgeInsets.symmetric(vertical: 4),
      child: pw.Row(
        children: [
          pw.SizedBox(width: 120, child: pw.Text(label, style: pw.TextStyle(fontWeight: pw.FontWeight.bold))),
          pw.Text(value),
        ],
      ),
    );
  }
}


// ─── Action Button ────────────────────────────────────────────────────────────

class _ActionBtn extends StatelessWidget {
  final dynamic icon;
  final VoidCallback onTap;
  const _ActionBtn({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 52,
        height: 52,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: theme.dividerColor, width: 1.5),
          color: theme.cardTheme.color,
        ),
        child: Center(
          child: HugeIcon(icon: icon, size: 22, color: theme.iconTheme.color?.withValues(alpha: 0.7)),
        ),
      ),
    );
  }
}

// ─── Timeline Item ────────────────────────────────────────────────────────────

class _TimelineItem extends StatelessWidget {
  final String label;
  final String date;
  final bool isDone;
  final bool isActive;
  final bool isLast;
  final Widget? driver;

  const _TimelineItem({
    required this.label,
    required this.date,
    required this.isDone,
    required this.isActive,
    this.isLast = false,
    this.driver,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── Dot + connector line ──────────────────────────
          SizedBox(
            width: 44,
            child: Column(
              children: [
                // Dot
                Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isActive
                        ? theme.primaryColor
                        : isDone
                            ? theme.primaryColor.withValues(alpha: 0.4)
                            : theme.dividerColor,
                    border: isActive
                        ? Border.all(
                            color: theme.primaryColor.withValues(alpha: 0.2), width: 3)
                        : null,
                  ),
                  child: Center(
                    child: isActive
                        ? const SizedBox.shrink()
                        : isDone
                            ? const Icon(Icons.check_rounded,
                                size: 16, color: Colors.white)
                            : null,
                  ),
                ),
                // Connector line
                if (!isLast)
                  Expanded(
                    child: Container(
                      width: 2,
                      margin: const EdgeInsets.symmetric(vertical: 4),
                      decoration: BoxDecoration(
                        color: isDone
                            ? theme.primaryColor.withValues(alpha: 0.3)
                            : theme.dividerColor,
                        borderRadius: BorderRadius.circular(1),
                      ),
                    ),
                  ),
              ],
            ),
          ),

          const Gap(12),

          // ── Label + date + optional driver ────────────────
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
                                ? theme.primaryColor
                                : theme.textTheme.titleMedium?.color,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const Gap(8),
                      Text(
                        date,
                        style: GoogleFonts.inter(
                          fontSize: 12,
                          color: const Color(0xFF94A3B8),
                        ),
                      ),
                    ],
                  ),
                  if (driver != null) ...[const Gap(10), driver!],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ─── Driver Chip ──────────────────────────────────────────────────────────────

class _DriverChip extends StatelessWidget {
  final String name;
  final double rating;
  const _DriverChip({required this.name, required this.rating});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: theme.cardTheme.color,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: theme.dividerColor),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: theme.brightness == Brightness.dark ? 0.2 : 0.03),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          // Driver avatar placeholder
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: const Color(0xFFCBD5E1),
              border: Border.all(color: Colors.white, width: 2),
            ),
            child: const Center(
              child: HugeIcon(
                icon: HugeIcons.strokeRoundedUser,
                color: Color(0xFF64748B),
                size: 20,
              ),
            ),
          ),
          const Gap(10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  name,
                  style: GoogleFonts.inter(
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    color: theme.textTheme.titleSmall?.color,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                Row(children: [
                  Flexible(
                    child: Text(
                      'Driver · ',
                      style: GoogleFonts.inter(
                        fontSize: 11,
                        color: const Color(0xFF64748B),
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const Icon(Icons.star_rounded,
                      size: 12, color: Color(0xFFFBBF24)),
                  Text(
                    ' $rating',
                    style: GoogleFonts.inter(
                      fontSize: 11,
                      color: const Color(0xFF64748B),
                    ),
                  ),
                ]),
              ],
            ),
          ),
          const Spacer(),
          // Call button
          GestureDetector(
            onTap: () {},
            child: Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: theme.dividerColor),
                color: theme.cardTheme.color,
              ),
              child: Center(
                child: HugeIcon(
                  icon: HugeIcons.strokeRoundedCall02,
                  size: 16,
                  color: theme.iconTheme.color?.withValues(alpha: 0.7),
                ),
              ),
            ),
          ),
          const Gap(8),
          // Chat button
          GestureDetector(
            onTap: () {},
            child: Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: theme.dividerColor),
                color: theme.cardTheme.color,
              ),
              child: Center(
                child: HugeIcon(
                  icon: HugeIcons.strokeRoundedChatting01,
                  size: 16,
                  color: theme.iconTheme.color?.withValues(alpha: 0.7),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ─── Detail Row Widget ────────────────────────────────────────────────────────
 
class _DetailRow extends StatelessWidget {
  final String label;
  final String value;
  const _DetailRow(this.label, this.value);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 110,
            child: Text(label,
                style: GoogleFonts.inter(
                    fontSize: 13, color: const Color(0xFF94A3B8))),
          ),
          Expanded(
            child: Text(
              value,
              textAlign: TextAlign.right,
              style: GoogleFonts.inter(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: theme.textTheme.bodyLarge?.color,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
