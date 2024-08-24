import 'dart:convert';

class User {
  final String id;
  final String fullName;
  final String email;
  final String phone;
  final String password;
  final String role;
  final String businessName;
  final String informalName;
  final String address;
  final String city;
  final String state;
  final int zipCode;
  final String registrationProof;
  final Map<String, List<String>> businessHours;
  final String deviceToken;
  final String type;
  final String socialId;
  final String token;

  User({
    required this.id,
    required this.fullName,
    required this.email,
    required this.phone,
    required this.password,
    required this.role,
    required this.businessName,
    required this.informalName,
    required this.address,
    required this.city,
    required this.state,
    required this.zipCode,
    required this.registrationProof,
    required this.businessHours,
    required this.deviceToken,
    required this.type,
    required this.socialId,
    required this.token,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'full_name': fullName,
      'email': email,
      'phone': phone,
      'password': password,
      'role': role,
      'business_name': businessName,
      'informal_name': informalName,
      'address': address,
      'city': city,
      'state': state,
      'zip_code': zipCode,
      'registration_proof': registrationProof,
      'business_hours': businessHours,
      'device_token': deviceToken,
      'type': type,
      'social_id': socialId,
      'token': token,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['_id'] ?? '',
      fullName: map['full_name'] ?? '',
      email: map['email'] ?? '',
      phone: map['phone'] ?? '',
      password: map['password'] ?? '',
      role: map['role'] ?? '',
      businessName: map['business_name'] ?? '',
      informalName: map['informal_name'] ?? '',
      address: map['address'] ?? '',
      city: map['city'] ?? '',
      state: map['state'] ?? '',
      zipCode: map['zip_code'] ?? 0,
      registrationProof: map['registration_proof'] ?? '',
      businessHours:
          Map<String, List<String>>.from(map['business_hours'] ?? {}),
      deviceToken: map['device_token'] ?? '',
      type: map['type'] ?? '',
      socialId: map['social_id'] ?? '',
      token: map['token'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);
}
