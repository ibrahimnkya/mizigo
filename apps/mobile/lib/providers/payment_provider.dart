import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PaymentMethod {
  final String id;
  final String type; // 'Mobile Money', 'Visa', etc.
  final String details; // 'M-Pesa •••• 4567', etc.
  final bool isDefault;

  PaymentMethod({
    required this.id,
    required this.type,
    required this.details,
    this.isDefault = false,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'type': type,
        'details': details,
        'isDefault': isDefault,
      };

  factory PaymentMethod.fromJson(Map<String, dynamic> json) => PaymentMethod(
        id: json['id'],
        type: json['type'],
        details: json['details'],
        isDefault: json['isDefault'] ?? false,
      );
}

class PaymentProvider extends ChangeNotifier {
  List<PaymentMethod> _methods = [];
  List<PaymentMethod> get methods => _methods;

  PaymentProvider() {
    _loadMethods();
  }

  Future<void> _loadMethods() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getStringList('payment_methods');
    if (data != null) {
      _methods = data.map((e) => PaymentMethod.fromJson(jsonDecode(e))).toList();
    } else {
      // Add default dummy data if completely empty
      _methods = [
        PaymentMethod(
          id: '1',
          type: 'Mobile Money',
          details: 'M-Pesa •••• 4567',
          isDefault: true,
        ),
      ];
    }
    notifyListeners();
  }

  Future<void> addMethod(PaymentMethod method) async {
    if (_methods.isEmpty) {
      _methods.add(PaymentMethod(
        id: method.id,
        type: method.type,
        details: method.details,
        isDefault: true,
      ));
    } else {
      _methods.add(method);
    }
    await _saveMethods();
    notifyListeners();
  }

  Future<void> _saveMethods() async {
    final prefs = await SharedPreferences.getInstance();
    final data = _methods.map((e) => jsonEncode(e.toJson())).toList();
    await prefs.setStringList('payment_methods', data);
  }
}
