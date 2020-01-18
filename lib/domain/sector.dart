import 'package:flutter/cupertino.dart';

class Sector {
  final int id;
  final int number;
  final String description;

  Sector({@required this.id, this.number, this.description});

  factory Sector.fromJson(Map<String, dynamic> json) => Sector(
      id: json['id'], number: json['number'], description: json['description']);

  Map<String, dynamic> toJson() =>
      {'id': id, 'number': number, 'description': description};
}
