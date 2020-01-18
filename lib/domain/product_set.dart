import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:foodoman/domain/rack.dart';

class ProductSet {
  final int id;
  final int pieces;
  final DateTime expiryDate;
  final String description;
  final Rack rack;

  ProductSet(
      {@required this.id,
      this.pieces,
      this.description,
      this.expiryDate,
      this.rack});

  factory ProductSet.fromJson(Map<String, dynamic> json) => ProductSet(
      id: json['id'],
      pieces: json['pieces'],
      expiryDate: DateTime.parse(json['expiryDate']),
      description: json['description'],
      rack: Rack.fromJson(json['rack']));

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': pieces,
        'expiryDate': expiryDate.toIso8601String(),
        'description': description,
        'rack': JsonEncoder().convert(rack)
      };
}
