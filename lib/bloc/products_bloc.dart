import 'dart:async';

import 'package:foodoman/bloc/locator.dart';
import 'package:foodoman/domain/product.dart';
import 'package:foodoman/http_services/products_service.dart';

class ProductsBloc {
  final _productsService = locator<ProductsService>();
  final _productsController = StreamController<List<Product>>.broadcast();
  final _productController = StreamController<Product>.broadcast();

  Stream<List<Product>> get products => _productsController.stream;

  Stream<Product> get product => _productController.stream;

  fetchAllProducts() async {
    final products = await _productsService.fetchAllProducts();
    _productsController.sink.add(products);
  }

  fetchAllProductsWithoutFields() async {
    final products = await _productsService.fetchAllProductsWithoutFields();
    _productsController.sink.add(products);
  }

  fetchProductById({int id}) async {
    final product = await _productsService.fetchProductById(id: id);
    _productController.sink.add(product);
  }

  editProduct({Product product}) {
    _productsService.editProduct(product: product);
  }

  editProductPartially({Product product}) {
    _productsService.editProductPartially(product: product);
  }

  dispose() {
    _productsController.close();
    _productController.close();
  }
}
