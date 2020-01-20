import 'dart:convert';

import 'package:foodoman/domain/priority.dart';
import 'package:http/http.dart' as http;

import '../constans.dart';
import '../priorities_service.dart';

final priorities = [
  Priority(
      id: 0,
      name: 'First Priority',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed'
          ' do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut '
          'enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi '
          'ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit '
          'in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur '
          'sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt '
          'mollit anim id est laborum.'),
  Priority(
      id: 1,
      name: 'Second Priority',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed'
          ' do eiusmod tempor incididunt ut labore et dolore magna aliqua.'),
  Priority(
      id: 2,
      name: 'Third Priority',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed'
          ' do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut '
          'enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi '
          'ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit '
          'in culpa qui officia deserunt mollit anim id est laborum.')
];

class DummyPrioritiesServiceImpl extends PrioritiesService {

  Future<List<Priority>> fetchAllPriorities() async {
    return Future(() => priorities);
  }

  Future<List<Priority>> fetchAllPrioritiesByProductId({int id}) async {
    return Future(() => priorities);
  }
}
