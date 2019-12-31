import 'package:flutter/cupertino.dart';

class Product {
  final String name;
  final String imageUrl;
  final int units;

  Product({@required this.name, this.units, this.imageUrl});
}

final productsList = [
  Product(
      name: 'product_0',
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTpihMVQysrTD5pEooXnaRa2rq8GnQRjh_g4wNfAwg_IdUUBt0e&s',
      units: 12),
  Product(
      name: 'product_1',
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTpihMVQysrTD5pEooXnaRa2rq8GnQRjh_g4wNfAwg_IdUUBt0e&s',
      units: 42),
  Product(
      name: 'product_2',
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTpihMVQysrTD5pEooXnaRa2rq8GnQRjh_g4wNfAwg_IdUUBt0e&s',
      units: 3),
  Product(
      name: 'product_3',
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTpihMVQysrTD5pEooXnaRa2rq8GnQRjh_g4wNfAwg_IdUUBt0e&s',
      units: 4),
  Product(
      name: 'product_4',
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTpihMVQysrTD5pEooXnaRa2rq8GnQRjh_g4wNfAwg_IdUUBt0e&s',
      units: 1312),
  Product(
      name: 'product_5',
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTpihMVQysrTD5pEooXnaRa2rq8GnQRjh_g4wNfAwg_IdUUBt0e&s',
      units: 421),
  Product(
      name: 'product_6',
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTpihMVQysrTD5pEooXnaRa2rq8GnQRjh_g4wNfAwg_IdUUBt0e&s',
      units: 43242141),
  Product(
      name: 'product_7',
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTpihMVQysrTD5pEooXnaRa2rq8GnQRjh_g4wNfAwg_IdUUBt0e&s',
      units: 1),
  Product(
      name: 'product_8',
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTpihMVQysrTD5pEooXnaRa2rq8GnQRjh_g4wNfAwg_IdUUBt0e&s',
      units: 54),
  Product(
      name: 'product_9',
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTpihMVQysrTD5pEooXnaRa2rq8GnQRjh_g4wNfAwg_IdUUBt0e&s',
      units: 0)
];

final exemplaryProduct = Product(
    name: 'product_0',
    imageUrl:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTpihMVQysrTD5pEooXnaRa2rq8GnQRjh_g4wNfAwg_IdUUBt0e&s',
    units: 12);
