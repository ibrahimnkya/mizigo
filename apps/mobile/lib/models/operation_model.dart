enum ParcelOperation {
  dispatch, // Send to station
  offload,  // Offload at station
  deliver,  // Deliver to recipient
  view      // Just track/view details
}

extension ParcelOperationExtension on ParcelOperation {
  String get displayLabel {
    switch (this) {
      case ParcelOperation.dispatch: return 'Dispatch Parcel';
      case ParcelOperation.offload: return 'Offload Parcel';
      case ParcelOperation.deliver: return 'Deliver Parcel';
      case ParcelOperation.view: return 'Track Parcel';
    }
  }

  String get successMessage {
    switch (this) {
      case ParcelOperation.dispatch: return 'Parcel dispatched successfully';
      case ParcelOperation.offload: return 'Parcel offloaded successfully';
      case ParcelOperation.deliver: return 'Parcel delivered successfully';
      case ParcelOperation.view: return 'Parcel found';
    }
  }
}
