import 'dart:async';

import 'package:flutter/material.dart';
import 'package:senergy/controller/enviroment_controller.dart';
import 'package:senergy/data/data.dart';
import 'package:senergy/models/enviroment.dart';
import 'package:senergy/widgets/custom_app_bar.dart';
import 'package:senergy/widgets/enviroment_list_tile.dart';

class EnviromentScreen extends StatefulWidget {
  @override
  State<EnviromentScreen> createState() => _EnviromentScreenState();
}

class _EnviromentScreenState extends State<EnviromentScreen> {
  final List<Enviroment> enviromentsData =
      jsonEnviroment.map((e) => Enviroment.fromJson(e)).toList();

  Future<Null> _handleRefresh() async {
    await getData();
  }

  getData() async {
    var list = await EnviromentController.getEnviroments();
    _streamController.add(list);
  }

  final _streamController = StreamController<List<Enviroment>>.broadcast();

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: CustomAppBar(),
      body: StreamBuilder(
          stream: _streamController.stream,
          builder: (ctx, snp) {
            if (snp.hasData) {
              return ListView.builder(
                itemCount: enviromentsData.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: EnviromentListTile.getListTile(
                      context,
                      enviromentsData[index],
                    ),
                  );
                },
              );
            } else {
              return Center(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.blue[100],
                ),
              );
            }
          }),
    );
  }
}
