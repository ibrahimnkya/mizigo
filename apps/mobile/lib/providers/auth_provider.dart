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
    // Simulated check: In a real app, this would call ApiService.checkPhone(phone)
    await Future.delayed(const Duration(milliseconds: 800));
    
    // For demo: any number of sufficient length is valid
    final bool isValid = phone.length >= 9;
    
    if (isValid) {
      return {
        'available': true,
        'name': phone.contains('712345678') ? 'Jackson' : 'Operator',
      };
    }
    
    return {
      'available': false,
      'name': null,
    };
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

      // In a real app, call ApiService.sendOtp(phone)
      await Future.delayed(const Duration(seconds: 1));
      
      _resendAttempts++;
      _lastResendAt = now;
      
      final prefs = await SharedPreferences.getInstance();
      await prefs.setInt('otp_resend_attempts', _resendAttempts);
      await prefs.setInt('otp_last_resend_ts', now.millisecondsSinceEpoch);
      
      return true;
    } catch (e) {
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
    notifyListeners();

    try {
      // In a real app, call ApiService.verifyOtp(phone, code)
      await Future.delayed(const Duration(seconds: 1));
      
      if (code == "123456") {
        // Mock successful login for specific code
        // Normally the verify API would return user data/token
        final mockData = {
          'token': 'mock_operator_token',
          'user': {
            'id': 'op_1',
            'name': 'Operator Mike',
            'email': 'mike@mizigo.com',
            'phone': phone,
            'role': 'OPERATOR',
            'avatar_url': null,
          }
        };
        await _saveSession(mockData);
        _status = AuthStatus.authenticated;
        return true;
      } else {
        _error = "Invalid OTP code. Please try again.";
        return false;
      }
    } catch (e) {
      _error = "Verification failed.";
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
      final data = await ApiService.login(email, password);
      await _saveSession(data);
      _status = AuthStatus.authenticated;
      return true;
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
      final data = await ApiService.register(
        name: name, email: email, password: password, phone: phone,
      );
      await _saveSession(data);
      _status = AuthStatus.authenticated;
      return true;
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

  /// Update basic user profile information locally
  Future<void> updateProfile({String? name, String? phone}) async {
    if (_user == null) return;
    _user = _user!.copyWith(name: name, phone: phone);
    await _storage.write(
      key: 'user_data',
      value: jsonEncode(_user!.toJson()),
    );
    notifyListeners();
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

  Future<void> _saveSession(Map<String, dynamic> data) async {
    final token = data['token'] as String?;
    final userJson = data['user'] as Map<String, dynamic>?;
    if (token != null) await ApiService.saveToken(token);
    if (userJson != null) {
      _user = UserModel.fromJson(userJson);
      await _storage.write(key: 'user_data', value: jsonEncode(userJson));
    }
  }
}
