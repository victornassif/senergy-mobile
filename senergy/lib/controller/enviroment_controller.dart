import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:senergy/models/enviroment.dart';
import '../main.dart';


class EnviromentController {
  static Future<List<Enviroment>> getEnviroments() async {
    var url = '$api_base_url/environment';
    final response = await http.get(url);
    if (response.statusCode == 200)
      return (json.decode(response.body) as List)
          .map((e) => Enviroment.fromJson(e))
          .toList();
    else
      throw Exception('Failed to load enviroment');
  }
}