import 'dart:convert';

import 'package:flutter/material.dart';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  final String fullName;
  final String email;
  final String phone;

  User({
    @required this.fullName,
    @required this.email,
    @required this.phone,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        fullName: json["fullName"],
        email: json["email"],
        phone: json["phone"],
      );

  Map<String, dynamic> toJson() => {
        "fullName": fullName,
        "email": email,
        "phone": phone,
      };
}
