import 'dart:convert';

import 'package:http/http.dart' as http;

import '../dto/store_dto.dart';
import '../model/store.dart';

class StoreAPI {
  Future<List<Stores>> getStoreResult() async {
    try {
      final response = await http.get(Uri.parse(
          'https://gist.githubusercontent.com/junsuk5/bb7485d5f70974deee920b8f0cd1e2f0/raw/063f64d9b343120c2cb01a6555cf9b38761b1d94/sample.json'));
      if (response.statusCode == 200) {
        // return jsonDecode(utf8.decode(response.bodyBytes));
        final List<dynamic> jsonStores = jsonDecode(utf8.decode(response.bodyBytes))['stores'];

        return jsonStores.map((e) => Stores.fromJson(e)).toList();
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }
}
