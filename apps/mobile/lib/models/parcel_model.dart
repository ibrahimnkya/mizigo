enum ParcelStatus {
  received,
  dispatched,
  offloaded,
  inTransit,
  atStation,
  delivered,
  canceled;

  static ParcelStatus fromString(String value) {
    switch (value.toUpperCase()) {
      case 'RECEIVED':
      case 'PENDING': return ParcelStatus.received;
      case 'DISPATCHED':
      case 'SENT': return ParcelStatus.dispatched;
      case 'OFFLOADED': return ParcelStatus.offloaded;
      case 'IN TRANSIT':
      case 'IN_TRANSIT': return ParcelStatus.inTransit;
      case 'AT STATION':
      case 'AT_STATION':
      case 'AT WAREHOUSE': return ParcelStatus.atStation;
      case 'DELIVERED':
      case 'COMPLETED': return ParcelStatus.delivered;
      case 'CANCELED':
      case 'CANCELLED':
      case 'REJECTED': return ParcelStatus.canceled;
      default: return ParcelStatus.received;
    }
  }

  String get displayLabel {
    switch (this) {
      case ParcelStatus.received: return 'Received';
      case ParcelStatus.dispatched: return 'Dispatched';
      case ParcelStatus.offloaded: return 'Offloaded';
      case ParcelStatus.inTransit: return 'In Transit';
      case ParcelStatus.atStation: return 'At Station';
      case ParcelStatus.delivered: return 'Delivered';
      case ParcelStatus.canceled: return 'Canceled';
    }
  }
}

class PaymentModel {
  final String id;
  final double amount;
  final String? paymentMethod;
  final String status;
  final String? transactionReference;
  final DateTime? paidAt;

  PaymentModel({
    required this.id,
    required this.amount,
    required this.status,
    this.paymentMethod,
    this.transactionReference,
    this.paidAt,
  });

  factory PaymentModel.fromJson(Map<String, dynamic> json) {
    return PaymentModel(
      id: json['id'] ?? '',
      amount: (json['amount'] ?? 0).toDouble(),
      status: json['status'] ?? '',
      paymentMethod: json['paymentMethod'],
      transactionReference: json['transactionReference'],
      paidAt: json['paidAt'] != null ? DateTime.parse(json['paidAt']) : null,
    );
  }
}

class ParcelModel {
  final String id;
  final String? trackingNumber;
  final String fromAddress;
  final String toAddress;
  final String pickupType;
  final String serviceType;
  final int peopleNeeded;
  final String parcelType;
  final String parcelSize;
  final String receiverName;
  final String receiverPhone;
  final bool receiverPays;
  final Map<String, dynamic>? additionalServices;
  final ParcelStatus status;
  final String? rejectionReason;
  final double? amount;
  final PaymentModel? payment;
  final DateTime createdAt;
  final DateTime updatedAt;

  ParcelModel({
    required this.id,
    this.trackingNumber,
    required this.fromAddress,
    required this.toAddress,
    required this.pickupType,
    required this.serviceType,
    required this.peopleNeeded,
    required this.parcelType,
    required this.parcelSize,
    required this.receiverName,
    required this.receiverPhone,
    required this.receiverPays,
    this.additionalServices,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    this.rejectionReason,
    this.amount,
    this.payment,
  });

  /// Convenience getter used by display screens.
  String get description => parcelType.isNotEmpty ? parcelType : 'N/A';

  factory ParcelModel.fromJson(Map<String, dynamic> json) {
    return ParcelModel(
      id: json['id'] ?? '',
      trackingNumber: json['trackingNumber'],
      fromAddress: json['fromAddress'] ?? '',
      toAddress: json['toAddress'] ?? '',
      pickupType: json['pickupType'] ?? 'SGR_STATION',
      serviceType: json['serviceType'] ?? '',
      peopleNeeded: json['peopleNeeded'] ?? 0,
      parcelType: json['parcelType'] ?? json['parcelType'] ?? '',
      parcelSize: json['parcelSize'] ?? json['parcelSize'] ?? '',
      receiverName: json['receiverName'] ?? '',
      receiverPhone: json['receiverPhone'] ?? '',
      receiverPays: json['receiverPays'] ?? false,
      additionalServices: json['additionalServices'] is Map ? json['additionalServices'] : null,
      status: ParcelStatus.fromString(json['status'] ?? 'PENDING'),
      rejectionReason: json['rejectionReason'] ?? json['reason'],
      amount: json['amount'] != null ? (json['amount']).toDouble() : null,
      payment: json['payment'] != null ? PaymentModel.fromJson(json['payment']) : null,
      createdAt: DateTime.parse(json['createdAt'] ?? DateTime.now().toIso8601String()),
      updatedAt: DateTime.parse(json['updatedAt'] ?? DateTime.now().toIso8601String()),
    );
  }
}
