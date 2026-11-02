import 'dart:math' as math;
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
import '../services/api_service.dart';

const String _kLastPrinterMacKey = 'citi_last_printer_mac';
const String _kLastPrinterNameKey = 'citi_last_printer_name';
const String _kPrinterHistoryListKey = 'citi_printer_history_list';

class PrintHistoryItem {
  final String title;
  final DateTime time;
  final bool success;

  PrintHistoryItem({required this.title, required this.time, required this.success});

  Map<String, dynamic> toJson() => {'title': title, 'time': time.toIso8601String(), 'success': success};

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
    final timeStr =
        "${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}:${now.second.toString().padLeft(2, '0')}";
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

  Future<PaperSize> _getPaperSize() async {
    try {
      final config = await ApiService.getPrintConfig();
      final size = config['paperSize'] as String? ?? 'thermal80';
      return size == 'thermal58' ? PaperSize.mm58 : PaperSize.mm80;
    } catch (_) {
      return PaperSize.mm80;
    }
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

  Future<bool> connectToLastPrinter() async {
    if (_lastPrinterMac == null || _lastPrinterMac!.isEmpty) return false;
    _addLog("Auto-connecting to last printer: $_lastPrinterName...");
    setConnecting(true);
    try {
      final bool result = await PrintBluetoothThermal.connect(macPrinterAddress: _lastPrinterMac!);
      setConnecting(false);
      if (result) {
        _isConnected = true;
        _addLog("Auto-connected successfully to $_lastPrinterName");
      } else {
        _addLog("Auto-connection failed to $_lastPrinterName");
      }
      notifyListeners();
      return result;
    } catch (e) {
      setConnecting(false);
      _addLog("Auto-connect exception: $e");
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
      final generator = Generator(await _getPaperSize(), profile);
      List<int> bytes = [];

      bytes += generator.reset();

      final logo = await _receiptLogo(await _getPaperSize());
      if (logo != null) bytes += generator.image(logo, align: PosAlign.center);

      bytes += generator.feed(1);
      bytes += generator.text(
        'MIZIGO TEST TICKET',
        styles: const PosStyles(
          align: PosAlign.center,
          bold: true,
          height: PosTextSize.size2,
          width: PosTextSize.size1,
        ),
      );
      bytes += generator.text('Thermal Printer Active', styles: const PosStyles(align: PosAlign.center));
      bytes += generator.feed(1);
      bytes += generator.text(
        'Date: ${DateTime.now().toString().split('.')[0]}',
        styles: const PosStyles(align: PosAlign.center),
      );
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

  /// Receipt logo: the MiziGO icon in its round badge beside the wordmark,
  /// as a black-on-white bitmap (~300 dots wide, fits 58 and 80 mm paper).
  Future<img.Image?> _receiptLogo(PaperSize paper) async {
    try {
      final iconSrc = img.decodeImage((await rootBundle.load('assets/images/logo_icon.png')).buffer.asUint8List());
      final textSrc = img.decodeImage((await rootBundle.load('assets/images/logo_text_dark.png')).buffer.asUint8List());
      if (iconSrc == null || textSrc == null) return null;

      const width = 300;
      final h = (width / (1 + 0.22 + 0.62 * textSrc.width / textSrc.height)).round();
      final th = (h * 0.62).round();
      final gap = (h * 0.22).round();
      final icon = img.copyResize(iconSrc, width: h, height: h, interpolation: img.Interpolation.average);
      final text = img.copyResize(textSrc, height: th, interpolation: img.Interpolation.average);

      final out = img.Image(width: h + gap + text.width, height: h);
      img.fill(out, color: img.ColorRgb8(255, 255, 255));
      final c = (h - 1) / 2;
      for (final p in icon) {
        final d = math.sqrt((p.x - c) * (p.x - c) + (p.y - c) * (p.y - c)) / h;
        // Badge ring drawn as a clean circle; inside it, the dark glyph.
        final ring = d >= 0.455 && d <= 0.5;
        final glyph = d < 0.43 && p.a > 110 && p.luminanceNormalized < 0.8;
        if (ring || glyph) out.setPixelRgb(p.x, p.y, 0, 0, 0);
      }
      final oy = (h - th) ~/ 2;
      for (final p in text) {
        if (p.a > 110) out.setPixelRgb(h + gap + p.x, oy + p.y, 0, 0, 0);
      }
      return out;
    } catch (e) {
      _addLog("Failed to load receipt logo: $e");
      return null;
    }
  }

  Future<bool> printReceipt(Map<String, dynamic> packageData) async {
    final d = _TicketData(packageData);
    try {
      final paper = await _getPaperSize();
      final generator = Generator(paper, await CapabilityProfile.load());
      final t = _Ticket();
      List<int> bytes = generator.reset();

      // ── Brand ──
      bytes += await _logoBytes(generator, paper, t);
      bytes += t.line('RISITI YA MZIGO', align: 1, bold: true);
      bytes += t.line(DateFormat('dd MMM yyyy, HH:mm').format(DateTime.now()), align: 1);
      bytes += t.rule();

      // ── Parcel number & route (centred) ──
      bytes += t.line(d.trackingId, align: 1, bold: true, tall: true);
      if (d.route.isNotEmpty) bytes += t.line(d.route, align: 1);
      if (d.express) bytes += t.line('*** EXPRESS ***', align: 1, bold: true);
      bytes += t.rule();

      // ── Details (left aligned) ──
      bytes += t.detail('Mtumaji:', d.senderName);
      bytes += t.detail('Simu:', d.senderPhone);
      bytes += t.detail('Mpokeaji:', d.receiverName, bold: true);
      bytes += t.detail('Simu:', d.receiverPhone);
      bytes += t.detail('Mzigo:', d.item);
      bytes += t.detail('Uzito:', d.weight);

      // ── Extra services ──
      if (d.services.isNotEmpty) {
        bytes += t.rule();
        bytes += t.line('HUDUMA ZA ZIADA', bold: true);
        for (final (name, price) in d.services) {
          bytes += t.amount('+ $name', price);
        }
      }

      // ── Payment ──
      bytes += t.rule();
      if (d.payment.isNotEmpty) bytes += t.detail('Malipo:', d.payment);
      if (d.price != null) bytes += t.amount('JUMLA', d.price!, bold: true, tall: true);
      bytes += t.rule();

      // ── QR at the bottom ──
      bytes += generator.qrcode(d.trackUrl, size: paper == PaperSize.mm58 ? QRSize.size4 : QRSize.size5);
      bytes += t.line('Scan kufuatilia mzigo wako', align: 1);
      bytes += t.line('Asante kwa kutumia MiziGO!', align: 1, bold: true);
      bytes += t.cut();

      return await _printBytes(bytes, title: "Receipt: ${d.trackingId}");
    } catch (e) {
      _addLog("Error preparing receipt print: $e");
      return false;
    }
  }

  /// Parcel sticker: where it's going, who it's for, handling flags and a
  /// QR to scan at every step.
  Future<bool> printLabel(Map<String, dynamic> packageData) async {
    final d = _TicketData(packageData);
    try {
      final paper = await _getPaperSize();
      final generator = Generator(paper, await CapabilityProfile.load());
      final t = _Ticket();
      List<int> bytes = generator.reset();

      // ── Brand ──
      bytes += await _logoBytes(generator, paper, t);
      bytes += t.rule();

      // ── Destination, as big as the printer allows ──
      bytes += t.line('KWENDA', align: 1);
      bytes += t.line(
        (d.destination.isEmpty ? '-' : d.destination).toUpperCase(),
        align: 1,
        bold: true,
        tall: true,
        wide: true,
      );
      if (d.origin.isNotEmpty) bytes += t.line('Kutoka: ${d.origin}', align: 1);
      bytes += t.rule();

      // ── Parcel number ──
      bytes += t.line(d.trackingId, align: 1, bold: true, tall: true);
      bytes += t.rule();

      // ── Receiver & contents (left aligned) ──
      bytes += t.detail('Mpokeaji:', d.receiverName, bold: true);
      bytes += t.detail('Simu:', d.receiverPhone);
      bytes += t.detail('Mtumaji:', d.senderName);
      bytes += t.detail('Mzigo:', d.item);
      bytes += t.detail('Uzito:', d.weight);

      // ── Handling flags ──
      final flags = [
        if (d.express) 'EXPRESS',
        if (d.fragile) 'MZIGO DHAIFU - SHIKA KWA UANGALIFU',
        if (d.insured) 'MZIGO UMEKATIWA BIMA',
      ];
      if (flags.isNotEmpty) {
        bytes += t.rule();
        for (final f in flags) {
          bytes += t.line('** $f **', align: 1, bold: true);
        }
      }
      bytes += t.rule();

      // ── QR ──
      bytes += generator.qrcode(d.trackUrl, size: paper == PaperSize.mm58 ? QRSize.size5 : QRSize.size6);
      bytes += t.line(DateFormat('dd/MM/yyyy HH:mm').format(DateTime.now()), align: 1);
      bytes += t.cut();

      return await _printBytes(bytes, title: "Label: ${d.trackingId}");
    } catch (e) {
      _addLog("Error preparing label print: $e");
      return false;
    }
  }

  Future<List<int>> _logoBytes(Generator generator, PaperSize paper, _Ticket t) async {
    final logo = await _receiptLogo(paper);
    return logo != null
        ? generator.image(logo, align: PosAlign.center)
        : t.line('MiziGO', align: 1, bold: true, tall: true);
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}

/// Fields a receipt or sticker needs, read from whatever map the caller has
/// (the receive flow's payload or a parcel from the server).
class _TicketData {
  _TicketData(Map<String, dynamic> m) : _m = m {
    final meta = m['additionalServices'];
    final ids = meta is List ? meta : (meta is Map && meta['services'] is List ? meta['services'] as List : const []);
    serviceIds = ids.map((e) => e.toString().toLowerCase()).toSet();
  }

  final Map<String, dynamic> _m;
  late final Set<String> serviceIds;

  /// Extra services and their counter prices (same as the receive flow).
  static const _serviceInfo = {
    'insurance': ('Bima ya mzigo', 3000.0),
    'packaging': ('Ufungashaji salama', 2000.0),
    'fragile': ('Uangalizi maalum', 2500.0),
  };

  String field(List<String> keys) {
    for (final k in keys) {
      final v = _m[k]?.toString().trim() ?? '';
      if (v.isNotEmpty && v != 'null' && v != 'N/A') return v;
    }
    return '';
  }

  static String _city(String a) => a.split(',').first.trim();

  String get trackingId => field(['trackingId', 'trackingNumber', 'id']);
  String get trackUrl => 'https://mizigo.akiliapp.co.tz/track/$trackingId';
  String get senderName => field(['senderName']);
  String get senderPhone => field(['senderPhone']);
  String get receiverName => field(['receiverName']);
  String get receiverPhone => field(['receiverPhone']);
  String get origin => _city(field(['origin', 'originStation']));
  String get destination => _city(field(['destination', 'destinationStation']));
  String get route => origin.isEmpty && destination.isEmpty
      ? ''
      : '${origin.isEmpty ? '-' : origin} > ${destination.isEmpty ? '-' : destination}';
  String get item {
    final name = field(['packageName', 'description', 'parcelType']);
    final qty = int.tryParse(field(['quantity'])) ?? 1;
    return [name.isEmpty ? 'Parcel' : name, if (qty > 1) 'x$qty'].join(' ');
  }

  String get weight {
    final w = double.tryParse(field(['weight']));
    return w == null || w <= 0 ? '' : '${w % 1 == 0 ? w.toInt() : w} kg';
  }

  String get payment {
    final s = field(['paymentStatus']);
    if (s.isNotEmpty) return s.toUpperCase() == 'PAID' ? 'IMELIPWA' : s.toUpperCase();
    final paid = _m['isPaid'];
    return paid == true ? 'IMELIPWA' : (paid == false ? 'HAIJALIPWA' : '');
  }

  double? get price => double.tryParse(field(['price', 'amount']));
  bool get express {
    final u = field(['urgency', 'serviceType']).toLowerCase();
    return u.contains('express') || u == 'mgr';
  }

  bool get fragile => serviceIds.contains('fragile');
  bool get insured => serviceIds.contains('insurance');

  List<(String, double)> get services => [
    for (final id in serviceIds)
      if (_serviceInfo[id] != null) _serviceInfo[id]!,
  ];
}

/// ESC/POS text helpers. Alignment is sent as a printer command (ESC a)
/// rather than computed positions, so it's right whatever paper size is
/// configured. 32 columns fits every 58 mm printer and reads fine on 80 mm.
class _Ticket {
  static const cols = 32;
  static const labelW = 10;
  static final _money = NumberFormat('#,###');

  List<int> _ascii(String s) => s
      .replaceAll('→', '>')
      .replaceAll(RegExp('[–—]'), '-')
      .replaceAll(RegExp('[‘’]'), "'")
      .codeUnits
      .map((c) => c < 128 ? c : 0x3F)
      .toList();

  List<int> line(String s, {int align = 0, bool bold = false, bool tall = false, bool wide = false}) => [
    0x1B, 0x61, align, // ESC a: 0 left, 1 centre
    0x1B, 0x45, bold ? 1 : 0, // ESC E: bold
    0x1D, 0x21, (tall ? 0x01 : 0) | (wide ? 0x10 : 0), // GS !: size
    ..._ascii(s),
    0x0A,
  ];

  List<int> rule() => line('-' * cols, align: 1);

  /// "Label:    value", wrapping long values under the value column.
  List<int> detail(String label, String value, {bool bold = false}) {
    if (value.isEmpty) return [];
    final width = cols - labelW;
    final rows = <String>[];
    var cur = '';
    for (final w in value.split(RegExp(r'\s+'))) {
      if (cur.isEmpty) {
        cur = w;
      } else if (cur.length + 1 + w.length <= width) {
        cur = '$cur $w';
      } else {
        rows.add(cur);
        cur = w;
      }
    }
    rows.add(cur);
    return [
      for (var i = 0; i < rows.length; i++) ...line('${(i == 0 ? label : '').padRight(labelW)}${rows[i]}', bold: bold),
    ];
  }

  /// "Label ........ TSh 3,000" filling one line.
  List<int> amount(String label, double value, {bool bold = false, bool tall = false}) {
    final v = 'TSh ${_money.format(value)}';
    final room = cols - v.length - 1;
    final l = label.length > room ? label.substring(0, room) : label;
    return line('${l.padRight(cols - v.length)}$v', bold: bold, tall: tall);
  }

  /// Short tear-off margin, then cut.
  List<int> cut() => [0x1B, 0x61, 0x00, 0x0A, 0x0A, 0x0A, 0x1D, 0x56, 0x00];
}
