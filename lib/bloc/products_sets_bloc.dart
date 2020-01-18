import 'dart:async';

import 'package:foodoman/bloc/locator.dart';
import 'package:foodoman/domain/product_set.dart';
import 'package:foodoman/http_services/products_sets_service.dart';

class ProductsSetsBloc {
  final _productsSetsService = locator<ProductsSetsService>();
  final _productsSetsController =
      StreamController<List<ProductSet>>.broadcast();

  Stream<List<ProductSet>> get productsSets => _productsSetsController.stream;

  fetchAllProducers() async {
    final productsSets = await _productsSetsService.fetchAllProductsSets();
    _productsSetsController.sink.add(productsSets);
  }

  fetchAllProductsSetsByProductId({int productId}) async {
    final productsSets =
        await _productsSetsService.fetchAllProductsSetsByProductId(productId);
    _productsSetsController.sink.add(productsSets);
  }

  fetchAllProductsSetsByProductIdAndPriorityId(
      {int productId, int priorityId}) async {
    final productsSets = await _productsSetsService
        .fetchAllProductsSetsByProductIdAndPriorityId(productId, priorityId);
    _productsSetsController.sink.add(productsSets);
  }

  dispose() {
    _productsSetsController.close();
  }
}
