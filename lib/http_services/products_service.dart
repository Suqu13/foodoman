import 'package:foodoman/domain/product.dart';

abstract class ProductsService {
  Future<List<Product>> fetchAllProducts();

  Future<List<Product>> fetchAllProductsWithoutFields();

  Future<Product> fetchProductById({int id});

  editProduct({Product product});

  editProductPartially({Product product});
}
