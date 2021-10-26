import 'dart:async';
import 'package:flutter/material.dart';
import 'package:senergy/controller/device_controller.dart';
import 'package:senergy/models/device.dart';
import 'package:senergy/widgets/custom_app_bar.dart';
import 'package:senergy/widgets/device_list_tile.dart';

class DeviceScreen extends StatefulWidget {
  @override
  State<DeviceScreen> createState() => _DeviceScreenState();
}

class _DeviceScreenState extends State<DeviceScreen> {
  Future<Null> _handleRefresh() async {
    await getData();
  }

  getData() async {
    var list = await DeviceController.getEnviroments();
    _streamController.add(list);
  }

  final _streamController = StreamController<List<Device>>.broadcast();

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: CustomAppBar(_handleRefresh),
      body: StreamBuilder(
          stream: _streamController.stream,
          builder: (ctx, snp) {
            if (snp.hasData) {
              return ListView.builder(
                itemCount: snp.data.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: DeviceListTile.getListTile(
                      context,
                      snp.data[index],
                    ),
                  );
                },
              );
            } else {
              return Center(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.grey,
                  color: Theme.of(context).accentColor,
                ),
              );
            }
          }),
    );
  }
}
