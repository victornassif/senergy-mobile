class Device {
  String name;
  String kWh;
  bool active;

  Device(this.name, this.kWh);

  factory Device.fromJson(Map json) {
    return Device(json['room'], json['KWh']);
  }
}
