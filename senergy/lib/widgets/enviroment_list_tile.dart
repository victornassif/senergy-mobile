import 'package:flutter/material.dart';
import 'package:senergy/models/enviroment.dart';

class EnviromentListTile {
  static getListTile(Enviroment enviromentData) => ListTile(
        title: Text(enviromentData.name),
        tileColor: Colors.white,
        onTap: () {},
        leading: Icon(Icons.invert_colors_on_outlined),
        trailing: Text(enviromentData.value.toString() + ' kWh'),
      );
}
