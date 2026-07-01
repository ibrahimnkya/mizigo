import 'dart:io';
import 'dart:convert';
import 'dart:typed_data';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'package:crypto/crypto.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:flutter/foundation.dart';

class ApiService {
  // Local dev server — auto-discovery will update this for physical devices
  static String _baseUrl = 'http://api.mizigo.akiliapp.co.tz/api/v1';
  static bool _localIpResolved = false;

  static Future<void> init() async {
    // Production mode — skip local IP resolution
  }

  static Future<void> _resolveBaseUrl() async {
    if (_localIpResolved) return;
    _localIpResolved = true;

    try {
      if (Platform.isAndroid) {
        final reachable = await _isPortOpen('10.0.2.2', 3001);
        if (reachable) {
          _baseUrl = 'http://10.0.2.2:3001/api/v1';
          print('Resolved local base URL (Android emulator): $_baseUrl');
          return;
        }
      }

      if (Platform.isIOS) {
        final reachable = await _isPortOpen('127.0.0.1', 3001);
        if (reachable) {
          _baseUrl = 'http://127.0.0.1:3001/api/v1';
          print('Resolved local base URL (iOS simulator): $_baseUrl');
          return;
        }
      }

      // Physical device: scan the local subnet for the dev server
      final interfaces = await NetworkInterface.list();
      for (var interface in interfaces) {
        for (var addr in interface.addresses) {
          if (addr.type == InternetAddressType.IPv4 && !addr.isLoopback) {
            final parts = addr.address.split('.');
            if (parts.length == 4) {
              final subnet = '${parts[0]}.${parts[1]}.${parts[2]}';
              final futures = <Future<String?>>[];
              for (int i = 1; i < 255; i++) {
                final hostIp = '$subnet.$i';
                if (hostIp == addr.address) continue;
                futures.add(() async {
                  final open = await _isPortOpen(hostIp, 3001);
                  return open ? hostIp : null;
                }());
              }
              final results = await Future.wait(futures);
              final foundIp = results.firstWhere((ip) => ip != null, orElse: () => null);
              if (foundIp != null) {
                _baseUrl = 'http://$foundIp:3001/api/v1';
                print('Resolved local base URL (Wi-Fi subnet): $_baseUrl');
                return;
              }
            }
          }
        }
      }
    } catch (e) {
      print('Failed to resolve local base URL: $e');
    }
    print('Using default base URL: $_baseUrl');
  }

  static Future<bool> _isPortOpen(String host, int port) async {
    try {
      final socket = await Socket.connect(host, port, timeout: const Duration(milliseconds: 150));
      socket.destroy();
      return true;
    } catch (_) {
      return false;
    }
  }
    
  static const FlutterSecureStorage _storage = FlutterSecureStorage();
  static const String _tokenKey = 'jwt_token';
  static const String _refreshTokenKey = 'refresh_token';
  static const String _deviceIdKey = 'device_id';
  static const String _requestSigningSecret = String.fromEnvironment('REQUEST_SIGNING_SECRET', defaultValue: '');
  
  // Set to true to use real API calls
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

  static void _logCall({
    required String method,
    required Uri url,
    Map<String, String>? headers,
    Object? body,
    required http.Response response,
  }) {
    final timestamp = DateTime.now().toIso8601String();
    print('[$timestamp] API REQUEST: $method $url');
    if (headers != null) {
      print('[$timestamp] API REQUEST HEADERS: $headers');
    }
    if (body != null && body.toString().isNotEmpty) {
      print('[$timestamp] API REQUEST BODY: $body');
    }
    print('[$timestamp] API RESPONSE STATUS: ${response.statusCode}');
    print('[$timestamp] API RESPONSE BODY: ${response.body}');
  }

  static Future<http.Response> _sendRequest({
    required String method,
    required Uri url,
    Map<String, String>? headers,
    Object? body,
  }) async {
    final request = http.Request(method, url);
    final mergedHeaders = Map<String, String>.from(headers ?? {});
    final bodyString = body == null ? '' : (body is String ? body : jsonEncode(body));
    if (body != null) request.body = bodyString;
    request.headers.addAll(mergedHeaders);

    final streamed = await http.Client().send(request);
    final response = await http.Response.fromStream(streamed);

    _logCall(
      method: method,
      url: url,
      headers: mergedHeaders,
      body: bodyString,
      response: response,
    );

    return response;
  }

  static Future<http.Response> _sendWithAutoRefresh({
    required String method,
    required Uri url,
    Map<String, String>? headers,
    Object? body,
    bool retryOnUnauthorized = true,
    bool bypassMock = false,
  }) async {
    if (_useMocks && !bypassMock) {
      // In mock mode, don't attempt real network calls unless explicitly allowed.
      // This prevents "No route to host" errors during demos.
      return http.Response(jsonEncode({'message': 'Mocks enabled'}), 503);
    }
    final mergedHeaders = Map<String, String>.from(headers ?? {});
    final bodyString = body == null ? '' : (body is String ? body : jsonEncode(body));
    if (_shouldSignRequest(method: method, path: url.path)) {
      mergedHeaders.addAll(_buildSignatureHeaders(
        method: method,
        requestPathWithQuery: _requestPathWithQuery(url),
        body: bodyString,
      ));
    }

    final response = await _sendRequest(
      method: method,
      url: url,
      headers: mergedHeaders,
      body: bodyString,
    );

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
          bypassMock: bypassMock,
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
      final response = await _sendRequest(
        method: 'POST',
        url: Uri.parse('$_baseUrl/auth/refresh-token'),
        headers: {'Content-Type': 'application/json'},
        body: {
          'refreshToken': refreshToken,
          'deviceId': deviceId,
        },
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
    final res = await _sendRequest(
      method: 'POST',
      url: Uri.parse('$_baseUrl/auth/forgot-password'),
      headers: {'Content-Type': 'application/json'},
      body: {
        'identifier': identifier,
        'isPhone': isPhone,
      },
    );
    return _parseResponse(res);
  }

  static Future<Map<String, dynamic>> checkPhone(String phone) async {
    final normalized = _normalizePhone(phone);
    final res = await _sendRequest(
      method: 'POST',
      url: Uri.parse('$_baseUrl/auth/check-phone'),
      headers: {'Content-Type': 'application/json'},
      body: {'phone': normalized},
    );
    return _parseResponse(res);
  }

  static Future<Map<String, dynamic>> sendOperatorOtp(String phone) async {
    final normalized = _normalizePhone(phone);
    final res = await _sendRequest(
      method: 'POST',
      url: Uri.parse('$_baseUrl/auth/operator/reset-otp'),
      headers: {'Content-Type': 'application/json'},
      body: {'phone': normalized},
    );
    return _parseResponse(res);
  }

  static Future<Map<String, dynamic>> loginOperatorWithOtp({
    required String phone,
    required String otp,
  }) async {
    final normalized = _normalizePhone(phone);
    final deviceId = await _getOrCreateDeviceId();
    final res = await _sendRequest(
      method: 'POST',
      url: Uri.parse('$_baseUrl/auth/operator/login'),
      headers: {'Content-Type': 'application/json'},
      body: {
        'phone': normalized,
        'otp': otp,
        'deviceId': deviceId,
      },
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
    final res = await _sendRequest(
      method: 'POST',
      url: Uri.parse('$_baseUrl/auth/reset-password'),
      headers: {'Content-Type': 'application/json'},
      body: {
        'identifier': identifier,
        'isPhone': isPhone,
        'code': code,
        'newPassword': newPassword,
      },
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

  static Future<Map<String, dynamic>> changeOperatorOtp(String newOtp) async {
    if (_useMocks) {
      await Future.delayed(const Duration(milliseconds: 800));
      return {'message': 'OTP updated successfully'};
    }
    final res = await _sendWithAutoRefresh(
      method: 'POST',
      url: Uri.parse('$_baseUrl/auth/operator/change-otp'),
      headers: await _headers,
      body: {
        'newOtp': newOtp,
      },
    );
    return _parseResponse(res);
  }

  static Future<Map<String, dynamic>> updateProfile({String? name, String? phone}) async {
    if (_useMocks) {
      await Future.delayed(const Duration(milliseconds: 500));
      return {
        'success': true,
        'data': {
          'name': name ?? 'Updated Name',
          'phone': phone ?? '255712345678',
        }
      };
    }
    final res = await _sendWithAutoRefresh(
      method: 'PUT',
      url: Uri.parse('$_baseUrl/users/profile'),
      headers: await _headers,
      body: {
        'name': ?name,
        'phone': ?phone,
      },
    );
    return _parseResponse(res);
  }

  static List<dynamic> _parseListResponse(dynamic responseBody) {
    try {
      final decoded = responseBody is String ? jsonDecode(responseBody) : responseBody;
      if (decoded is List) return decoded;
      if (decoded is Map) {
        if (decoded.containsKey('data') && decoded['data'] is List) {
          return decoded['data'] as List;
        }
        if (decoded.containsKey('success') && decoded['success'] == true && decoded['data'] is List) {
          return decoded['data'] as List;
        }
      }
    } catch (_) {}
    return const [];
  }

  static Future<List<dynamic>> getOrganizations() async {
    try {
      final res = await _sendWithAutoRefresh(
        method: 'GET',
        url: Uri.parse('$_baseUrl/organizations?all=true'),
        headers: await _headers,
        bypassMock: true,
      );
      if (res.statusCode >= 200 && res.statusCode < 300) {
        return _parseListResponse(res.body);
      }
      _parseResponse(res);
    } catch (e) {
      if (_useMocks) {
        // Fall through to mock fallback
      } else {
        rethrow;
      }
    }
    return const [];
  }

  static Future<List<dynamic>> getStations() async {
    try {
      final res = await _sendWithAutoRefresh(
        method: 'GET',
        url: Uri.parse('$_baseUrl/stations'),
        headers: await _headers,
        bypassMock: true,
      );
      if (res.statusCode >= 200 && res.statusCode < 300) {
        return _parseListResponse(res.body);
      }
      _parseResponse(res);
    } catch (e) {
      if (_useMocks) {
        // Fall through to mock fallback if mock is enabled
      } else {
        rethrow;
      }
    }

    if (_useMocks) {
      return const [
        {'id': '01KPWEWYACW1NRAFBTTGFRSKYS', 'name': 'Dar es Salaam', 'code': 'DSM'},
        {'id': '01KPWEWYAH1EWYZA9A87M6JVHN', 'name': 'Pugu', 'code': 'PUG'},
        {'id': '01KPWEWYAMDJWDA4V46CYERGK0', 'name': 'Soga', 'code': 'SOG'},
        {'id': '01KPWEWYAQ78HT4H60XPXPM199', 'name': 'Ruvu', 'code': 'RUV'},
        {'id': '01KPWEWYATH95AFXQTNXAPHK0H', 'name': 'Ngerengere', 'code': 'NGR'},
        {'id': '01KPWEWYAXQKQE805RXDFP5327', 'name': 'Morogoro', 'code': 'MOR'},
        {'id': '01KPWEWYB0DXCZSXJHPJJ4NEJX', 'name': 'Mkata', 'code': 'MkA'},
        {'id': '01KPWEWYB3MBYH1ATFDHT5C9QA', 'name': 'Kilosa', 'code': 'KLO'},
        {'id': '01KPWEWYB64BN465AYCY0ANFF8', 'name': 'Kidete', 'code': 'KID'},
        {'id': '01KPWEWYB8HQWA38MK5VMY1S7B', 'name': 'Gulwe', 'code': 'GLW'},
        {'id': '01KPWEWYBBNAD6DQYCXJ7CBS22', 'name': 'Igandu', 'code': 'IGD'},
        {'id': '01KPWEWYBDHMSDJKHNQYKJBV4M', 'name': 'Dodoma', 'code': 'DOM'},
      ];
    }
    throw ApiException(message: 'Failed to fetch SGR stations', statusCode: 500);
  }

  static Future<Map<String, Map<String, String>>> getParcelParameters() async {
    try {
      final res = await _sendWithAutoRefresh(
        method: 'GET',
        url: Uri.parse('$_baseUrl/parcel/parcel-parameters'),
        headers: await _headers,
        bypassMock: true,
      );
      if (res.statusCode >= 200 && res.statusCode < 300) {
        final decoded = jsonDecode(res.body);
        final data = decoded['data'] ?? decoded;
        final List<dynamic> types = data['parcelTypes'] ?? [];
        final List<dynamic> conditions = data['parcelConditions'] ?? [];
        final List<dynamic> sizes = data['packageSizes'] ?? [];
        final List<dynamic> priorities = data['deliveryPriorities'] ?? [];

        final Map<String, String> parsedTypes = {};
        for (var item in types) {
          if (item is Map) {
            parsedTypes[item['name'].toString()] = item['description']?.toString() ?? '';
          } else {
            parsedTypes[item.toString()] = '';
          }
        }

        final Map<String, String> parsedConditions = {};
        for (var item in conditions) {
          if (item is Map) {
            parsedConditions[item['name'].toString()] = item['description']?.toString() ?? '';
          } else {
            parsedConditions[item.toString()] = '';
          }
        }

        final Map<String, String> parsedSizes = {};
        for (var item in sizes) {
          if (item is Map) {
            parsedSizes[item['name'].toString()] = item['description']?.toString() ?? '';
          } else {
            parsedSizes[item.toString()] = '';
          }
        }

        final Map<String, String> parsedPriorities = {};
        for (var item in priorities) {
          if (item is Map) {
            parsedPriorities[item['name'].toString()] = item['description']?.toString() ?? '';
          } else {
            parsedPriorities[item.toString()] = '';
          }
        }

        return {
          'parcelTypes': parsedTypes,
          'parcelConditions': parsedConditions,
          'packageSizes': parsedSizes,
          'deliveryPriorities': parsedPriorities,
        };
      }
      _parseResponse(res);
    } catch (e) {
      if (_useMocks) {
        // Fall through to mock fallback if mock is enabled
      } else {
        rethrow;
      }
    }

    return {
      'parcelTypes': {
        'Parcel': 'User provides their own packaging',
        'Pallet': 'Stacked bulk goods',
        'Container': 'Large volume shipments',
        'Fragile Goods': 'Handle with extra care',
      },
      'parcelConditions': {
        'Brand New': 'Unused, factory-sealed item.',
        'Refurbished': 'Restored, tested, and certified.',
        'Used': 'Previously owned, functional condition.',
      },
      'packageSizes': {
        'Document': 'A4-sized paper, lightweight',
        'A3 Nylon Packing': 'Small packets, soft parcels',
        'Size 1': 'Small Box – Approx. 30cm x 30cm x 30cm',
        'Size 2': 'Medium Box – Approx. 50cm x 50cm x 50cm',
        'Size 3': 'Large Box – Approx. 70cm x 70cm x 70cm',
      },
      'deliveryPriorities': {
        'Express': 'High-priority, same-day or next-day delivery',
        'Standard': 'Regular ground delivery service',
        'MGR': 'Mizigo Golden Route - scheduled premium service',
      },
    };
  }

  static Future<Map<String, String>> getLegalPolicies() async {
    try {
      final res = await _sendWithAutoRefresh(
        method: 'GET',
        url: Uri.parse('$_baseUrl/admin/platform/legal'),
        headers: await _headers,
        bypassMock: true,
      );
      if (res.statusCode >= 200 && res.statusCode < 300) {
        final decoded = jsonDecode(res.body);
        final data = decoded['data'] ?? decoded;
        return {
          'termsAndConditions': data['termsAndConditions']?.toString() ?? '',
          'privacyPolicy': data['privacyPolicy']?.toString() ?? '',
        };
      }
      _parseResponse(res);
    } catch (_) {}
    return {
      'termsAndConditions': '',
      'privacyPolicy': '',
    };
  }

  static Future<Map<String, dynamic>> checkUpdate(String currentVersion) async {
    try {
      final res = await _sendWithAutoRefresh(
        method: 'GET',
        url: Uri.parse('$_baseUrl/app-versions/check-update?currentVersion=$currentVersion'),
        headers: await _headers,
        bypassMock: true,
      );
      if (res.statusCode >= 200 && res.statusCode < 300) {
        final decoded = jsonDecode(res.body);
        return decoded['data'] ?? decoded;
      }
      _parseResponse(res);
    } catch (e) {
      if (_useMocks) {
        // Fall through to default mock response if mock is enabled
      } else {
        rethrow;
      }
    }
    return {
      'latestVersion': currentVersion,
      'forceUpdate': false,
      'downloadUrl': '',
    };
  }

  // ─── PARCEL ─────────────────────────────────────────────────────────

  static Future<List<dynamic>> getParcels({String? status}) async {
    if (_useMocks) {
      await Future.delayed(const Duration(milliseconds: 600));
      final prefs = await SharedPreferences.getInstance();
      final localData = prefs.getString('mock_parcel');
      List<dynamic> list = [];
      if (localData != null) {
        try {
          final decoded = jsonDecode(localData);
          if (decoded is List) {
            list = decoded;
          }
        } catch (_) {}
      }
      if (list.isEmpty) {
        // Seed initial mock data with a variety of statuses
        list = [
          {
            'id': 'AAA123',
            'trackingNumber': 'TRC-AAA-123',
            'status': 'Received',
            'senderName': 'Ibrahim Nkya',
            'receiverName': 'John Doe',
            'fromAddress': 'Dar es Salaam',
            'toAddress': 'Arusha Station',
            'description': 'Industrial Equipment Spare Parts',
            'price': '45000',
            'createdAt': DateTime.now().toIso8601String(),
            'updatedAt': DateTime.now().toIso8601String(),
          },
          // For Dispatch Screen (Status: Received)
          {
            'id': 'AAA201',
            'trackingNumber': 'TRC-AAA-201',
            'status': 'Received',
            'senderName': 'Michael Chen',
            'receiverName': 'Lucy Liu',
            'fromAddress': 'Tanga Port',
            'toAddress': 'Dar es Salaam',
            'description': 'Electronic Components',
            'price': '28000',
            'createdAt': DateTime.now().toIso8601String(),
          },
          {
            'id': 'AAA202',
            'trackingNumber': 'TRC-AAA-202',
            'status': 'Received',
            'senderName': 'Sarah Juma',
            'receiverName': 'Rajabu Ally',
            'fromAddress': 'Kigoma',
            'toAddress': 'Mwanza',
            'description': 'Fresh Produce (Organic)',
            'price': '12500',
            'createdAt': DateTime.now().toIso8601String(),
          },
          {
            'id': 'AAA203',
            'trackingNumber': 'TRC-AAA-203',
            'status': 'Received',
            'senderName': 'Robert Kim',
            'receiverName': 'David Mwita',
            'fromAddress': 'Arusha',
            'toAddress': 'Dodoma',
            'description': 'Books & Stationery',
            'price': '15000',
            'createdAt': DateTime.now().toIso8601String(),
          },
          {
            'id': 'AAA204',
            'trackingNumber': 'TRC-AAA-204',
            'status': 'Received',
            'senderName': 'Grace Mrema',
            'receiverName': 'Benard Shayo',
            'fromAddress': 'Dar es Salaam',
            'toAddress': 'Tabora',
            'description': 'Computer Hardware',
            'price': '65000',
            'createdAt': DateTime.now().toIso8601String(),
          },
          {
            'id': 'AAA205',
            'trackingNumber': 'TRC-AAA-205',
            'status': 'Received',
            'senderName': 'Ali Hassan',
            'receiverName': 'Fatuma Salum',
            'fromAddress': 'Zanzibar Port',
            'toAddress': 'Dar es Salaam',
            'description': 'Handcrafted Spices',
            'price': '9500',
            'createdAt': DateTime.now().toIso8601String(),
          },
          // For Offload Screen (Status: Dispatched)
          {
            'id': 'AAA301',
            'trackingNumber': 'TRC-AAA-301',
            'status': 'Dispatched',
            'senderName': 'Bakari Juma',
            'receiverName': 'Sarah Kessy',
            'fromAddress': 'Dar es Salaam',
            'toAddress': 'Mwanza Port',
            'description': 'Medical Supplies',
            'price': '32000',
            'createdAt': DateTime.now().toIso8601String(),
          },
          {
            'id': 'AAA302',
            'trackingNumber': 'TRC-AAA-302',
            'status': 'Dispatched',
            'senderName': 'Lilian Masawe',
            'receiverName': 'Peter Mollel',
            'fromAddress': 'Dodoma',
            'toAddress': 'Dar es Salaam',
            'description': 'Textile Materials',
            'price': '18500',
            'createdAt': DateTime.now().toIso8601String(),
          },
          {
            'id': 'AAA303',
            'trackingNumber': 'TRC-AAA-303',
            'status': 'Dispatched',
            'senderName': 'Salum Ally',
            'receiverName': 'Fatuma Rajabu',
            'fromAddress': 'Tanga',
            'toAddress': 'Kigoma',
            'description': 'Agricultural Tools',
            'price': '55000',
            'createdAt': DateTime.now().toIso8601String(),
          },
          {
            'id': 'AAA304',
            'trackingNumber': 'TRC-AAA-304',
            'status': 'Dispatched',
            'senderName': 'Neema Shayo',
            'receiverName': 'Hassan Mwinyi',
            'fromAddress': 'Morogoro',
            'toAddress': 'Mbeya',
            'description': 'Solar Panels',
            'price': '120000',
            'createdAt': DateTime.now().toIso8601String(),
          },
          {
            'id': 'AAA305',
            'trackingNumber': 'TRC-AAA-305',
            'status': 'Dispatched',
            'senderName': 'Joel Mwita',
            'receiverName': 'Alice Temu',
            'fromAddress': 'Moshi',
            'toAddress': 'Dar es Salaam',
            'description': 'Coffee Beans (Samples)',
            'price': '12500',
            'createdAt': DateTime.now().toIso8601String(),
          },
          {
            'id': 'parcel-at-station-001',
            'trackingNumber': 'MZG-2024-STAT',
            'status': 'At Station',
            'fromAddress': 'Dar es Salaam',
            'toAddress': 'Arusha Bus Station',
            'serviceType': 'EXPRESS',
            'parcelType': 'Electronics',
            'parcelSize': 'SMALL',
            'peopleNeeded': 0,
            'receiverName': 'Amina Salehe',
            'receiverPhone': '+255712345678',
            'receiverPays': false,
            'additionalServices': {},
            'pickupType': 'STATION',
            'createdAt': DateTime.now().subtract(const Duration(days: 2)).toIso8601String(),
            'updatedAt': DateTime.now().subtract(const Duration(hours: 4)).toIso8601String(),
          },
        ];
        await prefs.setString('mock_parcel', jsonEncode(list));
      }
      if (status != null) {
        return list.where((item) => item['status'] == status).toList();
      }
      return list;
    }
    final query = status != null ? '?status=$status' : '';
    final res = await _sendWithAutoRefresh(
      method: 'GET',
      url: Uri.parse('$_baseUrl/parcel$query'),
      headers: await _headers,
    );
    return _parseListResponse(res.body);
  }

  static Future<Map<String, dynamic>> createParcel(Map<String, dynamic> data) async {
    if (_useMocks) {
      await Future.delayed(const Duration(milliseconds: 800));
      final prefs = await SharedPreferences.getInstance();
      final localData = prefs.getString('mock_parcel');
      List<dynamic> list = [];
      if (localData != null) {
        try {
          final decoded = jsonDecode(localData);
          if (decoded is List) {
            list = decoded;
          }
        } catch (_) {}
      }
      
      final newId = 'pk-${DateTime.now().millisecondsSinceEpoch}';
      final newParcel = {
        ...data,
        'id': newId,
        'trackingNumber': 'PK-${DateTime.now().year}-${DateTime.now().millisecondsSinceEpoch.toString().substring(8)}',
        'status': 'Pending',
        'createdAt': DateTime.now().toIso8601String(),
        'updatedAt': DateTime.now().toIso8601String(),
      };
      
      list.insert(0, newParcel);
      await prefs.setString('mock_parcel', jsonEncode(list));
      return newParcel;
    }
    final res = await _sendWithAutoRefresh(
      method: 'POST',
      url: Uri.parse('$_baseUrl/parcel'),
      headers: await _headers,
      body: data,
    );
    return _parseResponse(res);
  }

  static Future<Map<String, dynamic>> getParcelById(String id) async {
    if (_useMocks) {
      final prefs = await SharedPreferences.getInstance();
      final localData = prefs.getString('mock_parcel');
      if (localData != null) {
        try {
          final decoded = jsonDecode(localData);
          if (decoded is List) {
            final item = decoded.firstWhere((c) => c['id'] == id, orElse: () => null);
            if (item != null) return item;
          }
        } catch (_) {}
      }
      throw ApiException(message: 'Parcel not found', statusCode: 404);
    }
    final res = await _sendWithAutoRefresh(
      method: 'GET',
      url: Uri.parse('$_baseUrl/parcel/$id'),
      headers: await _headers,
    );
    return _parseResponse(res);
  }

  static Future<Map<String, dynamic>> getParcelStatus(String id) async {
    if (_useMocks) {
      final parcel = await getParcelById(id);
      return {
        'id': id,
        'status': parcel['status'] ?? 'Pending',
        'updatedAt': DateTime.now().toIso8601String(),
      };
    }
    final res = await _sendWithAutoRefresh(
      method: 'GET',
      url: Uri.parse('$_baseUrl/parcel/$id/status'),
      headers: await _headers,
    );
    return _parseResponse(res);
  }

  static Future<Map<String, dynamic>> getParcelReceipt(String id) async {
    if (_useMocks) {
      final parcel = await getParcelById(id);
      return {
        'id': id,
        'trackingNumber': parcel['trackingNumber'] ?? 'PK-MOCK',
        'amount': parcel['price'] ?? '0',
        'paidAt': DateTime.now().toIso8601String(),
        'items': [
          {'description': parcel['packageName'] ?? 'Parcel', 'amount': parcel['price']}
        ]
      };
    }
    final res = await _sendWithAutoRefresh(
      method: 'GET',
      url: Uri.parse('$_baseUrl/parcel/$id/receipt'),
      headers: await _headers,
    );
    return _parseResponse(res);
  }

  // ─── OPERATOR ACTIONS ──────────────────────────────────────────────

  static Future<Map<String, dynamic>> receiveParcel(Map<String, dynamic> data) async {
    if (_useMocks) {
      await Future.delayed(const Duration(milliseconds: 1000));
      final prefs = await SharedPreferences.getInstance();
      final localData = prefs.getString('mock_parcel');
      List<dynamic> list = [];
      if (localData != null) {
        try {
          final decoded = jsonDecode(localData);
          if (decoded is List) {
            list = decoded;
          }
        } catch (_) {}
      }
      
      final newItem = {
        ...data,
        'id': 'op-rec-${DateTime.now().millisecondsSinceEpoch}',
        'trackingNumber': 'REC-${DateTime.now().millisecondsSinceEpoch.toString().substring(8)}',
        'status': 'Received',
        'createdAt': DateTime.now().toIso8601String(),
      };
      
      list.insert(0, newItem);
      await prefs.setString('mock_parcel', jsonEncode(list));
      return newItem;
    }
    final res = await _sendWithAutoRefresh(
      method: 'POST',
      url: Uri.parse('$_baseUrl/parcel/receive'),
      headers: await _headers,
      body: data,
    );
    return _parseResponse(res);
  }

  static Future<Map<String, dynamic>> updateParcelStatus(String id, String status, {String? location}) async {
    if (_useMocks) {
      await Future.delayed(const Duration(milliseconds: 800));
      
      // Special case for demo parcels (AAA...)
      if (id.toUpperCase().startsWith('AAA')) {
        return {
          'id': id.toUpperCase(),
          'status': status,
          'currentLocation': location ?? 'Processing',
          'updatedAt': DateTime.now().toIso8601String(),
        };
      }

      final prefs = await SharedPreferences.getInstance();
      final localData = prefs.getString('mock_parcel');
      if (localData != null) {
        try {
          final decoded = jsonDecode(localData);
          if (decoded is List) {
            final index = decoded.indexWhere((c) => c['id'] == id);
            if (index != -1) {
              decoded[index]['status'] = status;
              if (location != null) decoded[index]['currentLocation'] = location;
              await prefs.setString('mock_parcel', jsonEncode(decoded));
              return decoded[index];
            }
          }
        } catch (_) {}
      }
      throw ApiException(message: 'Parcel not found', statusCode: 404);
    }
    final res = await _sendWithAutoRefresh(
      method: 'PATCH',
      url: Uri.parse('$_baseUrl/parcel/$id/status'),
      headers: await _headers,
      body: {'status': status, 'location': location},
    );
    return _parseResponse(res);
  }

  /// Operator delivers parcel using OTP verification.
  static Future<Map<String, dynamic>> deliverParcel(String id, String otp) async {
    if (_useMocks) {
      await Future.delayed(const Duration(milliseconds: 800));
      
      // Demo Special Cases:
      final Map<String, String> otpMap = {
        'AAA123': '1024',
        'AAA124': '1024',
        'AAA125': '1025',
        'AAA126': '1026',
        'AAA127': '1027',
        'AAA128': '1028',
      };

      if (otpMap.containsKey(id.toUpperCase())) {
        if (otpMap[id.toUpperCase()] == otp) {
          return updateParcelStatus(id, 'Delivered');
        } else {
          throw ApiException(message: 'Incorrect handover code', statusCode: 400);
        }
      }
      
      if (otp == '1024' || otp.length == 4) {
        return updateParcelStatus(id, 'Delivered');
      }
      
      throw ApiException(message: 'Invalid OTP code', statusCode: 400);
    }
    final res = await _sendWithAutoRefresh(
      method: 'POST',
      url: Uri.parse('$_baseUrl/parcel/$id/deliver'),
      headers: await _headers,
      body: {'otp': otp},
    );
    return _parseResponse(res);
  }

  static Future<Map<String, dynamic>> getOperatorStats() async {
    if (_useMocks) {
      await Future.delayed(const Duration(milliseconds: 600));
      return {
        'received': 42,
        'delivered': 34,
        'dispatched': 67,
        'atWarehouse': 22,
      };
    }
    final res = await _sendWithAutoRefresh(
      method: 'GET',
      url: Uri.parse('$_baseUrl/parcel/stats/operator'),
      headers: await _headers,
    );
    return _parseResponse(res);
  }


  /// Search for parcel by tracking ID or parcel ID (operator use).
  static Future<List<dynamic>> searchParcel(String query) async {
    if (_useMocks) {
      await Future.delayed(const Duration(milliseconds: 700));
      final searchId = query.trim().toUpperCase();

      final prefs = await SharedPreferences.getInstance();
      final localData = prefs.getString('mock_parcel');
      List<dynamic> list = [];
      if (localData != null) {
        try {
          final decoded = jsonDecode(localData);
          if (decoded is List) {
            list = decoded;
          }
        } catch (_) {}
      }

      // Check if specific AAA parcel exists in our registry
      final match = list.firstWhere(
        (c) {
          final id = (c['id'] ?? '').toString().toUpperCase();
          final trackingNumber = (c['trackingNumber'] ?? '').toString().toUpperCase();
          return id == searchId || trackingNumber == searchId;
        },
        orElse: () => null,
      );

      if (match != null) {
        return [match];
      }

      // Demo Special Case fallback: if it starts with AAA but isn't in registry yet
      if (searchId.startsWith('AAA')) {
        return [{
          'id': searchId,
          'trackingNumber': 'TRC-$searchId',
          'senderName': 'TRC Logistics',
          'senderPhone': '255712345678',
          'receiverName': 'Demo Receiver',
          'receiverPhone': '255787654321',
          'fromAddress': 'Dar es Salaam',
          'toAddress': 'Arusha Station',
          'description': 'Demo Shipment Content',
          'status': 'At Station',
          'price': '45000',
          'parcelType': 'General',
          'parcelSize': 'MEDIUM',
          'createdAt': DateTime.now().toIso8601String(),
          'updatedAt': DateTime.now().toIso8601String(),
        }];
      }

      if (list.isNotEmpty) {
        final lower = query.toLowerCase();
        return list.where((c) {
          final id = (c['id'] ?? '').toString().toLowerCase();
          final trackingNumber = (c['trackingNumber'] ?? '').toString().toLowerCase();
          return id.contains(lower) || trackingNumber.contains(lower);
        }).toList();
      }
      return [];
    }
    final res = await _sendWithAutoRefresh(
      method: 'GET',
      url: Uri.parse('$_baseUrl/parcel/search?q=${Uri.encodeComponent(query)}'),
      headers: await _headers,
    );
    return _parseListResponse(res.body);
  }


  // ─── PAYMENTS ──────────────────────────────────────────────────────

  /// Fetch live payment channels from the MySafari gateway (via our backend proxy).
  static Future<List<dynamic>> getPaymentChannels() async {
    final res = await _sendWithAutoRefresh(
      method: 'GET',
      url: Uri.parse('$_baseUrl/payments/providers'),
      headers: await _headers,
    );
    if (res.statusCode >= 200 && res.statusCode < 300) {
      return _parseListResponse(res.body);
    }
    throw ApiException(message: 'Failed to load channels', statusCode: res.statusCode);
  }

  static Future<Map<String, dynamic>> initiatePayment({
    required String parcelId,
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
        'parcelId': parcelId,
      };
    }
    final res = await _sendWithAutoRefresh(
      method: 'POST',
      url: Uri.parse('$_baseUrl/payments/initiate-push'),
      headers: await _headers,
      body: {
        'parcelId': parcelId,
        'paymentChannel': provider,
        'phoneNumber': phone,
      },
    );
    return _parseResponse(res);
  }

  static Future<Map<String, dynamic>> pollPaymentStatus(String paymentId) async {
    if (_useMocks) {
      await Future.delayed(const Duration(milliseconds: 1000));
      return {
        'id': paymentId,
        'status': 'Completed',
        'amount': 35000.0,
        'provider': 'M-Pesa',
        'transactionReference': 'TXN${DateTime.now().millisecondsSinceEpoch}',
        'parcelStatus': 'Paid',
      };
    }
    final res = await _sendWithAutoRefresh(
      method: 'GET',
      url: Uri.parse('$_baseUrl/payments/status/$paymentId'),
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
    return _parseListResponse(res.body);
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
      ];
    }
    final res = await _sendWithAutoRefresh(
      method: 'GET',
      url: Uri.parse('$_baseUrl/auth/sessions'),
      headers: await _headers,
    );
    return _parseListResponse(res.body);
  }

  // ─── NOTIFICATIONS ─────────────────────────────────────────────────

  static Future<List<dynamic>> getNotifications() async {
    final res = await _sendWithAutoRefresh(
      method: 'GET',
      url: Uri.parse('$_baseUrl/notifications'),
      headers: await _headers,
    );
    return _parseListResponse(res.body);
  }

  static Future<Uint8List> downloadReceiptPdf(String parcelId) async {
    final res = await _sendWithAutoRefresh(
      method: 'GET',
      url: Uri.parse('$_baseUrl/parcel/$parcelId/receipt/pdf'),
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
    String errorMsg = 'Unknown error';
    if (body is Map && body.containsKey('error')) {
      final err = body['error'];
      if (err is Map && err.containsKey('message')) {
        errorMsg = err['message'].toString();
      } else {
        errorMsg = err.toString();
      }
    }
    throw ApiException(
      message: errorMsg,
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
