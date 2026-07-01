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
  
  // OTP Security
  int _resendAttempts = 0;
  DateTime? _lastResendAt;
  static const int maxResendPerDay = 3;
  
  // Progressive intervals in seconds: 60, 180, 600
  static const List<int> _resendIntervals = [60, 180, 600];

  AuthStatus get status => _status;
  UserModel? get user => _user;
  String? get error => _error;
  bool get loading => _loading;
  bool get mustChangeOtp => _mustChangeOtp;
  bool get isAuthenticated => _status == AuthStatus.authenticated;

  AuthProvider() {
    _checkAuth();
  }

  bool _isFirstTime = false;
  bool get isFirstTime => _isFirstTime;

  Future<void> _checkAuth() async {
    final prefs = await SharedPreferences.getInstance();
    final token = await _storage.read(key: 'jwt_token');
    final userData = await _storage.read(key: 'user_data');
    await Future.delayed(const Duration(milliseconds: 2500));

    _isFirstTime = !(prefs.getBool('has_seen_onboarding') ?? false);
    
    // Load OTP resend persistence
    _resendAttempts = prefs.getInt('otp_resend_attempts') ?? 0;
    final lastResendTs = prefs.getInt('otp_last_resend_ts');
    if (lastResendTs != null) {
      _lastResendAt = DateTime.fromMillisecondsSinceEpoch(lastResendTs);
      
      // Reset daily attempts if it's a new day
      final now = DateTime.now();
      if (now.day != _lastResendAt!.day || now.month != _lastResendAt!.month || now.year != _lastResendAt!.year) {
        _resendAttempts = 0;
        await prefs.setInt('otp_resend_attempts', 0);
      }
    }
    
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
      final now = DateTime.now();
      
      // Reset daily attempts if it's a new day (naive implementation)
      if (_lastResendAt != null && now.day != _lastResendAt!.day) {
        _resendAttempts = 0;
      }

      // Check progressive interval
      if (_lastResendAt != null) {
        final intervalIndex = (_resendAttempts - 1).clamp(0, _resendIntervals.length - 1);
        final requiredInterval = _resendIntervals[intervalIndex];
        final secondsSinceLast = now.difference(_lastResendAt!).inSeconds;
        
        if (secondsSinceLast < requiredInterval) {
          final waitMore = requiredInterval - secondsSinceLast;
          _error = "Please wait $waitMore more seconds before requesting another OTP.";
          return false;
        }
      }

      await ApiService.sendOperatorOtp(phone);
      
      _resendAttempts++;
      _lastResendAt = now;
      
      final prefs = await SharedPreferences.getInstance();
      await prefs.setInt('otp_resend_attempts', _resendAttempts);
      await prefs.setInt('otp_last_resend_ts', now.millisecondsSinceEpoch);
      
      return true;
    } on ApiException catch (e) {
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

  Future<bool> login(String email, String password) async {
    _loading = true;
    _error = null;
    notifyListeners();
    try {
      await ApiService.login(email, password);
      return false;
    } on ApiException catch (e) {
      _error = e.message;
      _status = AuthStatus.unauthenticated;
      return false;
    } finally {
      _loading = false;
      notifyListeners();
    }
  }

  Future<bool> register({
    required String name,
    required String email,
    required String password,
    String? phone,
  }) async {
    _loading = true;
    _error = null;
    notifyListeners();
    try {
      await ApiService.register(
        name: name, email: email, password: password, phone: phone,
      );
      return false;
    } on ApiException catch (e) {
      _error = e.message;
      return false;
    } finally {
      _loading = false;
      notifyListeners();
    }
  }

  Future<Map<String, dynamic>?> initiateForgotPassword(String identifier, bool isPhone) async {
    _loading = true;
    _error = null;
    notifyListeners();
    try {
      final data = await ApiService.forgotPassword(identifier, isPhone);
      return data;
    } on ApiException catch (e) {
      _error = e.message;
      return null;
    } finally {
      _loading = false;
      notifyListeners();
    }
  }

  Future<bool> completePasswordReset({
    required String identifier,
    required bool isPhone,
    required String code,
    required String newPassword,
  }) async {
    _loading = true;
    _error = null;
    notifyListeners();
    try {
      await ApiService.resetPassword(
        identifier: identifier,
        isPhone: isPhone,
        code: code,
        newPassword: newPassword,
      );
      return true;
    } on ApiException catch (e) {
      _error = e.message;
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

  Future<bool> changePassword({
    required String currentPassword,
    required String newPassword,
  }) async {
    _loading = true;
    _error = null;
    notifyListeners();
    try {
      await ApiService.changePassword(
        currentPassword: currentPassword,
        newPassword: newPassword,
      );
      return true;
    } on ApiException catch (e) {
      _error = e.message;
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
    final userPayload = userJson ??
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
        };

    _user = UserModel.fromJson(userPayload);
    await _storage.write(key: 'user_data', value: jsonEncode(userPayload));
  }
}
