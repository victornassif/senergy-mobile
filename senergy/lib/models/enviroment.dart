import 'package:senergy/models/sensor.dart';

class Enviroment {
  String name;
  double value;
  int id;
  List<Device> devices;
  
  Enviroment(this.name, this.value, this.id, this.devices);

  factory Enviroment.fromJson(Map json) {
    return Enviroment(json['room'], double.parse(json['value'].toString()),json['id'], json['devices']);
  }
}
