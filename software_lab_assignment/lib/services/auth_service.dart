import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class AuthService {
  final String baseUrl = "https://sowlab.com/assignment";

  Future<void> login(
    String email,
    String password,
    VoidCallback onSuccess,
    VoidCallback onFailure,
  ) async {
    String device_token = "0imfnc8mVLWwsAawjYr4Rx-Af50DDqtlx";
    String type = "email/facebook/google/apple";
    String social_id = "0imfnc8mVLWwsAawjYr4Rx-Af50DDqtlx";
    String role = "farmer";

    final response = await http.post(
      Uri.parse('$baseUrl/user/login'),
      body: {
        'email': email,
        'password': password,
        'role': role,
        'device_token': device_token,
        'type': type,
        'social_id': social_id
      },
    );
    if (response.statusCode == 200) {
      onSuccess();
    } else {
      onFailure();
    }
  }

  Future<void> register(
    String email,
    String password,
    String full_name,
    String phone,
    String role,
    String business_name,
    String informal_name,
    String address,
    String city,
    String state,
    String zip_code,
    String registration_proof,
    Map<String, List<String>> business_hours,
    VoidCallback onSuccess,
    VoidCallback onFailure,
  ) async {
    String device_token = "0imfnc8mVLWwsAawjYr4Rx-Af50DDqtlx";
    String type = "email/facebook/google/apple";
    String social_id = "0imfnc8mVLWwsAawjYr4Rx-Af50DDqtlx";
    final response = await http.post(
      Uri.parse('$baseUrl/user/register'),
      body: jsonEncode({
        'email': email,
        'password': password,
        'full_name': full_name,
        'phone': phone,
        'role': role,
        'business_name': business_name,
        'informal_name': informal_name,
        'address': address,
        'city': city,
        'state': state,
        'zip_code': zip_code,
        'registration_proof': registration_proof,
        'business_hours':
            business_hours, // This is now serialized to a JSON string
        'device_token': device_token,
        'type': type,
        'social_id': social_id
      }),
    );
    if (response.statusCode == 200) {
      onSuccess();
    } else {
      onFailure();
    }
  }
}
