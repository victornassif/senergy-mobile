import 'package:senergy/models/device.dart';

class Enviroment {
  String name;
  double value;
  int id;
  List<Device> devices;

  Enviroment(this.name, this.value, this.id, this.devices);

  factory Enviroment.fromJson(Map json) {
    List<dynamic> list = json['sensorList'];

    List<Device> deviceslistFromJson =
        list.map((e) => Device.fromJson(e)).toList();

    return Enviroment(
      json['room'],
      double.parse(json['value'].toString()),
      json['id'],
      deviceslistFromJson,
    );
  }
}
