import 'package:flutter/foundation.dart';
import '../models/parcel_model.dart';
import '../services/api_service.dart';

class ParcelProvider extends ChangeNotifier {
  List<ParcelModel> _parcels = [];
  bool _loading = false;
  String? _error;

  Map<String, int> _operatorStats = {
    'received': 0,
    'delivered': 0,
    'dispatched': 0,
    'atWarehouse': 0,
  };

  List<ParcelModel> get parcels => _parcels;
  bool get loading => _loading;
  String? get error => _error;
  Map<String, int> get operatorStats => _operatorStats;

  Future<void> fetchMyParcels({String? status}) async {
    _loading = true;
    _error = null;
    notifyListeners();
    try {
      final data = await ApiService.getParcels(status: status);
      _parcels = data.map((j) => ParcelModel.fromJson(j)).toList();
    } on ApiException catch (e) {
      _error = e.message;
    } finally {
      _loading = false;
      notifyListeners();
    }
  }

  Future<ParcelModel?> createParcel(Map<String, dynamic> data) async {
    _loading = true;
    _error = null;
    notifyListeners();
    try {
      final json = await ApiService.createParcel(data);
      final newParcel = ParcelModel.fromJson(json);
      _parcels.insert(0, newParcel);
      notifyListeners();
      return newParcel;
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
      return await ApiService.getParcelStatus(id);
    } catch (_) {
      return null;
    }
  }

  Future<Map<String, dynamic>?> initiatePayment({
    required String parcelId,
    required String provider,
    String? phone,
  }) async {
    _loading = true;
    _error = null;
    notifyListeners();
    try {
      final result = await ApiService.initiatePayment(
        parcelId: parcelId, 
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

  Future<Map<String, dynamic>?> getReceipt(String parcelId) async {
    try {
      return await ApiService.getParcelReceipt(parcelId);
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
      final res = await ApiService.getOperatorStats();
      final stats = res['data'] ?? res;
      _operatorStats = {
        'received': (stats['received'] as num?)?.toInt() ?? 0,
        'delivered': (stats['delivered'] as num?)?.toInt() ?? 0,
        'in_transit': (stats['sent'] as num?)?.toInt() ?? 0,
        'dispatched': (stats['sent'] as num?)?.toInt() ?? 0,
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
