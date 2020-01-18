import 'package:foodoman/domain/producer.dart';

abstract class ProducersService {
  Future<List<Producer>> fetchAllProducts();
}
