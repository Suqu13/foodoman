import 'package:flutter/cupertino.dart';

class Product {
  final String name;
  final String imageUrl;
  final int units;
  Product({@required this.name, this.units, this.imageUrl});
}


final productsList = [
  Product(name: 'product_0', imageUrl: 'https://intermarche.pl/products/optim/51_banan.png', units: 12),
  Product(name: 'product_1', imageUrl: 'https://intermarche.pl/products/optim/51_banan.png', units: 42),
  Product(name: 'product_2', imageUrl: 'https://intermarche.pl/products/optim/51_banan.png', units: 3),
  Product(name: 'product_3', imageUrl: 'https://intermarche.pl/products/optim/51_banan.png', units: 4),
  Product(name: 'product_4', imageUrl: 'https://intermarche.pl/products/optim/51_banan.png', units: 1312),
  Product(name: 'product_5', imageUrl: 'https://intermarche.pl/products/optim/51_banan.png', units: 421),
  Product(name: 'product_6', imageUrl: 'https://intermarche.pl/products/optim/51_banan.png', units: 43242141),
  Product(name: 'product_7', imageUrl: 'https://intermarche.pl/products/optim/51_banan.png', units: 1),
  Product(name: 'product_8', imageUrl: 'https://intermarche.pl/products/optim/51_banan.png', units: 54),
  Product(name: 'product_9', imageUrl: 'https://intermarche.pl/products/optim/51_banan.png', units: 0)
];