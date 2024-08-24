import 'package:flutter/material.dart';
import 'package:software_lab_assignment/models/user_model.dart';

class UserProvider with ChangeNotifier {
  User _user = User(
    id: '',
    fullName: '',
    email: '',
    phone: '',
    password: '',
    role: '',
    businessName: '',
    informalName: '',
    address: '',
    city: '',
    state: '',
    zipCode: 0,
    registrationProof: '',
    businessHours: {},
    deviceToken: '',
    type: '',
    socialId: '',
    token: '',
  );

  User get user => _user;

  void updateUser(User user) {
    _user = user;
    notifyListeners();
  }

  void setUser({
    String? token,
    String? id,
    String? fullName,
    String? email,
    String? phone,
    String? password,
    String? role,
    String? businessName,
    String? informalName,
    String? address,
    String? city,
    String? state,
    int? zipCode,
    String? registrationProof,
    Map<String, List<String>>? businessHours,
    String? deviceToken,
    String? type,
    String? socialId,
  }) {
    _user = User(
      fullName: fullName ?? _user.fullName,
      id: id ?? _user.id,
      token: token ?? _user.token,
      email: email ?? _user.email,
      phone: phone ?? _user.phone,
      password: password ?? _user.password,
      role: role ?? _user.role,
      businessName: businessName ?? _user.businessName,
      informalName: informalName ?? _user.informalName,
      address: address ?? _user.address,
      city: city ?? _user.city,
      state: state ?? _user.state,
      zipCode: zipCode ?? _user.zipCode,
      registrationProof: registrationProof ?? _user.registrationProof,
      businessHours: businessHours ?? _user.businessHours,
      deviceToken: deviceToken ?? _user.deviceToken,
      type: type ?? _user.type,
      socialId: socialId ?? _user.socialId,
    );
    notifyListeners();
  }
}
