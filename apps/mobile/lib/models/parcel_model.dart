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
  final String condition;
  final String urgency;
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
  final String? senderName;
  final String? senderPhone;
  final String? agentName;
  final String? agentPhone;

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
    this.condition = '',
    this.urgency = '',
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
    this.senderName,
    this.senderPhone,
    this.agentName,
    this.agentPhone,
  });

  /// Convenience getter used by display screens.
  String get description => parcelType.isNotEmpty ? parcelType : 'N/A';

  factory ParcelModel.fromJson(Map<String, dynamic> json) {
    String fromAddr = '';
    String toAddr = '';

    if (json['origin'] is Map) {
      fromAddr = json['origin']['name'] ?? '';
    }
    if (fromAddr.isEmpty && json['route'] is Map) {
      fromAddr = json['route']['receivingStation'] ?? '';
    }
    if (fromAddr.isEmpty) {
      fromAddr = json['fromAddress'] ?? '';
    }

    if (json['destination'] is Map) {
      toAddr = json['destination']['name'] ?? '';
    }
    if (toAddr.isEmpty && json['route'] is Map) {
      toAddr = json['route']['destinationStation'] ?? '';
    }
    if (toAddr.isEmpty) {
      toAddr = json['toAddress'] ?? '';
    }

    final senderJson = json['sender'];
    String? sName;
    String? sPhone;
    if (senderJson is Map) {
      sName = senderJson['name'];
      sPhone = senderJson['phone'];
    }
    sName ??= json['senderName'];
    sPhone ??= json['senderPhone'];
    if (sName == null && json['additionalServices'] is Map) {
      sName = json['additionalServices']['senderName'];
    }
    if (sPhone == null && json['additionalServices'] is Map) {
      sPhone = json['additionalServices']['senderPhone'];
    }

    final agentJson = json['agent'];
    String? aName;
    String? aPhone;
    if (agentJson is Map) {
      aName = agentJson['name'];
      aPhone = agentJson['phone'];
    }

    return ParcelModel(
      id: json['id'] ?? '',
      trackingNumber: json['trackingNumber'],
      fromAddress: fromAddr,
      toAddress: toAddr,
      pickupType: json['pickupType'] ?? 'SGR_STATION',
      serviceType: json['serviceType'] ?? '',
      peopleNeeded: json['peopleNeeded'] ?? 0,
      parcelType: json['parcelType'] ?? '',
      parcelSize: json['parcelSize'] ?? '',
      condition: json['condition'] ?? '',
      urgency: json['urgency'] ?? '',
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
      senderName: sName,
      senderPhone: sPhone,
      agentName: aName,
      agentPhone: aPhone,
    );
  }
}
