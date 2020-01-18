import 'package:foodoman/http_services/priorities_service.dart';
import 'package:foodoman/http_services/producers_service.dart';
import 'package:foodoman/http_services/products_service.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt();

void setupLocator() {
  locator.registerLazySingleton<ProductsService>(() => ProductsService());
  locator.registerLazySingleton<ProducersService>(() => ProducersService());
  locator.registerLazySingleton<PrioritiesService>(() => PrioritiesService());
}
