enum ParcelOperation {
  dispatch, // Send to station
  offload,  // Offload at station
  deliver,  // Deliver to recipient
  view      // Just track/view details
}

extension ParcelOperationExtension on ParcelOperation {
  String get displayLabel {
    switch (this) {
      case ParcelOperation.dispatch: return 'Dispatch Cargo';
      case ParcelOperation.offload: return 'Offload Cargo';
      case ParcelOperation.deliver: return 'Deliver Cargo';
      case ParcelOperation.view: return 'Track Cargo';
    }
  }

  String get successMessage {
    switch (this) {
      case ParcelOperation.dispatch: return 'Cargo dispatched successfully';
      case ParcelOperation.offload: return 'Cargo offloaded successfully';
      case ParcelOperation.deliver: return 'Cargo delivered successfully';
      case ParcelOperation.view: return 'Cargo found';
    }
  }
}
