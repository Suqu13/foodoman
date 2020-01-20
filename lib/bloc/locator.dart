import 'package:foodoman/http_services/dummy_services_impl/dummy_priorities_service_impl.dart';
import 'package:foodoman/http_services/dummy_services_impl/dummy_producers_service_impl.dart';
import 'package:foodoman/http_services/dummy_services_impl/dummy_products_service_impl.dart';
import 'package:foodoman/http_services/dummy_services_impl/dummy_products_sets_service_impl.dart';
import 'package:foodoman/http_services/http_services_impl/priorities_service_impl.dart';
import 'package:foodoman/http_services/http_services_impl/producers_service_impl.dart';
import 'package:foodoman/http_services/http_services_impl/products_service_impl.dart';
import 'package:foodoman/http_services/http_services_impl/products_sets_service_impl.dart';
import 'package:foodoman/http_services/priorities_service.dart';
import 'package:foodoman/http_services/producers_service.dart';
import 'package:foodoman/http_services/products_service.dart';
import 'package:foodoman/http_services/products_sets_service.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt();

void setupLocator() {
  locator.registerLazySingleton<ProductsService>(() => ProductsServiceImpl());
  locator.registerLazySingleton<ProducersService>(() => ProducersServiceImpl());
  locator
      .registerLazySingleton<PrioritiesService>(() => PrioritiesServiceImpl());
  locator.registerLazySingleton<ProductsSetsService>(
      () => ProductsSetsServiceImpl());
}

void testSetupLocator() {
  locator
      .registerLazySingleton<ProductsService>(() => DummyProductsServiceImpl());
  locator.registerLazySingleton<ProducersService>(
      () => DummyProducersServiceImpl());
  locator.registerLazySingleton<PrioritiesService>(
      () => DummyPrioritiesServiceImpl());
  locator.registerLazySingleton<ProductsSetsService>(
      () => DummyProductsSetsServiceImpl());
}
