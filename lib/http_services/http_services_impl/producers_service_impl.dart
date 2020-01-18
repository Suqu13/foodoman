import 'dart:convert';

import 'package:foodoman/domain/producer.dart';
import 'package:http/http.dart' as http;

import '../constans.dart';
import '../producers_service.dart';

class ProducersServiceImpl extends ProducersService {
  static const PRODUCERS_URL = "/producers";

  Future<List<Producer>> fetchAllProducts() async {
    final response = await http.get('$API_BASE_URL$PRODUCERS_URL');
    if (response.statusCode == 200) {
      final Iterable jsonData = jsonDecode(response.body);
      final producers =
          jsonData.map((model) => Producer.fromJson(model)).toList();
      return Future(() => producers);
    } else {
      return Future(() => null);
    }
  }
}
