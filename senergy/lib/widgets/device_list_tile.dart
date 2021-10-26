import 'package:flutter/material.dart';
import 'package:senergy/models/device.dart';
import 'package:senergy/screens/device_details_screen.dart';

class DeviceListTile {
  static getListTile(BuildContext context, Device deviceData) => ListTile(
        title: Text(
          deviceData.name,
        ),
        onTap: () {
          Navigator.push(
              context,
              new MaterialPageRoute(
                  builder: (BuildContext context) =>
                      new DeviceDetailsScreen(deviceData)));
        },
        leading: Icon(Icons.developer_board),
        trailing: Text(deviceData.kWh.toStringAsFixed(0) + ' kWh'),
      );
}
