import 'package:flutter/material.dart';
import 'package:senergy/data/data.dart';
import 'package:senergy/models/device.dart';
import 'package:senergy/widgets/custom_app_bar.dart';
import 'package:senergy/widgets/device_list_tile.dart';

class DeviceScreen extends StatelessWidget {
  final List<Device> devicesData =
      jsonDevices.map((e) => Device.fromJson(e)).toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: CustomAppBar(),
      body: ListView.builder(
        itemCount: devicesData.length,
        itemBuilder: (context, index) {
          return Card(
            child: DeviceListTile.getListTile(
              context,
              devicesData[index],
            ),
          );
        },
      ),
    );
  }
}
