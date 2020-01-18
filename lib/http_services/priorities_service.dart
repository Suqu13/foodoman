import 'package:foodoman/domain/priority.dart';

abstract class PrioritiesService {
  Future<List<Priority>> fetchAllPriorities();

  Future<List<Priority>> fetchAllPrioritiesByProductId({int id});
}
