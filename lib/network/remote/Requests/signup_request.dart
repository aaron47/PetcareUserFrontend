import 'dart:convert';
import 'package:flutter/material.dart';

String signUpRequestToJson(SignUpRequest data) => json.encode(data.toJson());

class SignUpRequest {
  final String fullName;
  final String email;
  final String phone;
  final String password;
  final String gender;
  final String role;

  SignUpRequest({
    @required this.fullName,
    @required this.email,
    @required this.phone,
    @required this.password,
    @required this.gender,
    @required this.role,
  });

  Map<String, dynamic> toJson() => {
        "fullName": fullName,
        "email": email,
        "phone": phone,
        "password": password,
        "role": role,
        "gender": gender,
      };
}
