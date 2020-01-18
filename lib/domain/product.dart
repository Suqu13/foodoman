import 'package:flutter/cupertino.dart';
import 'package:foodoman/domain/producer.dart';

class Product {
  final int id;
  final String name;
  final double weight;
  final double height;
  final int allPiecesNumber;
  final double surface;
  final String imageUrl;
  final String description;
  final Producer producer;

  Product(
      {@required this.id,
      this.name,
      this.weight,
      this.height,
      this.allPiecesNumber,
      this.surface,
      this.imageUrl,
      this.description,
      this.producer});

  factory Product.fromJson(Map<String, dynamic> json) => Product(
      id: json['id'],
      name: json['name'],
      weight: json['weight'],
      height: json['height'],
      allPiecesNumber: json['allPiecesNumber'],
      surface: json['surface'],
      imageUrl: json['imageUrl'],
      description: json['description'],
      producer: json['producer'] == null ? null : Producer.fromJson(json['producer'])
  );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'weight': weight,
        'height': height,
        'allPiecesNumber': allPiecesNumber,
        'surface': surface,
        'imageUrl': imageUrl,
        'description': description,
        'producer': producer.toJson(),
      };


}