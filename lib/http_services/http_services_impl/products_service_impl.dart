import 'dart:convert';

import 'package:foodoman/domain/product.dart';
import 'package:http/http.dart' as http;

import '../constans.dart';
import '../products_service.dart';

class ProductsServiceImpl extends ProductsService {
  static const PRODUCTS_URL = "/products";

  Future<List<Product>> fetchAllProducts() async {
    final response = await http.get('$API_BASE_URL$PRODUCTS_URL');
    if (response.statusCode == 200) {
      final Iterable jsonData = jsonDecode(response.body);
      final products =
          jsonData.map((model) => Product.fromJson(model)).toList();
      return Future(() => products);
    } else {
      return Future(() => null);
    }
  }

  Future<List<Product>> fetchAllProductsWithoutFields() async {
    final response =
        await http.get('$API_BASE_URL$PRODUCTS_URL/without_fields');
    if (response.statusCode == 200) {
      final Iterable jsonData = jsonDecode(response.body);
      final products =
          jsonData.map((model) => Product.fromJson(model)).toList();
      return Future(() => products);
    } else {
      return Future(() => null);
    }
  }

  Future<Product> fetchProductById({int id}) async {
    final response = await http.get('$API_BASE_URL$PRODUCTS_URL/$id');
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      final product = Product.fromJson(jsonData);
      return Future(() => product);
    } else {
      return Future(() => null);
    }
  }

  editProduct({Product product}) async {
    await http.put('$API_BASE_URL$PRODUCTS_URL',
        body: JsonEncoder().convert(product),
        headers: {"Content-Type": "application/json"});
  }

  editProductPartially({Product product}) async {
    await http.patch('$API_BASE_URL$PRODUCTS_URL',
        body: JsonEncoder().convert(product),
        headers: {"Content-Type": "application/json"});
  }
}
