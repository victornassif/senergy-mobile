import 'package:flutter/material.dart';
import 'package:senergy/data/data.dart';
import 'package:senergy/models/enviroment.dart';
import 'package:senergy/widgets/custom_app_bar.dart';
import 'package:senergy/widgets/enviroment_list_tile.dart';

class EnviromentScreen extends StatelessWidget {
  final List<Enviroment> enviromentsData =
      jsonEnviroment.map((e) => Enviroment.fromJson(e)).toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: CustomAppBar(),
      body: ListView.builder(
        itemCount: enviromentsData.length,
        itemBuilder: (context, index) {
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(21),
            ),
            
            child: EnviromentListTile.getListTile(
              enviromentsData[index],
            ),
          );
        },
      ),
    );
  }
}
