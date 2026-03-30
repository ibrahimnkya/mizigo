import 'package:flutter/foundation.dart';
import '../models/cargo_model.dart';
import '../models/operation_model.dart';
import '../services/api_service.dart';

class ScannerProvider extends ChangeNotifier {
  bool _loading = false;
  String? _error;
  CargoModel? _scannedCargo;
  ParcelOperation? _currentOperation;

  bool get loading => _loading;
  String? get error => _error;
  CargoModel? get scannedCargo => _scannedCargo;
  ParcelOperation? get currentOperation => _currentOperation;

  void setOperation(ParcelOperation operation) {
    _currentOperation = operation;
    _scannedCargo = null;
    _error = null;
    notifyListeners();
  }

  Future<bool> processCode(String code) async {
    _loading = true;
    _error = null;
    _scannedCargo = null;
    notifyListeners();

    try {
      // 1. Search for cargo
      final results = await ApiService.searchCargo(code);
      if (results.isEmpty) {
        _error = 'No cargo found with this ID or Tracking number.';
        return false;
      }

      // 2. Take the first match
      final cargo = CargoModel.fromJson(results.first);
      _scannedCargo = cargo;

      // 3. Perform operation-specific logic if needed
      // For now, we just fetch it. The actual state change (Dispatch/Offload/Deliver)
      // will be triggered from the search/scan result.
      
      // If the operation is dispatch, we mark it as 'In Transit'
      // If offload, 'At Warehouse'
      // If deliver, 'Completed'
      
      String? newStatus;
      switch (_currentOperation) {
        case ParcelOperation.dispatch:
          newStatus = 'In Transit';
          break;
        case ParcelOperation.offload:
          newStatus = 'At Warehouse';
          break;
        case ParcelOperation.deliver:
          newStatus = 'Completed';
          break;
        default:
          break;
      }

      if (newStatus != null) {
        await ApiService.updateCargoStatus(cargo.id, newStatus);
        // Refresh scanned cargo with new status
        final updatedJson = await ApiService.getCargoById(cargo.id);
        _scannedCargo = CargoModel.fromJson(updatedJson);
      }

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
    _scannedCargo = null;
    _error = null;
    _loading = false;
    notifyListeners();
  }
}
