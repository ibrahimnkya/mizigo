import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../models/user_model.dart';
import '../services/api_service.dart';

enum AuthStatus { unknown, authenticated, unauthenticated }

class AuthProvider extends ChangeNotifier {
  static const _storage = FlutterSecureStorage();
  
  AuthStatus _status = AuthStatus.unknown;
  UserModel? _user;
  String? _error;
  bool _loading = false;
  bool _mustChangeOtp = false;
  
  // Forgot-PIN SMS limits are enforced by the server (cooldown + hourly/daily
  // caps per number). We remember the server's "retry after" per number so the
  // UI can show a countdown, also across app restarts, without spending a request.
  static const _otpBlockedKey = 'otp_blocked_until';
  static const _otpCooldown = Duration(seconds: 60); // matches server default
  final Map<String, DateTime> _otpBlockedUntil = {};

  /// Seconds before another code can be requested for [phone] (0 = now).
  int otpWaitSeconds(String phone) {
    final until = _otpBlockedUntil[phone];
    if (until == null) return 0;
    final left = until.difference(DateTime.now()).inSeconds;
    return left > 0 ? left + 1 : 0;
  }

  Future<void> _blockOtp(String phone, Duration wait) async {
    _otpBlockedUntil[phone] = DateTime.now().add(wait);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(
      _otpBlockedKey,
      jsonEncode(_otpBlockedUntil.map((k, v) => MapEntry(k, v.millisecondsSinceEpoch))),
    );
  }

  static String _formatWait(int seconds) {
    if (seconds < 60) return '$seconds second${seconds == 1 ? '' : 's'}';
    final minutes = (seconds / 60).ceil();
    if (minutes < 60) return '$minutes minute${minutes == 1 ? '' : 's'}';
    final hours = (minutes / 60).ceil();
    return '$hours hour${hours == 1 ? '' : 's'}';
  }

  AuthStatus get status => _status;
  UserModel? get user => _user;
  String? get error => _error;
  bool get loading => _loading;
  bool get mustChangeOtp => _mustChangeOtp;
  bool get isAuthenticated => _status == AuthStatus.authenticated;

  AuthProvider() {
    // Session revoked/expired server-side: sign out rather than keep showing a
    // signed-in app whose requests all fail.
    ApiService.onSessionExpired = () {
      if (_status != AuthStatus.authenticated) return;
      _sessionExpired = true;
      logout();
    };
    _checkAuth();
  }

  bool _sessionExpired = false;

  /// True once after a forced sign-out; the login screen reads and clears it.
  bool consumeSessionExpired() {
    final v = _sessionExpired;
    _sessionExpired = false;
    return v;
  }

  /// Fires only when something the router's redirect depends on changes
  /// (status, first-run, forced PIN change). Using the provider itself as the
  /// router's refreshListenable would re-run routing on every `loading` toggle,
  /// which can discard a screen pushed right after an async call finishes.
  final ChangeNotifier routerRefresh = ChangeNotifier();
  (AuthStatus, bool, bool)? _lastRouteState;

  @override
  void notifyListeners() {
    super.notifyListeners();
    final routeState = (_status, _isFirstTime, _mustChangeOtp);
    if (routeState != _lastRouteState) {
      _lastRouteState = routeState;
      // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
      routerRefresh.notifyListeners();
    }
  }

  @override
  void dispose() {
    routerRefresh.dispose();
    super.dispose();
  }

  bool _isFirstTime = false;
  bool get isFirstTime => _isFirstTime;

  Future<void> _checkAuth() async {
    final prefs = await SharedPreferences.getInstance();
    final token = await _storage.read(key: 'jwt_token');
    final userData = await _storage.read(key: 'user_data');

    _isFirstTime = !(prefs.getBool('has_seen_onboarding') ?? false);
    
    // Restore per-number code-request cooldowns (drop expired ones).
    try {
      final raw = prefs.getString(_otpBlockedKey);
      if (raw != null) {
        final now = DateTime.now();
        (jsonDecode(raw) as Map<String, dynamic>).forEach((phone, ms) {
          final until = DateTime.fromMillisecondsSinceEpoch((ms as num).toInt());
          if (until.isAfter(now)) _otpBlockedUntil[phone] = until;
        });
      }
    } catch (_) {}
    
    if (token != null && userData != null) {
      _user = UserModel.fromJson(jsonDecode(userData));
      _status = AuthStatus.authenticated;
    } else {
      _status = AuthStatus.unauthenticated;
    }
    notifyListeners();
  }

  Future<void> completeOnboarding() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('has_seen_onboarding', true);
    _isFirstTime = false;
    notifyListeners();
  }

  Future<Map<String, dynamic>?> checkPhoneNumberAvailability(String phone) async {
    try {
      final response = await ApiService.checkPhone(phone);
      final payload = (response['data'] is Map<String, dynamic>)
          ? response['data'] as Map<String, dynamic>
          : response;
      return {
        'available': payload['available'] as bool? ?? false,
        'name': payload['name'] as String?,
      };
    } catch (_) {
      return {
        'available': false,
        'name': null,
      };
    }
  }

  Future<bool> sendOtp(String phone) async {
    _loading = true;
    _error = null;
    notifyListeners();

    try {
      // Known to be blocked: don't spend a request (or an SMS).
      final wait = otpWaitSeconds(phone);
      if (wait > 0) {
        _error = 'Too many code requests. Try again in ${_formatWait(wait)}.';
        return false;
      }

      await ApiService.sendOperatorOtp(phone);
      await _blockOtp(phone, _otpCooldown);
      return true;
    } on ApiException catch (e) {
      final retryAfter = e.retryAfterSeconds;
      if (e.statusCode == 429 && retryAfter != null && retryAfter > 0) {
        await _blockOtp(phone, Duration(seconds: retryAfter));
      }
      _error = e.message;
      return false;
    } catch (_) {
      _error = "Failed to send OTP. Please try again.";
      return false;
    } finally {
      _loading = false;
      notifyListeners();
    }
  }

  Future<bool> verifyOtp(String phone, String code) async {
    _loading = true;
    _error = null;
    _mustChangeOtp = false;
    notifyListeners();

    try {
      final data = await ApiService.loginOperatorWithOtp(phone: phone, otp: code);
      final payload = (data['data'] is Map<String, dynamic>)
          ? data['data'] as Map<String, dynamic>
          : data;
      _mustChangeOtp = payload['mustChangeOtp'] as bool? ?? false;
      await _saveSession(data, fallbackPhone: phone);
      _status = AuthStatus.authenticated;
      return true;
    } on ApiException catch (e) {
      _error = e.message;
      return false;
    } catch (_) {
      _error = "Verification failed.";
      return false;
    } finally {
      _loading = false;
      notifyListeners();
    }
  }

  Future<bool> changeOperatorOtp(String newOtp) async {
    _loading = true;
    _error = null;
    notifyListeners();
    try {
      final data = await ApiService.changeOperatorOtp(newOtp);
      _mustChangeOtp = false;
      await _saveSession(data);
      notifyListeners();
      return true;
    } on ApiException catch (e) {
      _error = e.message;
      return false;
    } catch (_) {
      _error = "Failed to update Safety PIN. Please try again.";
      return false;
    } finally {
      _loading = false;
      notifyListeners();
    }
  }

  /// Persist a locally-picked avatar path (no backend upload yet).
  Future<void> saveAvatarPath(String path) async {
    if (_user == null) return;
    _user = _user!.copyWith(avatarUrl: path);
    await _storage.write(
      key: 'user_data',
      value: jsonEncode(_user!.toJson()),
    );
    notifyListeners();
  }

  /// Update basic user profile information locally and on backend
  Future<bool> updateProfile({String? name, String? phone}) async {
    if (_user == null) return false;
    _loading = true;
    _error = null;
    notifyListeners();
    try {
      final res = await ApiService.updateProfile(name: name, phone: phone);
      final payload = (res['data'] is Map<String, dynamic>)
          ? res['data'] as Map<String, dynamic>
          : res;
      final userPayload = {
        'id': (payload['id'] ?? _user!.id).toString(),
        'name': (payload['name'] ?? name ?? _user!.name).toString(),
        'email': (payload['email'] ?? _user!.email).toString(),
        'phone': payload['phone'] ?? phone ?? _user!.phone,
        'role': payload['role'] is Map<String, dynamic>
            ? (payload['role']['name'] ?? _user!.role).toString()
            : (payload['role'] ?? _user!.role).toString(),
        'station': payload['station'] is Map<String, dynamic>
            ? (payload['station']['name'] ?? _user!.station).toString()
            : (payload['station'] ?? _user!.station).toString(),
        'stationId': payload['stationId'] ?? (payload['station'] is Map<String, dynamic> ? payload['station']['id'] : null) ?? _user!.stationId,
      };

      _user = UserModel.fromJson(userPayload);
      await _storage.write(
        key: 'user_data',
        value: jsonEncode(userPayload),
      );
      notifyListeners();
      return true;
    } on ApiException catch (e) {
      _error = e.message;
      return false;
    } catch (e) {
      _error = "An error occurred while updating profile.";
      return false;
    } finally {
      _loading = false;
      notifyListeners();
    }
  }

  Future<void> logout() async {
    await ApiService.clearToken();
    await _storage.delete(key: 'user_data');
    _user = null;
    _status = AuthStatus.unauthenticated;
    notifyListeners();
  }

  Future<void> _saveSession(Map<String, dynamic> data, {String? fallbackPhone}) async {
    final payload = (data['data'] is Map<String, dynamic>)
        ? data['data'] as Map<String, dynamic>
        : data;
    final token = payload['token'] as String?;
    final refreshToken = payload['refreshToken'] as String?;
    final userJson = payload['user'] as Map<String, dynamic>?;
    if (token != null && refreshToken != null) {
      await ApiService.saveSessionTokens(token: token, refreshToken: refreshToken);
    } else if (token != null) {
      await ApiService.saveToken(token);
    }
    final userPayload = Map<String, dynamic>.from(userJson ??
        {
          'id': (payload['id'] ?? payload['userId'] ?? '').toString(),
          'name': (payload['name'] ?? 'User').toString(),
          'email': (payload['email'] ?? '').toString(),
          'phone': payload['phone'] ?? fallbackPhone,
          'role': (payload['role'] ?? '').toString(),
          'station': payload['assignedStation'] is Map<String, dynamic>
              ? (payload['assignedStation']['name'] ?? '').toString()
              : null,
          'stationId': payload['stationId'] ?? (payload['assignedStation'] is Map<String, dynamic> ? payload['assignedStation']['id'] : null),
        });
    // organizationId may only be present at the top level of the auth
    // response even when a nested `user` object is returned.
    userPayload['organizationId'] ??= payload['organizationId'];

    _user = UserModel.fromJson(userPayload);
    await _storage.write(key: 'user_data', value: jsonEncode(userPayload));
  }
}
