import 'dart:io';
import 'dart:convert';
import 'dart:typed_data';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'package:crypto/crypto.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiService {
  // Use 192.168.100.72 (Mac IP) for real Android devices on same network
  // or 10.0.2.2 for Android emulators
  static final String _baseUrl = Platform.isAndroid
    ? 'http://192.168.100.72:3000/api/v1'
    : 'http://localhost:3000/api/v1';
    
  static const FlutterSecureStorage _storage = FlutterSecureStorage();
  static const String _tokenKey = 'jwt_token';
  static const String _refreshTokenKey = 'refresh_token';
  static const String _deviceIdKey = 'device_id';
  static const String _requestSigningSecret = String.fromEnvironment('REQUEST_SIGNING_SECRET', defaultValue: '');
  
  // Set to false to use real API calls
  static const bool _useMocks = false;

  static Future<String?> get _token => _storage.read(key: _tokenKey);
  static Future<String?> get _refreshToken => _storage.read(key: _refreshTokenKey);

  static Future<String> _getOrCreateDeviceId() async {
    final existing = await _storage.read(key: _deviceIdKey);
    if (existing != null && existing.isNotEmpty) return existing;
    final generated = 'mobile-${Platform.operatingSystem}-${DateTime.now().millisecondsSinceEpoch}';
    await _storage.write(key: _deviceIdKey, value: generated);
    return generated;
  }

  static Future<Map<String, String>> get _headers async {
    final token = await _token;
    return {
      'Content-Type': 'application/json',
      if (token != null) 'Authorization': 'Bearer $token',
    };
  }

  static Future<http.Response> _sendWithAutoRefresh({
    required String method,
    required Uri url,
    Map<String, String>? headers,
    Object? body,
    bool retryOnUnauthorized = true,
  }) async {
    final request = http.Request(method, url);
    final mergedHeaders = Map<String, String>.from(headers ?? {});
    final bodyString = body == null ? '' : (body is String ? body : jsonEncode(body));
    if (body != null) request.body = bodyString;
    if (_shouldSignRequest(method: method, path: url.path)) {
      mergedHeaders.addAll(_buildSignatureHeaders(
        method: method,
        requestPathWithQuery: _requestPathWithQuery(url),
        body: bodyString,
      ));
    }
    request.headers.addAll(mergedHeaders);
    final streamed = await http.Client().send(request);
    final response = await http.Response.fromStream(streamed);

    if (response.statusCode == 401 && retryOnUnauthorized) {
      final refreshed = await _refreshAccessToken();
      if (refreshed) {
        final retryHeaders = Map<String, String>.from(headers ?? {});
        final latest = await _token;
        if (latest != null && latest.isNotEmpty) {
          retryHeaders['Authorization'] = 'Bearer $latest';
        }
        return _sendWithAutoRefresh(
          method: method,
          url: url,
          headers: retryHeaders,
          body: body,
          retryOnUnauthorized: false,
        );
      }
    }

    return response;
  }

  static Future<bool> _refreshAccessToken() async {
    final refreshToken = await _refreshToken;
    if (refreshToken == null || refreshToken.isEmpty) return false;
    final deviceId = await _getOrCreateDeviceId();

    try {
      final response = await http.post(
        Uri.parse('$_baseUrl/auth/refresh-token'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'refreshToken': refreshToken,
          'deviceId': deviceId,
        }),
      );
      if (response.statusCode < 200 || response.statusCode >= 300) {
        return false;
      }

      final body = jsonDecode(response.body);
      final data = body is Map<String, dynamic> ? (body['data'] ?? body) : {};
      final token = data is Map<String, dynamic> ? data['token'] as String? : null;
      final nextRefresh = data is Map<String, dynamic> ? data['refreshToken'] as String? : null;
      if (token == null || token.isEmpty) return false;

      await saveSessionTokens(
        token: token,
        refreshToken: nextRefresh ?? refreshToken,
        deviceId: deviceId,
      );
      return true;
    } catch (_) {
      return false;
    }
  }

  // ─── AUTH ──────────────────────────────────────────────────────────

  static bool _shouldSignRequest({required String method, required String path}) {
    if (_requestSigningSecret.isEmpty) return false;
    const signableMethods = {'POST', 'PUT', 'PATCH', 'DELETE'};
    if (!signableMethods.contains(method.toUpperCase())) return false;
    if (path.startsWith('/api/v1/auth/')) return false;
    if (path == '/api/v1/payments/callback') return false;
    return true;
  }

  static String _requestPathWithQuery(Uri url) {
    final query = url.hasQuery ? '?${url.query}' : '';
    return '${url.path}$query';
  }

  static String _stableJson(dynamic value) {
    if (value == null) return '';
    if (value is List) {
      return '[${value.map(_stableJson).join(',')}]';
    }
    if (value is Map) {
      final keys = value.keys.map((k) => k.toString()).toList()..sort();
      final parts = keys.map((k) => '"$k":${_stableJson(value[k])}');
      return '{${parts.join(',')}}';
    }
    return jsonEncode(value);
  }

  static Map<String, String> _buildSignatureHeaders({
    required String method,
    required String requestPathWithQuery,
    required String body,
  }) {
    final timestamp = DateTime.now().millisecondsSinceEpoch.toString();
    final nonce = '${DateTime.now().microsecondsSinceEpoch}-${Random.secure().nextInt(1 << 31)}';

    String canonicalBody;
    try {
      final decoded = body.isEmpty ? {} : jsonDecode(body);
      canonicalBody = _stableJson(decoded);
    } catch (_) {
      canonicalBody = body;
    }

    final bodyHash = sha256.convert(utf8.encode(canonicalBody)).toString();
    final payload = '${method.toUpperCase()}\n$requestPathWithQuery\n$timestamp\n$nonce\n$bodyHash';
    final signature = Hmac(sha256, utf8.encode(_requestSigningSecret))
        .convert(utf8.encode(payload))
        .toString();

    return {
      'x-signature': signature,
      'x-signature-timestamp': timestamp,
      'x-signature-nonce': nonce,
    };
  }

  static String _normalizePhone(String phone) {
    final digits = phone.replaceAll(RegExp(r'\D'), '');
    if (digits.startsWith('255')) return digits;
    if (digits.startsWith('0')) return '255${digits.substring(1)}';
    return digits;
  }

  static Future<Map<String, dynamic>> login(String email, String password) async {
    throw ApiException(
      message: 'Password login is deprecated. Use OTP login flow.',
      statusCode: 400,
    );
  }

  static Future<Map<String, dynamic>> register({
    required String name,
    required String email,
    required String password,
    String? phone,
  }) async {
    throw ApiException(
      message: 'Self-registration is deprecated. Ask an admin to create your account and use OTP login.',
      statusCode: 400,
    );
  }

  static Future<Map<String, dynamic>> forgotPassword(String identifier, bool isPhone) async {
    if (_useMocks) {
      await Future.delayed(const Duration(milliseconds: 1000));
      return {
        'message': 'Reset code sent',
        'code': '1234', // For dev testing
      };
    }
    final res = await http.post(
      Uri.parse('$_baseUrl/auth/forgot-password'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'identifier': identifier,
        'isPhone': isPhone,
      }),
    );
    return _parseResponse(res);
  }

  static Future<Map<String, dynamic>> sendOperatorOtp(String phone) async {
    final normalized = _normalizePhone(phone);
    final res = await http.post(
      Uri.parse('$_baseUrl/auth/operator/reset-otp'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'phone': normalized}),
    );
    return _parseResponse(res);
  }

  static Future<Map<String, dynamic>> loginOperatorWithOtp({
    required String phone,
    required String otp,
  }) async {
    final normalized = _normalizePhone(phone);
    final deviceId = await _getOrCreateDeviceId();
    final res = await http.post(
      Uri.parse('$_baseUrl/auth/operator/login'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'phone': normalized,
        'otp': otp,
        'deviceId': deviceId,
      }),
    );
    return _parseResponse(res);
  }

  static Future<Map<String, dynamic>> resetPassword({
    required String identifier,
    required bool isPhone,
    required String code,
    required String newPassword,
  }) async {
    if (_useMocks) {
      await Future.delayed(const Duration(milliseconds: 1000));
      if (code != '1234') {
        throw ApiException(message: 'Invalid reset code', statusCode: 400);
      }
      return {'message': 'Password reset successful'};
    }
    final res = await http.post(
      Uri.parse('$_baseUrl/auth/reset-password'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'identifier': identifier,
        'isPhone': isPhone,
        'code': code,
        'newPassword': newPassword,
      }),
    );
    return _parseResponse(res);
  }

  static Future<Map<String, dynamic>> changePassword({
    required String currentPassword,
    required String newPassword,
  }) async {
    if (_useMocks) {
      await Future.delayed(const Duration(milliseconds: 1000));
      return {'message': 'Password changed successfully'};
    }
    final res = await _sendWithAutoRefresh(
      method: 'POST',
      url: Uri.parse('$_baseUrl/auth/change-password'),
      headers: await _headers,
      body: {
        'currentPassword': currentPassword,
        'newPassword': newPassword,
      },
    );
    return _parseResponse(res);
  }

  // ─── CARGO ─────────────────────────────────────────────────────────

  static Future<List<dynamic>> getCargo({String? status}) async {
    if (_useMocks) {
      await Future.delayed(const Duration(milliseconds: 600));
      final prefs = await SharedPreferences.getInstance();
      final localData = prefs.getString('mock_cargo');
      List<dynamic> list = [];
      if (localData != null) {
        list = jsonDecode(localData) as List;
      } else {
        // Seed initial mock data with a variety of statuses
        list = [
          {
            'id': 'cargo-at-station-001',
            'trackingId': 'MZG-2024-STAT',
            'status': 'At Station',
            'fromAddress': 'Dar es Salaam',
            'toAddress': 'Arusha Bus Station',
            'serviceType': 'EXPRESS',
            'cargoType': 'Electronics',
            'cargoSize': 'SMALL',
            'peopleNeeded': 0,
            'receiverName': 'Amina Salehe',
            'receiverPhone': '+255712345678',
            'receiverPays': false,
            'additionalServices': [],
            'pickupType': 'STATION',
            'wagonType': 'STANDARD',
            'createdAt': DateTime.now().subtract(const Duration(days: 2)).toIso8601String(),
            'updatedAt': DateTime.now().subtract(const Duration(hours: 4)).toIso8601String(),
          },
          {
            'id': 'cargo-received-002',
            'trackingId': 'MZG-2024-RECV',
            'status': 'Received',
            'fromAddress': 'Mwanza',
            'toAddress': 'Dodoma Central Bus',
            'serviceType': 'STANDARD',
            'cargoType': 'Documents',
            'cargoSize': 'SMALL',
            'peopleNeeded': 0,
            'receiverName': 'John Mbeki',
            'receiverPhone': '+255787654321',
            'receiverPays': true,
            'additionalServices': [],
            'pickupType': 'STATION',
            'wagonType': 'STANDARD',
            'createdAt': DateTime.now().subtract(const Duration(hours: 6)).toIso8601String(),
            'updatedAt': DateTime.now().subtract(const Duration(hours: 6)).toIso8601String(),
          },
          {
            'id': 'cargo-transit-003',
            'trackingId': 'MZG-2024-TRAN',
            'status': 'In Transit',
            'fromAddress': 'Arusha',
            'toAddress': 'Kilimanjaro Airport',
            'serviceType': 'EXPRESS',
            'cargoType': 'Clothing',
            'cargoSize': 'MEDIUM',
            'peopleNeeded': 1,
            'receiverName': 'Fatuma Juma',
            'receiverPhone': '+255722111222',
            'receiverPays': false,
            'additionalServices': [],
            'pickupType': 'DOOR',
            'wagonType': 'STANDARD',
            'createdAt': DateTime.now().subtract(const Duration(days: 1)).toIso8601String(),
            'updatedAt': DateTime.now().subtract(const Duration(hours: 12)).toIso8601String(),
          },
          {
            'id': 'cargo-delivered-004',
            'trackingId': 'MZG-2024-DLVD',
            'status': 'Delivered',
            'fromAddress': 'Dar es Salaam',
            'toAddress': 'Morogoro',
            'serviceType': 'STANDARD',
            'cargoType': 'Food',
            'cargoSize': 'LARGE',
            'peopleNeeded': 2,
            'receiverName': 'Peter Kimani',
            'receiverPhone': '+255733444555',
            'receiverPays': false,
            'additionalServices': [],
            'pickupType': 'STATION',
            'wagonType': 'STANDARD',
            'createdAt': DateTime.now().subtract(const Duration(days: 5)).toIso8601String(),
            'updatedAt': DateTime.now().subtract(const Duration(days: 1)).toIso8601String(),
          },
        ];
        await prefs.setString('mock_cargo', jsonEncode(list));
      }
      if (status != null) {
        return list.where((item) => item['status'] == status).toList();
      }
      return list;
    }
    final query = status != null ? '?status=$status' : '';
    final res = await _sendWithAutoRefresh(
      method: 'GET',
      url: Uri.parse('$_baseUrl/cargo$query'),
      headers: await _headers,
    );
    return jsonDecode(res.body) as List;
  }

  static Future<Map<String, dynamic>> createCargo(Map<String, dynamic> data) async {
    if (_useMocks) {
      await Future.delayed(const Duration(milliseconds: 800));
      final prefs = await SharedPreferences.getInstance();
      final localData = prefs.getString('mock_cargo');
      List<dynamic> list = [];
      if (localData != null) {
        list = jsonDecode(localData) as List;
      }
      
      final newId = 'pk-${DateTime.now().millisecondsSinceEpoch}';
      final newCargo = {
        ...data,
        'id': newId,
        'trackingId': 'PK-${DateTime.now().year}-${DateTime.now().millisecondsSinceEpoch.toString().substring(8)}',
        'status': 'Pending',
        'createdAt': DateTime.now().toIso8601String(),
        'eta': 'Processing',
        'emoji': '📦',
      };
      
      list.insert(0, newCargo);
      await prefs.setString('mock_cargo', jsonEncode(list));
      return newCargo;
    }
    final res = await _sendWithAutoRefresh(
      method: 'POST',
      url: Uri.parse('$_baseUrl/cargo'),
      headers: await _headers,
      body: data,
    );
    return _parseResponse(res);
  }

  static Future<Map<String, dynamic>> getCargoById(String id) async {
    if (_useMocks) {
      final prefs = await SharedPreferences.getInstance();
      final localData = prefs.getString('mock_cargo');
      if (localData != null) {
        final List<dynamic> list = jsonDecode(localData);
        final item = list.firstWhere((c) => c['id'] == id, orElse: () => null);
        if (item != null) return item;
      }
      throw ApiException(message: 'Cargo not found', statusCode: 404);
    }
    final res = await _sendWithAutoRefresh(
      method: 'GET',
      url: Uri.parse('$_baseUrl/cargo/$id'),
      headers: await _headers,
    );
    return _parseResponse(res);
  }

  static Future<Map<String, dynamic>> getCargoStatus(String id) async {
    if (_useMocks) {
      final cargo = await getCargoById(id);
      return {
        'id': id,
        'status': cargo['status'] ?? 'Pending',
        'updatedAt': DateTime.now().toIso8601String(),
      };
    }
    final res = await _sendWithAutoRefresh(
      method: 'GET',
      url: Uri.parse('$_baseUrl/cargo/$id/status'),
      headers: await _headers,
    );
    return _parseResponse(res);
  }

  static Future<Map<String, dynamic>> getCargoReceipt(String id) async {
    if (_useMocks) {
      final cargo = await getCargoById(id);
      return {
        'id': id,
        'trackingId': cargo['trackingId'] ?? 'PK-MOCK',
        'amount': cargo['price'] ?? '0',
        'paidAt': DateTime.now().toIso8601String(),
        'items': [
          {'description': cargo['name'] ?? 'Package', 'amount': cargo['price']}
        ]
      };
    }
    final res = await _sendWithAutoRefresh(
      method: 'GET',
      url: Uri.parse('$_baseUrl/cargo/$id/receipt'),
      headers: await _headers,
    );
    return _parseResponse(res);
  }

  // ─── OPERATOR ACTIONS ──────────────────────────────────────────────

  static Future<Map<String, dynamic>> receiveCargo(Map<String, dynamic> data) async {
    if (_useMocks) {
      await Future.delayed(const Duration(milliseconds: 1000));
      final prefs = await SharedPreferences.getInstance();
      final localData = prefs.getString('mock_cargo');
      List<dynamic> list = localData != null ? jsonDecode(localData) : [];
      
      final newItem = {
        ...data,
        'id': 'op-rec-${DateTime.now().millisecondsSinceEpoch}',
        'trackingId': 'REC-${DateTime.now().millisecondsSinceEpoch.toString().substring(8)}',
        'status': 'At Warehouse',
        'createdAt': DateTime.now().toIso8601String(),
        'emoji': '📥',
      };
      
      list.insert(0, newItem);
      await prefs.setString('mock_cargo', jsonEncode(list));
      return newItem;
    }
    final res = await _sendWithAutoRefresh(
      method: 'POST',
      url: Uri.parse('$_baseUrl/operator/receive'),
      headers: await _headers,
      body: data,
    );
    return _parseResponse(res);
  }

  static Future<Map<String, dynamic>> updateCargoStatus(String id, String status, {String? location}) async {
    if (_useMocks) {
      await Future.delayed(const Duration(milliseconds: 800));
      final prefs = await SharedPreferences.getInstance();
      final localData = prefs.getString('mock_cargo');
      if (localData != null) {
        List<dynamic> list = jsonDecode(localData);
        final index = list.indexWhere((c) => c['id'] == id);
        if (index != -1) {
          list[index]['status'] = status;
          if (location != null) list[index]['currentLocation'] = location;
          await prefs.setString('mock_cargo', jsonEncode(list));
          return list[index];
        }
      }
      throw ApiException(message: 'Cargo not found', statusCode: 404);
    }
    final res = await _sendWithAutoRefresh(
      method: 'PATCH',
      url: Uri.parse('$_baseUrl/operator/cargo/$id/status'),
      headers: await _headers,
      body: {'status': status, 'location': location},
    );
    return _parseResponse(res);
  }

  /// Operator delivers cargo using OTP verification.
  static Future<Map<String, dynamic>> deliverCargo(String id, String otp) async {
    if (_useMocks) {
      await Future.delayed(const Duration(milliseconds: 800));
      // For MVP, accept any 4-digit OTP
      if (otp.length != 4) {
        throw ApiException(message: 'Invalid OTP code', statusCode: 400);
      }
      return updateCargoStatus(id, 'Delivered');
    }
    final res = await _sendWithAutoRefresh(
      method: 'POST',
      url: Uri.parse('$_baseUrl/operator/cargo/$id/deliver'),
      headers: await _headers,
      body: {'otp': otp},
    );
    return _parseResponse(res);
  }

  static Future<Map<String, dynamic>> getOperatorStats() async {
    if (_useMocks) {
      await Future.delayed(const Duration(milliseconds: 600));
      return {
        // All-time totals (used as fallback)
        'received': 42,
        'delivered': 34,
        'sent': 67,
        'atWarehouse': 22,
        // Per-period breakdown (used by KPI cards & stacked volume cards)
        'daily': {
          'received': 5,
          'delivered': 3,
          'sent': 8,
          'atWarehouse': 2,
        },
        'weekly': {
          'received': 18,
          'delivered': 12,
          'sent': 28,
          'atWarehouse': 8,
        },
        'monthly': {
          'received': 42,
          'delivered': 34,
          'sent': 67,
          'atWarehouse': 22,
        },
        'last30': {
          'received': 38,
          'delivered': 30,
          'sent': 58,
          'atWarehouse': 19,
        },
        'last90': {
          'received': 112,
          'delivered': 98,
          'sent': 176,
          'atWarehouse': 47,
        },
      };
    }
    final res = await _sendWithAutoRefresh(
      method: 'GET',
      url: Uri.parse('$_baseUrl/operator/stats'),
      headers: await _headers,
    );
    return _parseResponse(res);
  }


  /// Search for cargo by tracking ID or cargo ID (operator use).
  static Future<List<dynamic>> searchCargo(String query) async {
    if (_useMocks) {
      await Future.delayed(const Duration(milliseconds: 700));
      final prefs = await SharedPreferences.getInstance();
      final localData = prefs.getString('mock_cargo');
      if (localData != null) {
        final List<dynamic> list = jsonDecode(localData);
        final lower = query.toLowerCase();
        return list.where((c) {
          final id = (c['id'] ?? '').toString().toLowerCase();
          final trackingId = (c['trackingId'] ?? '').toString().toLowerCase();
          return id.contains(lower) || trackingId.contains(lower);
        }).toList();
      }
      return [];
    }
    final res = await _sendWithAutoRefresh(
      method: 'GET',
      url: Uri.parse('$_baseUrl/operator/cargo/search?q=${Uri.encodeComponent(query)}'),
      headers: await _headers,
    );
    final body = jsonDecode(res.body);
    if (body is List) return body;
    if (body is Map && body.containsKey('data')) return body['data'] as List;
    return [];
  }


  // ─── PAYMENTS ──────────────────────────────────────────────────────

  /// Fetch live payment channels from the MySafari gateway (via our backend proxy).
  static Future<List<dynamic>> getPaymentChannels() async {
    final res = await _sendWithAutoRefresh(
      method: 'GET',
      url: Uri.parse('$_baseUrl/payment/channels'),
      headers: await _headers,
    );
    if (res.statusCode >= 200 && res.statusCode < 300) {
      return jsonDecode(res.body) as List;
    }
    throw ApiException(message: 'Failed to load channels', statusCode: res.statusCode);
  }

  /// Initiate an STK push via the MySafari payment gateway.
  /// [provider] — uts_name of the channel (e.g. 'airtel', 'tigopesa')
  /// [phone]    — subscriber MSISDN (e.g. '0754123456')
  static Future<Map<String, dynamic>> initiatePayment({
    required String cargoId,
    required String provider,
    required String phone,
  }) async {
    if (_useMocks) {
      await Future.delayed(const Duration(milliseconds: 1500));
      return {
        'id': 'pay-${DateTime.now().millisecondsSinceEpoch}',
        'status': 'Pending',
        'amount': 35000.0,
        'provider': provider,
        'phone': phone,
        'cargoId': cargoId,
      };
    }
    final res = await _sendWithAutoRefresh(
      method: 'POST',
      url: Uri.parse('$_baseUrl/payment/initiate'),
      headers: await _headers,
      body: {
        'cargoId': cargoId,
        'provider': provider,
        'phone': phone,
      },
    );
    return _parseResponse(res);
  }

  /// Poll the status of a payment by its ID.
  /// Returns { id, status, amount, provider, transactionReference, cargoStatus }
  static Future<Map<String, dynamic>> pollPaymentStatus(String paymentId) async {
    if (_useMocks) {
      await Future.delayed(const Duration(milliseconds: 1000));
      return {
        'id': paymentId,
        'status': 'Completed',
        'amount': 35000.0,
        'provider': 'M-Pesa',
        'transactionReference': 'TXN${DateTime.now().millisecondsSinceEpoch}',
        'cargoStatus': 'Paid',
      };
    }
    final res = await _sendWithAutoRefresh(
      method: 'GET',
      url: Uri.parse('$_baseUrl/payment/status/$paymentId'),
      headers: await _headers,
    );
    return _parseResponse(res);
  }

  static Future<List<dynamic>> getMyPayments({String? status}) async {
    if (_useMocks) {
      return [
        {
          'id': 'pay-1',
          'amount': 35000.0,
          'status': 'Completed',
          'provider': 'M-Pesa',
          'createdAt': DateTime.now().toIso8601String(),
        }
      ];
    }
    final query = status != null ? '?status=$status' : '';
    final res = await _sendWithAutoRefresh(
      method: 'GET',
      url: Uri.parse('$_baseUrl/payments$query'),
      headers: await _headers,
    );
    return jsonDecode(res.body) as List;
  }

  // ─── LOGIN & SECURITY ──────────────────────────────────────────────
  
  static Future<List<dynamic>> getSessions() async {
    if (_useMocks) {
      await Future.delayed(const Duration(milliseconds: 500));
      return [
        {
          'id': 's1',
          'deviceName': 'iPhone 15 Pro',
          'location': 'Dar es Salaam, TZ',
          'lastActive': 'Active now',
          'isCurrent': true,
        },
        {
          'id': 's2',
          'deviceName': 'Chrome on MacOS',
          'location': 'Nairobi, KE',
          'lastActive': '2 hours ago',
          'isCurrent': false,
        },
      ];
    }
    final res = await _sendWithAutoRefresh(
      method: 'GET',
      url: Uri.parse('$_baseUrl/auth/sessions'),
      headers: await _headers,
    );
    return jsonDecode(res.body) as List;
  }

  // ─── NOTIFICATIONS ─────────────────────────────────────────────────

  static Future<List<dynamic>> getNotifications() async {
    final res = await _sendWithAutoRefresh(
      method: 'GET',
      url: Uri.parse('$_baseUrl/notifications'),
      headers: await _headers,
    );
    return jsonDecode(res.body) as List;
  }

  /// Downloads the PDF receipt bytes for a paid cargo.
  static Future<Uint8List> downloadReceiptPdf(String cargoId) async {
    final res = await _sendWithAutoRefresh(
      method: 'GET',
      url: Uri.parse('$_baseUrl/cargo/$cargoId/receipt/pdf'),
      headers: await _headers,
    );
    if (res.statusCode >= 200 && res.statusCode < 300) {
      return res.bodyBytes;
    }
    throw ApiException(
      message: 'Failed to download PDF receipt',
      statusCode: res.statusCode,
    );
  }

  /// Saves the FCM device token to the backend so push notifications can be sent.
  static Future<void> saveFcmToken(String token) async {
    final res = await _sendWithAutoRefresh(
      method: 'PUT',
      url: Uri.parse('$_baseUrl/users/fcm-token'),
      headers: await _headers,
      body: {'token': token},
    );
    if (res.statusCode < 200 || res.statusCode >= 300) {
      throw ApiException(
        message: 'Failed to save FCM token',
        statusCode: res.statusCode,
      );
    }
  }

  // ─── OPERATOR REPORTS ──────────────────────────────────────────────

  /// Returns a list of previously generated reports for the operator.
  /// Each item contains at least: { name, date, size }.
  static Future<List<dynamic>> getReportHistory() async {
    try {
      final res = await _sendWithAutoRefresh(
        method: 'GET',
        url: Uri.parse('$_baseUrl/operator/reports/history'),
        headers: await _headers,
      );
      if (res.statusCode >= 200 && res.statusCode < 300) {
        final body = jsonDecode(res.body);
        if (body is List) return body;
        if (body is Map && body['data'] is List) return body['data'] as List;
      }
      // Non-2xx → return empty list so the UI shows the empty state gracefully.
      return [];
    } catch (_) {
      return [];
    }
  }

  /// Generates an operator PDF report and returns the raw bytes.
  ///
  /// [type]   – e.g. 'All', 'Received', 'Sent', …
  /// [period] – period key from [ReportPeriod.key] e.g. 'thisMonth'
  /// [start] / [end] – only set when period == 'custom'
  static Future<Uint8List> generateOperatorReport({
    required String type,
    required String period,
    DateTime? start,
    DateTime? end,
  }) async {
    final body = jsonEncode({
      'type': type,
      'period': period,
      if (start != null) 'startDate': start.toIso8601String(),
      if (end != null) 'endDate': end.toIso8601String(),
    });

    final res = await _sendWithAutoRefresh(
      method: 'POST',
      url: Uri.parse('$_baseUrl/operator/reports/generate'),
      headers: {
        ...await _headers,
        'Content-Type': 'application/json',
      },
      body: body,
    );

    if (res.statusCode >= 200 && res.statusCode < 300) {
      return res.bodyBytes;
    }
    throw ApiException(
      message: 'Failed to generate report (${res.statusCode})',
      statusCode: res.statusCode,
    );
  }

  // ─── TOKEN MANAGEMENT ──────────────────────────────────────────────

  static Future<void> saveToken(String token) async {
    await _storage.write(key: _tokenKey, value: token);
  }

  static Future<void> saveSessionTokens({
    required String token,
    required String refreshToken,
    String? deviceId,
  }) async {
    await _storage.write(key: _tokenKey, value: token);
    await _storage.write(key: _refreshTokenKey, value: refreshToken);
    if (deviceId != null && deviceId.isNotEmpty) {
      await _storage.write(key: _deviceIdKey, value: deviceId);
    } else {
      await _getOrCreateDeviceId();
    }
  }

  static Future<void> clearToken() async {
    await _storage.delete(key: _tokenKey);
    await _storage.delete(key: _refreshTokenKey);
  }


  // ─── HELPERS ───────────────────────────────────────────────────────

  static Map<String, dynamic> _parseResponse(http.Response res) {
    dynamic body;
    try {
      body = jsonDecode(res.body);
    } catch (_) {
      throw ApiException(message: 'Invalid server response', statusCode: res.statusCode);
    }
    if (res.statusCode >= 200 && res.statusCode < 300) {
      if (body is List) return {'data': body};
      return body is Map<String, dynamic> ? body : {'data': body};
    }
    throw ApiException(
      message: (body is Map && body.containsKey('error')) ? body['error'] : 'Unknown error',
      statusCode: res.statusCode,
    );
  }
}

class ApiException implements Exception {
  final String message;
  final int statusCode;
  ApiException({required this.message, required this.statusCode});

  @override
  String toString() => 'ApiException($statusCode): $message';
}
