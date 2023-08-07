import 'dart:convert';

import 'package:flutter/material.dart';

Pet petFromJson(String str) => Pet.fromJson(json.decode(str));

String petToJson(Pet data) => json.encode(data.toJson());

class Pet {
  final String petName;
  final String petAge;
  final String petImageLink;
  final String petType;
  final String petBreed;
  final String petGender;
  final String petBloodPressure;
  final String petBoneDensity;
  final int petWeight;
  final String petOwner;

  Pet({
    @required this.petName,
    @required this.petAge,
    @required this.petImageLink,
    @required this.petType,
    @required this.petBreed,
    @required this.petGender,
    @required this.petBloodPressure,
    @required this.petBoneDensity,
    @required this.petWeight,
    @required this.petOwner,
  });

  factory Pet.fromJson(Map<String, dynamic> json) => Pet(
        petName: json["petName"],
        petAge: json["petAge"],
        petImageLink: json["petImageLink"],
        petType: json["petType"],
        petBreed: json["petBreed"],
        petGender: json["petGender"],
        petBloodPressure: json["petBloodPressure"],
        petBoneDensity: json["petBoneDensity"],
        petWeight: json["petWeight"],
        petOwner: json["petOwner"],
      );

  Map<String, dynamic> toJson() => {
        "petName": petName,
        "petAge": petAge,
        "petImageLink": petImageLink,
        "petType": petType,
        "petBreed": petBreed,
        "petGender": petGender,
        "petBloodPressure": petBloodPressure,
        "petBoneDensity": petBoneDensity,
        "petWeight": petWeight,
        "petOwner": petOwner,
      };
}
