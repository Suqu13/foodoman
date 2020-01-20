import 'dart:async';

import 'package:foodoman/bloc/locator.dart';
import 'package:foodoman/domain/producer.dart';
import 'package:foodoman/http_services/producers_service.dart';

class ProducersBloc {
  final _producersService = locator<ProducersService>();
  final _producersController = StreamController<List<Producer>>.broadcast();

  Stream<List<Producer>> get producers => _producersController.stream;

  fetchAllProducers() async {
    final producers = await _producersService.fetchAllProducers();
    _producersController.sink.add(producers);
  }

  dispose() {
    _producersController.close();
  }
}
