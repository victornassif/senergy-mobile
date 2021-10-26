import 'package:senergy/models/consumption.dart';

class Device {
  String name;
  String enviroment;
  double kWh;
  double value;
  bool active;
  List<Consumption> consumptionList;

  Device(this.name, this.kWh, this.value, this.active, this.enviroment,
      this.consumptionList);

  factory Device.fromJson(Map json) {
    List<dynamic> list = json['consumption'];
    List<Consumption> consumptionlistFromJson =
        list.map((e) => Consumption.fromJson(e)).toList();

    return Device(
        json['device'],
        double.parse(json['KWh'].toString()),
        json['value'],
        json['status'],
        json['enviroment'],
        consumptionlistFromJson);
  }
}
