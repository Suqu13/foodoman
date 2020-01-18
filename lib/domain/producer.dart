import 'package:flutter/cupertino.dart';

class Producer {
  final int id;
  final String name;
  final String description;

  Producer({@required this.id, this.name, this.description});

  factory Producer.fromJson(Map<String, dynamic> json) => Producer(
      id: json['id'], name: json['name'], description: json['description']);

  Map<String, dynamic> toJson() =>
      {'id': id, 'name': name, 'description': description};

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Producer &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name &&
          description == other.description;

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ description.hashCode;
}
