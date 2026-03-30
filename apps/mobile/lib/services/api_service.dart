import 'dart:io';
import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiService {
  // Use 192.168.100.72 (Mac IP) for real Android devices on same network
  // or 10.0.2.2 for Android emulators
  static final String _baseUrl = Platform.isAndroid 
    ? 'http://192.168.100.72:3000/api' 
    : 'http://localhost:3000/api';
    
  static const FlutterSecureStorage _storage = FlutterSecureStorage();
  
  // Set to false to use real API calls
  static const bool _useMocks = false;

  static Future<String?> get _token => _storage.read(key: 'jwt_token');

  static Future<Map<String, String>> get _headers async {
    final token = await _token;
    return {
      'Content-Type': 'application/json',
      if (token != null) 'Authorization': 'Bearer $token',
    };
  }

  // ─── AUTH ──────────────────────────────────────────────────────────

  static Future<Map<String, dynamic>> login(String email, String password) async {
    if (_useMocks) {
      await Future.delayed(const Duration(milliseconds: 1000));
      return {
        'token': 'mock_jwt_token',
        'user': {
          'id': 'u1',
          'name': 'Test User',
          'email': email,
          'phone': '+255700000000',
        }
      };
    }
    final res = await http.post(
      Uri.parse('$_baseUrl/auth/login'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email, 'password': password}),
    );
    return _parseResponse(res);
  }

  static Future<Map<String, dynamic>> register({
    required String name,
    required String email,
    required String password,
    String? phone,
  }) async {
    if (_useMocks) {
      await Future.delayed(const Duration(milliseconds: 1000));
      return {
        'token': 'mock_jwt_token',
        'user': {
          'id': 'u1',
          'name': name,
          'email': email,
          'phone': phone,
        }
      };
    }
    final res = await http.post(
      Uri.parse('$_baseUrl/auth/register'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'name': name, 'email': email, 'password': password, 'phone': phone}),
    );
    return _parseResponse(res);
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
    final res = await http.post(
      Uri.parse('$_baseUrl/auth/change-password'),
      headers: await _headers,
      body: jsonEncode({
        'currentPassword': currentPassword,
        'newPassword': newPassword,
      }),
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
    final res = await http.get(
      Uri.parse('$_baseUrl/cargo$query'),
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
    final res = await http.post(
      Uri.parse('$_baseUrl/cargo'),
      headers: await _headers,
      body: jsonEncode(data),
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
    final res = await http.get(
      Uri.parse('$_baseUrl/cargo/$id'),
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
    final res = await http.get(
      Uri.parse('$_baseUrl/cargo/$id/status'),
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
    final res = await http.get(
      Uri.parse('$_baseUrl/cargo/$id/receipt'),
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
    final res = await http.post(
      Uri.parse('$_baseUrl/operator/receive'),
      headers: await _headers,
      body: jsonEncode(data),
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
    final res = await http.patch(
      Uri.parse('$_baseUrl/operator/cargo/$id/status'),
      headers: await _headers,
      body: jsonEncode({'status': status, 'location': location}),
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
    final res = await http.post(
      Uri.parse('$_baseUrl/operator/cargo/$id/deliver'),
      headers: await _headers,
      body: jsonEncode({'otp': otp}),
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
    final res = await http.get(
      Uri.parse('$_baseUrl/operator/stats'),
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
    final res = await http.get(
      Uri.parse('$_baseUrl/operator/cargo/search?q=${Uri.encodeComponent(query)}'),
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
    final res = await http.get(
      Uri.parse('$_baseUrl/payment/channels'),
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
    final res = await http.post(
      Uri.parse('$_baseUrl/payment/initiate'),
      headers: await _headers,
      body: jsonEncode({
        'cargoId': cargoId,
        'provider': provider,
        'phone': phone,
      }),
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
    final res = await http.get(
      Uri.parse('$_baseUrl/payment/status/$paymentId'),
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
    final res = await http.get(
      Uri.parse('$_baseUrl/payments$query'),
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
    final res = await http.get(
      Uri.parse('$_baseUrl/auth/sessions'),
      headers: await _headers,
    );
    return jsonDecode(res.body) as List;
  }

  // ─── NOTIFICATIONS ─────────────────────────────────────────────────

  static Future<List<dynamic>> getNotifications() async {
    final res = await http.get(
      Uri.parse('$_baseUrl/notifications'),
      headers: await _headers,
    );
    return jsonDecode(res.body) as List;
  }

  /// Downloads the PDF receipt bytes for a paid cargo.
  static Future<Uint8List> downloadReceiptPdf(String cargoId) async {
    final res = await http.get(
      Uri.parse('$_baseUrl/cargo/$cargoId/receipt/pdf'),
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
    final res = await http.put(
      Uri.parse('$_baseUrl/users/fcm-token'),
      headers: await _headers,
      body: '{"token":"$token"}',
    );
    if (res.statusCode < 200 || res.statusCode >= 300) {
      throw ApiException(
        message: 'Failed to save FCM token',
        statusCode: res.statusCode,
      );
    }
  }

  // ─── TOKEN MANAGEMENT ──────────────────────────────────────────────

  static Future<void> saveToken(String token) async {
    await _storage.write(key: 'jwt_token', value: token);
  }

  static Future<void> clearToken() async {
    await _storage.delete(key: 'jwt_token');
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
