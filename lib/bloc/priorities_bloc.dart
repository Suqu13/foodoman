import 'dart:async';

import 'package:foodoman/bloc/locator.dart';
import 'package:foodoman/domain/priority.dart';
import 'package:foodoman/http_services/priorities_service.dart';

class PrioritiesBloc {
  final _prioritiesService = locator<PrioritiesService>();
  final _prioritiesController = StreamController<List<Priority>>.broadcast();

  Stream<List<Priority>> get priorities => _prioritiesController.stream;

  fetchAllPriorities() async {
    final priorities = await _prioritiesService.fetchAllPriorities();
    _prioritiesController.sink.add(priorities);
  }

  fetchAllPrioritiesByProductId({int id}) async {
    final priorities = await _prioritiesService.fetchAllPrioritiesByProductId(id: id);
    _prioritiesController.sink.add(priorities);
  }

  dispose() {
    _prioritiesController.close();
  }
}
