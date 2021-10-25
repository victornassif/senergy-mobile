import 'package:flutter/material.dart';
import 'package:senergy/models/enviroment.dart';
import 'package:senergy/screens/enviroment_details_screen.dart';

class EnviromentListTile {
  static getListTile(BuildContext context, Enviroment enviromentData) =>
      ListTile(
        title: Text(
          enviromentData.name,
        ),
        onTap: () {
          Navigator.push(
              context,
              new MaterialPageRoute(
                  builder: (BuildContext context) => new EnviromentDetailsScreen(enviromentData)));
        },
        leading: Icon(Icons.house),
        trailing: Text(enviromentData.value.toString() + ' kWh'),
      );
}
