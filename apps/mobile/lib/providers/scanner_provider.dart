import 'package:flutter/foundation.dart';
import '../models/parcel_model.dart';
import '../models/operation_model.dart';
import '../services/api_service.dart';

class ScannerProvider extends ChangeNotifier {
  bool _loading = false;
  String? _error;
  ParcelModel? _scannedParcel;
  ParcelOperation? _currentOperation;

  bool get loading => _loading;
  String? get error => _error;
  ParcelModel? get scannedParcel => _scannedParcel;
  ParcelOperation? get currentOperation => _currentOperation;

  void setOperation(ParcelOperation operation) {
    _currentOperation = operation;
    _scannedParcel = null;
    _error = null;
    notifyListeners();
  }

  Future<bool> processCode(String code) async {
    _loading = true;
    _error = null;
    _scannedParcel = null;
    notifyListeners();

    try {
      // 1. Search for parcel
      final results = await ApiService.searchParcel(code);
      if (results.isEmpty) {
        _error = 'No parcel found with this ID or Tracking number.';
        return false;
      }

      // 2. Take the first match
      final parcel = ParcelModel.fromJson(results.first);
      _scannedParcel = parcel;

      // Operation (dispatch/offload/deliver/cancel) is confirmed from the details screen.
      return true;
    } on ApiException catch (e) {
      _error = e.message;
      return false;
    } catch (e) {
      _error = 'An unexpected error occurred: $e';
      return false;
    } finally {
      _loading = false;
      notifyListeners();
    }
  }

  void reset() {
    _scannedParcel = null;
    _error = null;
    _loading = false;
    notifyListeners();
  }
}
