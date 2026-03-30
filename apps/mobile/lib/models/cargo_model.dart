enum CargoStatus {
  received,
  inTransit,
  atStation,
  delivered,
  canceled;

  static CargoStatus fromString(String value) {
    switch (value.toUpperCase()) {
      case 'RECEIVED':
      case 'PENDING': return CargoStatus.received;
      case 'IN TRANSIT':
      case 'IN_TRANSIT': return CargoStatus.inTransit;
      case 'AT STATION':
      case 'AT_STATION':
      case 'AT WAREHOUSE': return CargoStatus.atStation;
      case 'DELIVERED':
      case 'COMPLETED': return CargoStatus.delivered;
      case 'CANCELED':
      case 'CANCELLED':
      case 'REJECTED': return CargoStatus.canceled;
      default: return CargoStatus.received;
    }
  }

  String get displayLabel {
    switch (this) {
      case CargoStatus.received: return 'Received';
      case CargoStatus.inTransit: return 'In Transit';
      case CargoStatus.atStation: return 'At Station';
      case CargoStatus.delivered: return 'Delivered';
      case CargoStatus.canceled: return 'Canceled';
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

class CargoModel {
  final String id;
  final String fromAddress;
  final String toAddress;
  final String pickupType;
  final String serviceType;
  final int peopleNeeded;
  final String cargoType;
  final String cargoSize;
  final String receiverName;
  final String receiverPhone;
  final bool receiverPays;
  final List<String> additionalServices;
  final CargoStatus status;
  final String? rejectionReason;
  final double? amount;
  final PaymentModel? payment;
  final DateTime createdAt;
  final DateTime updatedAt;

  CargoModel({
    required this.id,
    required this.fromAddress,
    required this.toAddress,
    required this.pickupType,
    required this.serviceType,
    required this.peopleNeeded,
    required this.cargoType,
    required this.cargoSize,
    required this.receiverName,
    required this.receiverPhone,
    required this.receiverPays,
    required this.additionalServices,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    this.rejectionReason,
    this.amount,
    this.payment,
  });

  /// Convenience getter used by display screens.
  String get description => cargoType.isNotEmpty ? cargoType : 'N/A';

  factory CargoModel.fromJson(Map<String, dynamic> json) {
    return CargoModel(
      id: json['id'] ?? '',
      fromAddress: json['fromAddress'] ?? '',
      toAddress: json['toAddress'] ?? '',
      pickupType: json['pickupType'] ?? 'SGR_STATION',
      serviceType: json['serviceType'] ?? '',
      peopleNeeded: json['peopleNeeded'] ?? 0,
      cargoType: json['cargoType'] ?? '',
      cargoSize: json['cargoSize'] ?? '',
      receiverName: json['receiverName'] ?? '',
      receiverPhone: json['receiverPhone'] ?? '',
      receiverPays: json['receiverPays'] ?? false,
      additionalServices: List<String>.from(json['additionalServices'] ?? []),
      status: CargoStatus.fromString(json['status'] ?? 'PENDING'),
      rejectionReason: json['rejectionReason'] ?? json['reason'],
      amount: json['amount'] != null ? (json['amount']).toDouble() : null,
      payment: json['payment'] != null ? PaymentModel.fromJson(json['payment']) : null,
      createdAt: DateTime.parse(json['createdAt'] ?? DateTime.now().toIso8601String()),
      updatedAt: DateTime.parse(json['updatedAt'] ?? DateTime.now().toIso8601String()),
    );
  }
}
