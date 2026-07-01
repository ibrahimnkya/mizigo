import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:image/image.dart' as img;
import 'package:intl/intl.dart';
import 'package:print_bluetooth_thermal/print_bluetooth_thermal.dart';
import 'package:esc_pos_utils_plus/esc_pos_utils_plus.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String _kLastPrinterMacKey = 'citi_last_printer_mac';
const String _kLastPrinterNameKey = 'citi_last_printer_name';
const String _kPrinterHistoryListKey = 'citi_printer_history_list';

class PrintHistoryItem {
  final String title;
  final DateTime time;
  final bool success;

  PrintHistoryItem({
    required this.title,
    required this.time,
    required this.success,
  });

  Map<String, dynamic> toJson() => {
        'title': title,
        'time': time.toIso8601String(),
        'success': success,
      };

  factory PrintHistoryItem.fromJson(Map<String, dynamic> json) => PrintHistoryItem(
        title: json['title'] as String,
        time: DateTime.parse(json['time'] as String),
        success: json['success'] as bool,
      );
}

class PrinterProvider extends ChangeNotifier {
  List<BluetoothInfo> _devices = [];
  bool _isConnected = false;
  bool _isConnecting = false;
  bool _isLoading = false;
  String? _lastPrinterMac;
  String? _lastPrinterName;
  List<PrintHistoryItem> _history = [];
  final List<String> _logs = [];
  Timer? _timer;

  List<BluetoothInfo> get devices => _devices;
  bool get isConnected => _isConnected;
  bool get isConnecting => _isConnecting;
  bool get isLoading => _isLoading;
  String? get lastPrinterMac => _lastPrinterMac;
  String? get lastPrinterName => _lastPrinterName;
  List<PrintHistoryItem> get history => List.unmodifiable(_history);
  List<String> get logs => List.unmodifiable(_logs);

  PrinterProvider() {
    _addLog("Printer Service Initialized");
    _init();
  }

  void _addLog(String msg) {
    final now = DateTime.now();
    final timeStr = "${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}:${now.second.toString().padLeft(2, '0')}";
    _logs.insert(0, "[$timeStr] $msg");
    if (_logs.length > 50) _logs.removeLast();
    notifyListeners();
  }

  Future<void> _init() async {
    final prefs = await SharedPreferences.getInstance();
    _lastPrinterMac = prefs.getString(_kLastPrinterMacKey);
    _lastPrinterName = prefs.getString(_kLastPrinterNameKey);
    
    await _loadPrintHistory();
    _startPolling();
  }

  void _startPolling() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) async {
      try {
        final connected = await PrintBluetoothThermal.connectionStatus;
        if (_isConnected != connected) {
          _isConnected = connected;
          _isConnecting = false;
          _addLog("Polling connection: ${_isConnected ? 'Connected' : 'Disconnected'}");
          notifyListeners();
        }
      } catch (e) {
        if (_isConnected) {
          _isConnected = false;
          _isConnecting = false;
          notifyListeners();
        }
      }
    });
  }

  Future<void> _loadPrintHistory() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final historyStrList = prefs.getStringList(_kPrinterHistoryListKey) ?? [];
      _history = historyStrList.map((item) {
        final Map<String, dynamic> json = jsonDecode(item) as Map<String, dynamic>;
        return PrintHistoryItem.fromJson(json);
      }).toList();
      notifyListeners();
    } catch (e) {
      _addLog("Error loading history: $e");
    }
  }

  void addHistory(String title, bool success) {
    final newItem = PrintHistoryItem(title: title, time: DateTime.now(), success: success);
    _history.insert(0, newItem);
    if (_history.length > 50) {
      _history.removeLast();
    }
    _saveHistory();
    notifyListeners();
  }

  Future<void> _saveHistory() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final historyStrList = _history.map((item) => jsonEncode(item.toJson())).toList();
      await prefs.setStringList(_kPrinterHistoryListKey, historyStrList);
    } catch (e) {
      _addLog("Error saving history: $e");
    }
  }

  Future<void> clearHistory() async {
    _history.clear();
    notifyListeners();
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove(_kPrinterHistoryListKey);
      _addLog("Print history cleared");
    } catch (e) {
      _addLog("Error clearing history: $e");
    }
  }

  void setConnecting(bool connecting) {
    _isConnecting = connecting;
    notifyListeners();
  }

  Future<void> saveLastPrinter(String mac, String name) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_kLastPrinterMacKey, mac);
    await prefs.setString(_kLastPrinterNameKey, name);
    _lastPrinterMac = mac;
    _lastPrinterName = name;
    notifyListeners();
  }

  Future<void> scanDevices() async {
    _isLoading = true;
    _addLog("Scanning for Bluetooth devices...");
    notifyListeners();

    try {
      if (defaultTargetPlatform == TargetPlatform.android) {
        await [
          Permission.bluetooth,
          Permission.bluetoothScan,
          Permission.bluetoothConnect,
          Permission.location,
        ].request();
      }

      final List<BluetoothInfo> pairedDevices = await PrintBluetoothThermal.pairedBluetooths;
      _devices = pairedDevices;
      _addLog("Scan complete. Found ${_devices.length} devices.");
    } catch (e) {
      _addLog("Scan error: $e");
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<bool> connect(BluetoothInfo device) async {
    setConnecting(true);
    _addLog("Connecting to ${device.name} (${device.macAdress})...");

    try {
      final bool result = await PrintBluetoothThermal.connect(macPrinterAddress: device.macAdress);
      setConnecting(false);

      if (result) {
        _isConnected = true;
        _lastPrinterMac = device.macAdress;
        _lastPrinterName = device.name.isNotEmpty ? device.name : 'Unknown Printer';
        await saveLastPrinter(_lastPrinterMac!, _lastPrinterName!);
        _addLog("Successfully connected to $_lastPrinterName");
      } else {
        _addLog("Failed to connect to ${device.name}");
      }
      return result;
    } catch (e) {
      setConnecting(false);
      _addLog("Connection exception: $e");
      return false;
    }
  }

  Future<void> disconnect() async {
    try {
      await PrintBluetoothThermal.disconnect;
    } catch (e) {
      _addLog("Physical disconnect error: $e");
    }
    _isConnected = false;
    _addLog("Printer disconnected");
    notifyListeners();
  }

  Future<bool> _printBytes(List<int> bytes, {required String title}) async {
    _addLog("Generating print payload for: $title...");
    
    final printerName = _lastPrinterName ?? "Unknown Device";
    
    if (!_isConnected) {
      _addLog("Print aborted: No printer connected");
      addHistory(title, false);
      return false;
    }

    try {
      final success = await PrintBluetoothThermal.writeBytes(bytes);

      if (success) {
        _addLog("Print job completed successfully on $printerName");
        addHistory(title, true);
      } else {
        _addLog("Print job failed or timed out on $printerName");
        addHistory(title, false);
      }
      return success;
    } catch (e) {
      _addLog("Printing error: $e");
      addHistory(title, false);
      return false;
    }
  }

  Future<bool> printTestTicket() async {
    try {
      final profile = await CapabilityProfile.load();
      final generator = Generator(PaperSize.mm58, profile);
      List<int> bytes = [];

      bytes += generator.reset();

      // Load and print the logo if available
      try {
        final ByteData data = await rootBundle.load('assets/images/logo_white.png');
        final Uint8List imageBytes = data.buffer.asUint8List();
        final image = img.decodeImage(imageBytes);
        if (image != null) {
          final resizedImage = img.copyResize(image, width: 300);
          bytes += generator.image(resizedImage);
        }
      } catch (e) {
        _addLog("Failed to load logo asset: $e");
      }

      bytes += generator.feed(1);
      bytes += generator.text('MIZIGO TEST TICKET', 
        styles: const PosStyles(align: PosAlign.center, bold: true, height: PosTextSize.size2, width: PosTextSize.size1));
      bytes += generator.text('Thermal Printer Active', styles: const PosStyles(align: PosAlign.center));
      bytes += generator.feed(1);
      bytes += generator.text('Date: ${DateTime.now().toString().split('.')[0]}', styles: const PosStyles(align: PosAlign.center));
      bytes += generator.hr();
      bytes += generator.text('Connection: OK', styles: const PosStyles(align: PosAlign.center, bold: true));
      bytes += generator.feed(1);
      
      bytes += generator.text('Barcode Test:', styles: const PosStyles(align: PosAlign.center));
      bytes += generator.barcode(Barcode.code128(utf8.encode('MIZIGO123')));
      bytes += generator.feed(1);
      
      bytes += generator.text('QR Code Test:', styles: const PosStyles(align: PosAlign.center));
      bytes += generator.qrcode('https://mizigo.app', size: QRSize.size4);
      bytes += generator.feed(1);
      bytes += generator.cut();

      return await _printBytes(bytes, title: "Test Ticket Page");
    } catch (e) {
      _addLog("Error preparing test ticket: $e");
      return false;
    }
  }

  Future<bool> printReceipt(Map<String, dynamic> packageData) async {
    final String trackingId = packageData['trackingId']?.toString() ?? packageData['id']?.toString() ?? "MZG-${DateTime.now().millisecond}-TZ";
    final String description = packageData['description']?.toString() ?? "Standard Cargo";
    final String senderName = packageData['senderName']?.toString() ?? "N/A";
    final String receiverName = packageData['receiverName']?.toString() ?? "N/A";
    final String origin = packageData['origin']?.toString() ?? "N/A";
    final String destination = packageData['destination']?.toString() ?? "N/A";
    final double price = double.tryParse(packageData['price']?.toString() ?? '') ?? 15000.0;
    final int qty = int.tryParse(packageData['quantity']?.toString() ?? '') ?? 1;

    final formattedPrice = NumberFormat('#,###').format(price);

    try {
      final profile = await CapabilityProfile.load();
      final generator = Generator(PaperSize.mm58, profile);
      List<int> bytes = [];

      bytes += generator.reset();
      bytes += generator.feed(1);
      bytes += generator.text('MIZIGO LOGISTICS', 
        styles: const PosStyles(align: PosAlign.center, bold: true, height: PosTextSize.size2, width: PosTextSize.size1));
      bytes += generator.text('Reliable Cargo Tracking', styles: const PosStyles(align: PosAlign.center));
      bytes += generator.feed(1);
      bytes += generator.text('PARCEL RECEIPT', styles: const PosStyles(align: PosAlign.center, bold: true));
      bytes += generator.hr();
      
      bytes += generator.row([
        PosColumn(text: 'Track ID:', width: 4),
        PosColumn(text: trackingId, width: 8, styles: const PosStyles(align: PosAlign.right, bold: true)),
      ]);
      bytes += generator.row([
        PosColumn(text: 'From:', width: 4),
        PosColumn(text: origin, width: 8, styles: const PosStyles(align: PosAlign.right)),
      ]);
      bytes += generator.row([
        PosColumn(text: 'To:', width: 4),
        PosColumn(text: destination, width: 8, styles: const PosStyles(align: PosAlign.right)),
      ]);
      bytes += generator.hr();

      bytes += generator.row([
        PosColumn(text: 'Sender:', width: 4),
        PosColumn(text: senderName, width: 8, styles: const PosStyles(align: PosAlign.right)),
      ]);
      bytes += generator.row([
        PosColumn(text: 'Receiver:', width: 4),
        PosColumn(text: receiverName, width: 8, styles: const PosStyles(align: PosAlign.right)),
      ]);
      bytes += generator.hr();

      bytes += generator.row([
        PosColumn(text: 'Item', width: 6),
        PosColumn(text: 'Qty', width: 2, styles: const PosStyles(align: PosAlign.center)),
        PosColumn(text: 'Total', width: 4, styles: const PosStyles(align: PosAlign.right)),
      ]);
      bytes += generator.row([
        PosColumn(text: description, width: 6),
        PosColumn(text: qty.toString(), width: 2, styles: const PosStyles(align: PosAlign.center)),
        PosColumn(text: formattedPrice, width: 4, styles: const PosStyles(align: PosAlign.right)),
      ]);
      bytes += generator.feed(1);
      bytes += generator.text('Grand Total: TSh $formattedPrice', styles: const PosStyles(align: PosAlign.right, bold: true));
      bytes += generator.feed(1);
      
      bytes += generator.text('Tracking Barcode:', styles: const PosStyles(align: PosAlign.center));
      bytes += generator.barcode(Barcode.code128(utf8.encode(trackingId)));
      bytes += generator.feed(1);

      bytes += generator.qrcode('https://mizigo.app/track/$trackingId', size: QRSize.size4);
      bytes += generator.feed(1);
      bytes += generator.cut();

      return await _printBytes(bytes, title: "Receipt: $trackingId");
    } catch (e) {
      _addLog("Error preparing receipt print: $e");
      return false;
    }
  }

  Future<bool> printLabel(Map<String, dynamic> packageData) async {
    final String trackingId = packageData['trackingId']?.toString() ?? packageData['id']?.toString() ?? "MZG-${DateTime.now().millisecond}-TZ";
    final String destination = packageData['destination']?.toString() ?? "N/A";
    final String senderName = packageData['senderName']?.toString() ?? "N/A";

    try {
      final profile = await CapabilityProfile.load();
      final generator = Generator(PaperSize.mm58, profile);
      List<int> bytes = [];

      bytes += generator.reset();
      bytes += generator.feed(1);
      bytes += generator.text('MIZIGO LABEL', styles: const PosStyles(align: PosAlign.center, bold: true));
      bytes += generator.hr();
      bytes += generator.text('DESTINATION:', styles: const PosStyles(align: PosAlign.center, bold: true));
      bytes += generator.text(destination.toUpperCase(), styles: const PosStyles(align: PosAlign.center, bold: true, height: PosTextSize.size2, width: PosTextSize.size1));
      bytes += generator.feed(1);
      bytes += generator.text('ID: $trackingId', styles: const PosStyles(align: PosAlign.center, bold: true));
      bytes += generator.text('Sender: $senderName', styles: const PosStyles(align: PosAlign.center));
      bytes += generator.feed(1);
      
      bytes += generator.barcode(Barcode.code128(utf8.encode(trackingId)));
      bytes += generator.feed(1);

      bytes += generator.qrcode('https://mizigo.app/track/$trackingId', size: QRSize.size4);
      bytes += generator.feed(1);
      bytes += generator.cut();

      return await _printBytes(bytes, title: "Label: $trackingId");
    } catch (e) {
      _addLog("Error preparing label print: $e");
      return false;
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
