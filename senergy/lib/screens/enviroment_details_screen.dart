import 'package:flutter/material.dart';
import 'package:senergy/models/enviroment.dart';
import 'package:senergy/widgets/device_list_tile.dart';
import 'package:senergy/widgets/spend_chart.dart';
import 'package:senergy/widgets/stats_grid.dart';

class EnviromentDetailsScreen extends StatelessWidget {
  final Enviroment enviroment;
  EnviromentDetailsScreen(this.enviroment);

  @override
  Widget build(BuildContext context) {
    final Color primaryColor = Theme.of(context).primaryColor;
    final Color accentColor = Theme.of(context).accentColor;

    final widthScreen = MediaQuery.of(context).size.width;
    final heightScreen = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text('Detalhes'),
      ),
      backgroundColor: primaryColor,
      body: CustomScrollView(
        physics: ClampingScrollPhysics(),
        slivers: [
          SliverPadding(
            // padding: EdgeInsets.fromLTRB(12, 12, 12, 20),
            padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
            sliver: SliverToBoxAdapter(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(
                  children: [
                    SizedBox(height: 10),
                    Text(
                      'Ambiente',
                      style: TextStyle(
                        color: primaryColor,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextFormField(
                      initialValue: enviroment.name,
                      decoration: InputDecoration(
                        labelText: 'Nome',
                        contentPadding: EdgeInsets.fromLTRB(20, 0, 0, 10),
                        prefixIcon: Icon(
                          Icons.house_outlined,
                          size: 30,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 0),
            sliver: SliverToBoxAdapter(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                height: heightScreen * 0.36,
                child: Column(
                  children: [
                    SizedBox(height: 10),
                    Text(
                      'Sensores vinculados',
                      style: TextStyle(
                        color: primaryColor,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      height: 100,
                      width: widthScreen,
                      child: ListView.builder(
                        itemCount: enviroment.devices.length,
                        itemBuilder: (context, index) {
                          return Card(
                            child: DeviceListTile.getListTile(
                              context,
                              enviroment.devices[index],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.only(top: 20),
            sliver: SliverToBoxAdapter(
              child: SpentChart(
                  enviroment.devices
                      .expand((element) => element.consumptionList)
                      .toList(),
                  450),
            ),
          )
        ],
      ),
    );
  }
}
