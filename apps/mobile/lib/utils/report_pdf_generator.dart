import 'dart:typed_data';
import 'package:flutter/services.dart' show rootBundle;
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:intl/intl.dart';

class ReportPdfGenerator {
  static Future<Uint8List> generate({
    required String type,
    required String period,
    required List<dynamic> parcels,
    required String stationName,
  }) async {
    final pdf = pw.Document();

    // Try loading logo
    pw.MemoryImage? logoImage;
    try {
      final ByteData logoData = await rootBundle.load('assets/images/logo_dark.png');
      logoImage = pw.MemoryImage(logoData.buffer.asUint8List());
    } catch (_) {}

    final formattedDate = DateFormat('d MMM yyyy, HH:mm').format(DateTime.now());

    // Calculate totals
    final int totalCount = parcels.length;
    double totalRevenue = 0.0;
    for (var p in parcels) {
      final amt = p['price'] ?? p['amount'] ?? 0.0;
      totalRevenue += (amt as num).toDouble();
    }

    final formattedRevenue = NumberFormat('#,###').format(totalRevenue);
    
    // Add page
    pdf.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        margin: const pw.EdgeInsets.all(36),
        build: (pw.Context context) {
          return [
            // HEADER
            pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              crossAxisAlignment: pw.CrossAxisAlignment.center,
              children: [
                if (logoImage != null)
                  pw.Image(logoImage, width: 130, height: 45)
                else
                  pw.Text(
                    'MIZIGO',
                    style: pw.TextStyle(
                      fontSize: 28,
                      fontWeight: pw.FontWeight.bold,
                      color: PdfColors.indigo700,
                    ),
                  ),
                pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.end,
                  children: [
                    pw.Text(
                      'OPERATIONAL REPORT',
                      style: pw.TextStyle(
                        fontSize: 20,
                        fontWeight: pw.FontWeight.bold,
                        color: PdfColors.indigo900,
                      ),
                    ),
                    pw.SizedBox(height: 4),
                    pw.Text('Station: $stationName', style: pw.TextStyle(fontSize: 10, fontWeight: pw.FontWeight.bold, color: PdfColors.indigo700)),
                    pw.Text('Date Generated: $formattedDate', style: const pw.TextStyle(fontSize: 10, color: PdfColors.grey700)),
                  ],
                ),
              ],
            ),
            pw.SizedBox(height: 15),
            pw.Divider(thickness: 2, color: PdfColors.indigo700),
            pw.SizedBox(height: 15),

            // SUMMARY CARDS
            pw.Row(
              children: [
                pw.Expanded(
                  child: pw.Container(
                    padding: const pw.EdgeInsets.all(12),
                    decoration: pw.BoxDecoration(
                      color: PdfColors.grey100,
                      borderRadius: const pw.BorderRadius.all(pw.Radius.circular(8)),
                    ),
                    child: pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Text('REPORT TYPE', style: pw.TextStyle(fontSize: 8, color: PdfColors.grey700)),
                        pw.SizedBox(height: 4),
                        pw.Text(type.toUpperCase(), style: pw.TextStyle(fontSize: 12, fontWeight: pw.FontWeight.bold, color: PdfColors.indigo900)),
                      ],
                    ),
                  ),
                ),
                pw.SizedBox(width: 12),
                pw.Expanded(
                  child: pw.Container(
                    padding: const pw.EdgeInsets.all(12),
                    decoration: pw.BoxDecoration(
                      color: PdfColors.grey100,
                      borderRadius: const pw.BorderRadius.all(pw.Radius.circular(8)),
                    ),
                    child: pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Text('TIMEFRAME', style: pw.TextStyle(fontSize: 8, color: PdfColors.grey700)),
                        pw.SizedBox(height: 4),
                        pw.Text(period.toUpperCase(), style: pw.TextStyle(fontSize: 12, fontWeight: pw.FontWeight.bold, color: PdfColors.indigo900)),
                      ],
                    ),
                  ),
                ),
                pw.SizedBox(width: 12),
                pw.Expanded(
                  child: pw.Container(
                    padding: const pw.EdgeInsets.all(12),
                    decoration: pw.BoxDecoration(
                      color: PdfColors.grey100,
                      borderRadius: const pw.BorderRadius.all(pw.Radius.circular(8)),
                    ),
                    child: pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Text('TOTAL PARCELS', style: pw.TextStyle(fontSize: 8, color: PdfColors.grey700)),
                        pw.SizedBox(height: 4),
                        pw.Text(totalCount.toString(), style: pw.TextStyle(fontSize: 12, fontWeight: pw.FontWeight.bold, color: PdfColors.indigo900)),
                      ],
                    ),
                  ),
                ),
                pw.SizedBox(width: 12),
                pw.Expanded(
                  child: pw.Container(
                    padding: const pw.EdgeInsets.all(12),
                    decoration: pw.BoxDecoration(
                      color: PdfColors.grey100,
                      borderRadius: const pw.BorderRadius.all(pw.Radius.circular(8)),
                    ),
                    child: pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Text('TOTAL REVENUE', style: pw.TextStyle(fontSize: 8, color: PdfColors.grey700)),
                        pw.SizedBox(height: 4),
                        pw.Text('TZS $formattedRevenue', style: pw.TextStyle(fontSize: 12, fontWeight: pw.FontWeight.bold, color: PdfColors.green700)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            pw.SizedBox(height: 20),

            // TABLE OF PARCELS
            pw.Text(
              'PARCEL ACTIVITY RECORD',
              style: pw.TextStyle(
                fontSize: 12,
                fontWeight: pw.FontWeight.bold,
                color: PdfColors.indigo900,
              ),
            ),
            pw.SizedBox(height: 6),
            pw.Table(
              border: const pw.TableBorder(
                bottom: pw.BorderSide(color: PdfColors.grey300, width: 1),
                horizontalInside: pw.BorderSide(color: PdfColors.grey200, width: 0.5),
              ),
              columnWidths: const {
                0: pw.FlexColumnWidth(1.2), // Date
                1: pw.FlexColumnWidth(2),   // Tracking ID
                2: pw.FlexColumnWidth(2),   // Route
                3: pw.FlexColumnWidth(2),   // Receiver
                4: pw.FlexColumnWidth(1.2), // Status
                5: pw.FlexColumnWidth(1.2), // Price
              },
              children: [
                // Header row
                pw.TableRow(
                  decoration: const pw.BoxDecoration(color: PdfColors.grey200),
                  children: [
                    _cell('Date', isHeader: true),
                    _cell('Tracking Number', isHeader: true),
                    _cell('Route', isHeader: true),
                    _cell('Receiver', isHeader: true),
                    _cell('Status', isHeader: true),
                    _cell('Price', isHeader: true, alignRight: true),
                  ],
                ),
                // Data rows
                for (var p in parcels)
                  pw.TableRow(
                    children: [
                      _cell(_formatDate(p['createdAt'])),
                      _cell(p['trackingNumber'] ?? p['id'] ?? 'N/A'),
                      _cell(_formatRoute(p)),
                      _cell(p['receiver']?['name'] ?? p['receiverName'] ?? 'N/A'),
                      _cell(p['status'] ?? 'N/A'),
                      _cell('TZS ${NumberFormat('#,###').format(p['price'] ?? p['amount'] ?? 0)}', alignRight: true),
                    ],
                  ),
              ],
            ),
          ];
        },
      ),
    );

    return pdf.save();
  }

  static String _formatDate(dynamic dtStr) {
    if (dtStr == null) return '';
    try {
      final dt = DateTime.parse(dtStr.toString());
      return DateFormat('d MMM yy').format(dt);
    } catch (_) {
      return dtStr.toString();
    }
  }

  static String _formatRoute(dynamic p) {
    String from = '';
    String to = '';
    if (p['origin'] != null && p['origin']['code'] != null) {
      from = p['origin']['code'];
    } else if (p['route'] != null && p['route']['receivingStation'] != null) {
      from = p['route']['receivingStation'];
    } else {
      from = p['fromAddress'] ?? '';
    }

    if (p['destination'] != null && p['destination']['code'] != null) {
      to = p['destination']['code'];
    } else if (p['route'] != null && p['route']['destinationStation'] != null) {
      to = p['route']['destinationStation'];
    } else {
      to = p['toAddress'] ?? '';
    }

    if (from.length > 10) from = from.substring(0, 10);
    if (to.length > 10) to = to.substring(0, 10);

    return '$from - $to';
  }

  static pw.Widget _cell(String text, {bool isHeader = false, bool alignRight = false}) {
    return pw.Padding(
      padding: const pw.EdgeInsets.symmetric(horizontal: 4, vertical: 6),
      child: pw.Text(
        text,
        textAlign: alignRight ? pw.TextAlign.right : pw.TextAlign.left,
        style: pw.TextStyle(
          fontSize: 8,
          fontWeight: isHeader ? pw.FontWeight.bold : pw.FontWeight.normal,
          color: isHeader ? PdfColors.indigo900 : PdfColors.grey900,
        ),
      ),
    );
  }
}
