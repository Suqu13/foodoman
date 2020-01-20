import 'dart:convert';

import 'package:foodoman/domain/producer.dart';
import 'package:foodoman/domain/product.dart';
import 'package:foodoman/http_services/dummy_services_impl/dummy_producers_service_impl.dart';

import '../constans.dart';
import '../products_service.dart';

final products = [
  Product(
      id: 0,
      name: 'First Product',
      description:
          'Suspendisse sodales imperdiet nunc, vel dictum leo malesuada '
          'nec. Nunc faucibus justo non augue pellentesque semper. Nam in tincidunt '
          'mauris, vitae dapibus velit. In non ex ac metus imperdiet suscipit id '
          'non augue. Morbi tincidunt est id dapibus pretium. In sodales aliquam '
          'lacus sagittis fermentum. Aenean sit amet auctor arcu. Donec a accumsan '
          'enim. Nulla id sem nibh.',
      allPiecesNumber: 400,
      weight: 10.0,
      height: 15.0,
      surface: 21.0,
      producer: producers[1],
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/8/82/Gnome-emblem-package.svg/1024px-Gnome-emblem-package.svg.png'),
  Product(
      id: 0,
      name: 'Second Product',
      description:
          'Suspendisse sodales imperdiet nunc, vel dictum leo malesuada '
          'nec. Nunc faucibus justo non augue pellentesque semper. Nam in tincidunt '
          'mauris.',
      allPiecesNumber: 40,
      weight: 11.0,
      height: 6.0,
      surface: 91.0,
      producer: producers[0],
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/8/82/Gnome-emblem-package.svg/1024px-Gnome-emblem-package.svg.png')
];

class DummyProductsServiceImpl extends ProductsService {
  Future<List<Product>> fetchAllProducts() async {
    return Future(() => products);
  }

  Future<List<Product>> fetchAllProductsWithoutFields() async {
    return Future(() => products);
  }

  Future<Product> fetchProductById({int id}) async {
    return Future(() => products.firstWhere((product) => product.id == id));
  }

  editProduct({Product product}) async {
    products.removeWhere((elem) => elem.id == product.id);
    products.add(product);
  }

  editProductPartially({Product product}) async {
    products.removeWhere((elem) => elem.id == product.id);
    products.add(product);
  }
}
