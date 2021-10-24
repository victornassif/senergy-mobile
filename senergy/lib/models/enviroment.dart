class Enviroment {
  String name;
  int value;

  Enviroment(this.name, this.value);

  factory Enviroment.fromJson(Map json) {
    return Enviroment(json['room'], json['value']);
  }
}
