import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:senergy/main.dart';
import 'package:senergy/models/device.dart';


class DeviceController {
  static Future<List<Device>> getEnviroments() async {
    var url = '$api_base_url/sensor';
    final response = await http.get(url);
    if (response.statusCode == 200)
      return (json.decode(response.body) as List)
          .map((e) => Device.fromJson(e))
          .toList();
    else
      throw Exception('Failed to load devices');
  }
}