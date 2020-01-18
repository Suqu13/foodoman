import 'dart:convert';

import 'package:foodoman/domain/product_set.dart';
import 'package:http/http.dart' as http;

import '../constans.dart';
import '../products_sets_service.dart';

class ProductsSetsServiceImpl extends ProductsSetsService {
  static const PRODUCERS_URL = "/products_sets";

  Future<List<ProductSet>> fetchAllProductsSets() async {
    final response = await http.get('$API_BASE_URL$PRODUCERS_URL');
    if (response.statusCode == 200) {
      final Iterable jsonData = jsonDecode(response.body);
      final productsSets =
          jsonData.map((model) => ProductSet.fromJson(model)).toList();
      return Future(() => productsSets);
    } else {
      return Future(() => null);
    }
  }

  Future<List<ProductSet>> fetchAllProductsSetsByProductIdAndPriorityId(
      int productId, int priorityId) async {
    final response = await http.get(
        '$API_BASE_URL$PRODUCERS_URL/product/$productId/priority/$priorityId');
    if (response.statusCode == 200) {
      final Iterable jsonData = jsonDecode(response.body);
      final productsSets =
          jsonData.map((model) => ProductSet.fromJson(model)).toList();
      return Future(() => productsSets);
    } else {
      return Future(() => null);
    }
  }

  Future<List<ProductSet>> fetchAllProductsSetsByProductId(int id) async {
    final response = await http.get('$API_BASE_URL$PRODUCERS_URL/product/$id');
    if (response.statusCode == 200) {
      final Iterable jsonData = jsonDecode(response.body);
      final productsSets =
          jsonData.map((model) => ProductSet.fromJson(model)).toList();
      return Future(() => productsSets);
    } else {
      return Future(() => null);
    }
  }
}
