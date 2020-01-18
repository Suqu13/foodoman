import 'dart:convert';

import 'package:flutter/cupertino.dart';

import 'sector.dart';

class Rack {
  final int id;
  final int number;
  final String name;
  final String description;
  final Sector sector;

  Rack(
      {@required this.id,
      this.number,
      this.name,
      this.description,
      this.sector});

  factory Rack.fromJson(Map<String, dynamic> json) => Rack(
      id: json['id'],
      number: json['number'],
      name: json['name'],
      description: json['description'],
      sector: Sector.fromJson(json['sector']));

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'number': number,
        'description': description,
        'sector': JsonEncoder().convert(sector)
      };
}
