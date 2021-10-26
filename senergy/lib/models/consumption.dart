import 'dart:math';

import 'package:intl/intl.dart';

double roundDouble(double value, int places) {
  double mod = pow(10.0, places);
  return ((value * mod).round().toDouble() / mod);
}

class Consumption {
  DateTime dateTime;
  double value;
  double kw;
  double get valueT => roundDouble(value, 2);

  Consumption(this.dateTime, this.value, this.kw);

  factory Consumption.fromJson(Map<String, dynamic> json) {
    return Consumption(
      DateFormat('dd/MM/yyyy').parse(json['date']),
      double.parse(json['value'].toString()),
      double.parse(json['kw'].toString()),
    );
  }
}
