class UserModel {
  final String id;
  final String name;
  final String email;
  final String? phone;
  final String? role;
  final String? avatarUrl; // network URL or local file path
  final String? station;
  final String? stationId;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    this.phone,
    this.role,
    this.avatarUrl,
    this.station,
    this.stationId,
  });

  bool get isStaff {
    final r = role?.toUpperCase();
    return r != null && const {
      'OPERATOR',
      'CLERK',
      'STATION_MASTER',
      'TRAIN_GUARD',
      'ADMIN',
      'SUPER_ADMIN',
    }.contains(r);
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'],
      role: json['role'],
      avatarUrl: json['avatarUrl'],
      station: json['station'],
      stationId: json['stationId'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'email': email,
        'phone': phone,
        'role': role,
        'avatarUrl': avatarUrl,
        'station': station,
        'stationId': stationId,
      };

  UserModel copyWith({
    String? id,
    String? name,
    String? email,
    String? phone,
    String? role,
    String? avatarUrl,
    String? station,
    String? stationId,
  }) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      role: role ?? this.role,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      station: station ?? this.station,
      stationId: stationId ?? this.stationId,
    );
  }
}
