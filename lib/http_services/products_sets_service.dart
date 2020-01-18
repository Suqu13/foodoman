import 'package:foodoman/domain/product_set.dart';

abstract class ProductsSetsService {
  Future<List<ProductSet>> fetchAllProductsSets();

  Future<List<ProductSet>> fetchAllProductsSetsByProductIdAndPriorityId(
      int productId, int priorityId);

  Future<List<ProductSet>> fetchAllProductsSetsByProductId(int id);
}
