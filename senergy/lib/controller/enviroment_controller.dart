import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:senergy/models/enviroment.dart';

const API_URL_BASE =
    'https://7c26-2804-431-cfd4-3c02-e1e2-ab04-caf9-aed1.ngrok.io';

class EnviromentController {
  static Future<List<Enviroment>> getEnviroments() async {
    var url = '$API_URL_BASE/environment';
    final response = await http.get(url);
    if (response.statusCode == 200)
      return (json.decode(response.body) as List)
          .map((e) => Enviroment.fromJson(e))
          .toList();
    else
      throw Exception('Failed to load enviroment');
  }
}