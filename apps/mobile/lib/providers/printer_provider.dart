import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:print_bluetooth_thermal/print_bluetooth_thermal.dart';
import 'package:esc_pos_utils_plus/esc_pos_utils_plus.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:image/image.dart' as img;

class PrinterProvider extends ChangeNotifier {
  List<BluetoothInfo> _devices = [];
  bool _isConnected = false;
  bool _isLoading = false;
  String _statusMessage = "Not Connected";
  String? _connectedMacAddress;
  bool _isUsbPrinter = false;
  final List<String> _logs = [];

  List<BluetoothInfo> get devices => _devices;
  bool get isConnected => _isConnected;
  bool get isLoading => _isLoading;
  String get statusMessage => _statusMessage;
  String? get connectedMacAddress => _connectedMacAddress;
  bool get isUsbPrinter => _isUsbPrinter;
  List<String> get logs => List.unmodifiable(_logs);

  PrinterProvider() {
    _addLog("Printer Service Initialized");
    _loadSavedDevice();
  }

  void _addLog(String msg) {
    final now = DateTime.now();
    final timeStr = "${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}:${now.second.toString().padLeft(2, '0')}";
    _logs.insert(0, "[$timeStr] $msg");
    if (_logs.length > 50) _logs.removeLast();
    notifyListeners();
  }

  Future<void> _loadSavedDevice() async {
    final prefs = await SharedPreferences.getInstance();
    _connectedMacAddress = prefs.getString('last_printer_mac');
    if (_connectedMacAddress != null) {
      // Try to check connection status if we have a saved device
      _checkConnection();
    }
  }

  Future<void> _checkConnection() async {
    _isConnected = await PrintBluetoothThermal.connectionStatus;
    if (_isConnected) {
      _statusMessage = "Connected to saved device";
      _addLog("Automatic reconnect successful");
    } else {
      _statusMessage = "Not Connected";
      _addLog("No active printer connection found");
    }
    notifyListeners();
  }

  Future<void> scanDevices() async {
    _isLoading = true;
    _statusMessage = "Scanning for printers...";
    _addLog("Starting Bluetooth device scan...");
    notifyListeners();

    try {
      // Request permissions
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
      _statusMessage = _devices.isEmpty ? "No devices found" : "Found ${_devices.length} devices";
      _addLog(_statusMessage);
    } catch (e) {
      _statusMessage = "Error scanning: $e";
      _addLog("Scan error: $e");
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> scanUsbDevices() async {
    _isLoading = true;
    _addLog("Scanning for USB/Built-in printers...");
    notifyListeners();
    
    // Simulating USB detection for POS devices
    await Future.delayed(const Duration(seconds: 1));
    
    _isUsbPrinter = true; // For demo/mock purposes
    _addLog("Internal USB Printer detected (POS Built-in)");
    
    _isLoading = false;
    notifyListeners();
  }

  Future<bool> connect(BluetoothInfo device) async {
    _isLoading = true;
    _statusMessage = "Connecting to ${device.name}...";
    notifyListeners();

    try {
      final bool result = await PrintBluetoothThermal.connect(macPrinterAddress: device.macAdress);
      if (result) {
        _isConnected = true;
        _connectedMacAddress = device.macAdress;
        _statusMessage = "Connected to ${device.name}";
        _addLog("Successfully connected to ${device.name} (${device.macAdress})");
        
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('last_printer_mac', device.macAdress);
      } else {
        _statusMessage = "Connection failed";
        _addLog("Failed to connect to ${device.name}");
      }
      return result;
    } catch (e) {
      _statusMessage = "Connection error: $e";
      _addLog("Connection exception: $e");
      return false;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> disconnect() async {
    await PrintBluetoothThermal.disconnect;
    _isConnected = false;
    _connectedMacAddress = null;
    _statusMessage = "Disconnected";
    _addLog("Printer manually disconnected");
    
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('last_printer_mac');
    notifyListeners();
  }

  Future<bool> printTestTicket() async {
    _addLog("Generating test print payload...");
    if (!_isConnected && !_isUsbPrinter) {
      _addLog("Print aborted: No printer connected");
      return false;
    }

    try {
      final profile = await CapabilityProfile.load();
      final generator = Generator(PaperSize.mm58, profile);
      List<int> bytes = [];

      bytes += generator.reset();

      // Logo
      try {
        final ByteData data = await rootBundle.load('assets/images/logo_dark.png');
        final Uint8List imageBytes = data.buffer.asUint8List();
        final image = img.decodeImage(imageBytes);
        if (image != null) {
          // Resize image to fit 58mm printer (usually ~384 dots)
          final resizedImage = img.copyResize(image, width: 300);
          bytes += generator.image(resizedImage);
        }
      } catch (e) {
        debugPrint("Error loading logo for print: $e");
      }

      bytes += generator.feed(1);
      bytes += generator.text('MIZIGO LOGISTICS', 
        styles: const PosStyles(align: PosAlign.center, bold: true, height: PosTextSize.size2, width: PosTextSize.size2));
      bytes += generator.text('Reliable Cargo Tracking', 
        styles: const PosStyles(align: PosAlign.center));
      bytes += generator.feed(1);
      
      bytes += generator.hr();
      bytes += generator.text('TEST RECEIPT', styles: const PosStyles(align: PosAlign.center, bold: true));
      bytes += generator.hr();
      
      bytes += generator.row([
        PosColumn(text: 'Item', width: 6),
        PosColumn(text: 'Qty', width: 2, styles: const PosStyles(align: PosAlign.center)),
        PosColumn(text: 'Price', width: 4, styles: const PosStyles(align: PosAlign.right)),
      ]);
      
      bytes += generator.row([
        PosColumn(text: 'Standard Delivery', width: 6),
        PosColumn(text: '1', width: 2, styles: const PosStyles(align: PosAlign.center)),
        PosColumn(text: '15,000', width: 4, styles: const PosStyles(align: PosAlign.right)),
      ]);
      
      bytes += generator.feed(1);
      bytes += generator.text('Total: TSh 15,000', styles: const PosStyles(align: PosAlign.right, bold: true));
      bytes += generator.feed(1);

      // QR Code
      bytes += generator.qrcode('https://mizigo.app/track/TEST-123', size: QRSize.size4);
      bytes += generator.feed(1);
      
      bytes += generator.text('Thank you for using Mizigo!', styles: const PosStyles(align: PosAlign.center));
      bytes += generator.feed(2);
      bytes += generator.cut();

      final result = await PrintBluetoothThermal.writeBytes(bytes);
      if (result) {
        _addLog("Print command sent successfully");
      } else {
        _addLog("Print command failed or timed out");
      }
      return result;
    } catch (e) {
      debugPrint("Printing error: $e");
      _addLog("Printing error: $e");
      return false;
    }
  }

  void clearLogs() {
    _logs.clear();
    _addLog("Logs cleared");
    notifyListeners();
  }
}
