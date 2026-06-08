import 'package:flutter/services.dart';
import 'package:image/image.dart' as img;
import 'package:esc_pos_utils_plus/esc_pos_utils_plus.dart';

class ThermalPrinterService {
  /// Generates ESC/POS command bytes for a standard delivery manifest.
  Future<List<int>> generateDeliveryManifest({
    required String trackingId,
    required String senderName,
    required String receiverName,
    required String receiverPhone,
    required String origin,
    required String destination,
    required int quantity,
    required double price,
    required bool isPaid,
  }) async {
    final profile = await CapabilityProfile.load();
    final generator = Generator(PaperSize.mm58, profile);
    List<int> bytes = [];

    bytes += generator.reset();

    // Logo
    try {
      final ByteData data = await rootBundle.load(
        'assets/images/logo_dark.png',
      );
      final Uint8List imageBytes = data.buffer.asUint8List();
      final image = img.decodeImage(imageBytes);
      if (image != null) {
        // Resize image to fit 58mm printer (usually ~384 dots)
        final resizedImage = img.copyResize(image, width: 300);
        bytes += generator.image(resizedImage);
      }
    } catch (e) {
      // Fallback: Continue without logo if not found
    }

    bytes += generator.feed(1);
    bytes += generator.text(
      'MIZIGO LOGISTICS',
      styles: const PosStyles(
        align: PosAlign.center,
        bold: true,
        height: PosTextSize.size2,
        width: PosTextSize.size2,
      ),
    );
    bytes += generator.text(
      'Reliable Parcel Tracking',
      styles: const PosStyles(align: PosAlign.center),
    );
    bytes += generator.feed(1);

    bytes += generator.text(
      'DELIVERY MANIFEST',
      styles: const PosStyles(align: PosAlign.center, bold: true),
    );
    bytes += generator.hr();

    bytes += generator.row([
      PosColumn(text: 'Tracking:', width: 4),
      PosColumn(
        text: trackingId,
        width: 8,
        styles: const PosStyles(bold: true, align: PosAlign.right),
      ),
    ]);

    bytes += generator.row([
      PosColumn(text: 'From:', width: 4),
      PosColumn(
        text: origin,
        width: 8,
        styles: const PosStyles(align: PosAlign.right),
      ),
    ]);
    bytes += generator.row([
      PosColumn(text: 'To:', width: 4),
      PosColumn(
        text: destination,
        width: 8,
        styles: const PosStyles(align: PosAlign.right),
      ),
    ]);
    bytes += generator.hr();

    bytes += generator.row([
      PosColumn(text: 'Sender:', width: 4),
      PosColumn(
        text: senderName,
        width: 8,
        styles: const PosStyles(align: PosAlign.right),
      ),
    ]);
    bytes += generator.row([
      PosColumn(text: 'Receiver:', width: 4),
      PosColumn(
        text: receiverName,
        width: 8,
        styles: const PosStyles(align: PosAlign.right),
      ),
    ]);
    bytes += generator.row([
      PosColumn(text: 'Contact:', width: 4),
      PosColumn(
        text: receiverPhone,
        width: 8,
        styles: const PosStyles(align: PosAlign.right),
      ),
    ]);

    bytes += generator.hr();
    bytes += generator.row([
      PosColumn(text: 'Item', width: 6),
      PosColumn(
        text: 'Qty',
        width: 2,
        styles: const PosStyles(align: PosAlign.center),
      ),
      PosColumn(
        text: 'Price',
        width: 4,
        styles: const PosStyles(align: PosAlign.right),
      ),
    ]);

    bytes += generator.row([
      PosColumn(text: 'Package', width: 6),
      PosColumn(
        text: quantity.toString(),
        width: 2,
        styles: const PosStyles(align: PosAlign.center),
      ),
      PosColumn(
        text: price.toStringAsFixed(0),
        width: 4,
        styles: const PosStyles(align: PosAlign.right),
      ),
    ]);

    bytes += generator.feed(1);
    bytes += generator.text(
      'Total: TSh ${price.toStringAsFixed(0)}',
      styles: const PosStyles(align: PosAlign.right, bold: true),
    );
    bytes += generator.text(
      'Payment: ${isPaid ? "PAID" : "PENDING"}',
      styles: const PosStyles(align: PosAlign.right, bold: true),
    );
    bytes += generator.feed(1);

    // QR Code
    bytes += generator.qrcode(
      'https://mizigo.app/track/$trackingId',
      size: QRSize.size4,
    );
    bytes += generator.feed(1);

    bytes += generator.text(
      'Thank you for using Mizigo!',
      styles: const PosStyles(align: PosAlign.center),
    );
    bytes += generator.feed(2);
    bytes += generator.cut();

    return bytes;
  }

  /// Generates a simple test ticket to verify printer connection and alignment.
  Future<List<int>> generateTestTicket() async {
    final profile = await CapabilityProfile.load();
    final generator = Generator(PaperSize.mm58, profile);
    List<int> bytes = [];

    bytes += generator.reset();
    bytes += generator.setGlobalCodeTable('CP1252');
    bytes += generator.feed(1);
    bytes += generator.text(
      'MIZIGO TEST',
      styles: const PosStyles(
        align: PosAlign.center,
        height: PosTextSize.size2,
        width: PosTextSize.size2,
        bold: true,
      ),
    );
    bytes += generator.text(
      'Thermal Printer Test',
      styles: const PosStyles(align: PosAlign.center),
    );
    bytes += generator.feed(1);
    bytes += generator.text(
      'Date: ${DateTime.now().toString().split('.')[0]}',
      styles: const PosStyles(align: PosAlign.center),
    );
    bytes += generator.hr();
    bytes += generator.text(
      'Connection: ACTIVE',
      styles: const PosStyles(align: PosAlign.center, bold: true),
    );
    bytes += generator.feed(2);
    bytes += generator.cut();

    return bytes;
  }
}
