import 'dart:convert';

import 'package:foodoman/domain/priority.dart';
import 'package:http/http.dart' as http;

import 'constans.dart';

class PrioritiesService {
  static const PRIORITIES_URL = "/priorities";

  Future<List<Priority>> fetchAllPriorities() async {
    final response = await http.get('$API_BASE_URL$PRIORITIES_URL');
    if (response.statusCode == 200) {
      final Iterable jsonData = jsonDecode(response.body);
      final priorities =
          jsonData.map((model) => Priority.fromJson(model)).toList();
      return Future(() => priorities);
    } else {
      return Future(() => null);
    }
  }

  Future<List<Priority>> fetchAllPrioritiesByProductId({int id}) async {
    final response = await http.get('$API_BASE_URL$PRIORITIES_URL/product/$id');
    if (response.statusCode == 200) {
      final Iterable jsonData = jsonDecode(response.body);
      final priorities =
          jsonData.map((model) => Priority.fromJson(model)).toList();
      return Future(() => priorities);
    } else {
      return Future(() => null);
    }
  }
}
