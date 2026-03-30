import 'package:flutter/foundation.dart';
import '../models/cargo_model.dart';
import '../services/api_service.dart';

class CargoProvider extends ChangeNotifier {
  List<CargoModel> _cargo = [];
  bool _loading = false;
  String? _error;

  Map<String, int> _operatorStats = {
    'received': 0,
    'delivered': 0,
    'sent': 0,
    'atWarehouse': 0,
  };

  List<CargoModel> get cargo => _cargo;
  bool get loading => _loading;
  String? get error => _error;
  Map<String, int> get operatorStats => _operatorStats;

  Future<void> fetchMyCargo({String? status}) async {
    _loading = true;
    _error = null;
    notifyListeners();
    try {
      final data = await ApiService.getCargo(status: status);
      _cargo = data.map((j) => CargoModel.fromJson(j)).toList();
    } on ApiException catch (e) {
      _error = e.message;
    } finally {
      _loading = false;
      notifyListeners();
    }
  }

  Future<CargoModel?> createCargo(Map<String, dynamic> data) async {
    _loading = true;
    _error = null;
    notifyListeners();
    try {
      final json = await ApiService.createCargo(data);
      final newCargo = CargoModel.fromJson(json);
      _cargo.insert(0, newCargo);
      notifyListeners();
      return newCargo;
    } on ApiException catch (e) {
      _error = e.message;
      return null;
    } catch (e) {
      _error = e.toString();
      return null;
    } finally {
      _loading = false;
      notifyListeners();
    }
  }

  Future<Map<String, dynamic>?> pollStatus(String id) async {
    try {
      return await ApiService.getCargoStatus(id);
    } catch (_) {
      return null;
    }
  }

  Future<Map<String, dynamic>?> initiatePayment({
    required String cargoId,
    required String provider,
    String? phone,
  }) async {
    _loading = true;
    _error = null;
    notifyListeners();
    try {
      final result = await ApiService.initiatePayment(
        cargoId: cargoId, 
        provider: provider, 
        phone: phone ?? '',
      );
      return result;
    } on ApiException catch (e) {
      _error = e.message;
      return null;
    } finally {
      _loading = false;
      notifyListeners();
    }
  }

  Future<Map<String, dynamic>?> getReceipt(String cargoId) async {
    try {
      return await ApiService.getCargoReceipt(cargoId);
    } on ApiException catch (e) {
      _error = e.message;
      return null;
    }
  }

  Future<void> fetchOperatorStats() async {
    _loading = true;
    _error = null;
    notifyListeners();
    try {
      final stats = await ApiService.getOperatorStats();
      _operatorStats = {
        'received': (stats['received'] as num?)?.toInt() ?? 0,
        'delivered': (stats['delivered'] as num?)?.toInt() ?? 0,
        'sent': (stats['sent'] as num?)?.toInt() ?? 0,
        'atWarehouse': (stats['atWarehouse'] as num?)?.toInt() ?? 0,
      };
    } on ApiException catch (e) {
      _error = e.message;
    } finally {
      _loading = false;
      notifyListeners();
    }
  }

  Future<List<Map<String, dynamic>>> getNotifications() async {
    try {
      final raw = await ApiService.getNotifications();
      return raw.cast<Map<String, dynamic>>();
    } on ApiException catch (e) {
      _error = e.message;
      return [];
    }
  }
}
