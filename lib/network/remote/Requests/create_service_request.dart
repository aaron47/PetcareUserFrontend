import 'dart:convert';
import 'package:flutter/material.dart';

String createServiceRequestToJson(CreateServiceRequest data) =>
    json.encode(data.toJson());

class CreateServiceRequest {
  final String serviceId;
  final String userEmail;

  CreateServiceRequest({
    @required this.serviceId,
    @required this.userEmail,
  });

  Map<String, dynamic> toJson() => {
        "serviceId": serviceId,
        "userEmail": userEmail,
      };
}
