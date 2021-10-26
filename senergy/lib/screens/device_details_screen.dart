import 'package:flutter/material.dart';
import 'package:senergy/models/device.dart';
import 'package:senergy/widgets/spend_chart.dart';

class DeviceDetailsScreen extends StatelessWidget {
  final Device device;
  DeviceDetailsScreen(this.device);

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
            padding: EdgeInsets.fromLTRB(10, 20, 10, 7),
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
                      'Sensor',
                      style: TextStyle(
                        color: primaryColor,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Divider(
                      thickness: 1,
                    ),
                    TextFormField(
                      initialValue: device.name,
                      decoration: InputDecoration(
                        labelText: 'Nome',
                        contentPadding: EdgeInsets.fromLTRB(20, 0, 0, 10),
                        prefixIcon: Icon(
                          Icons.developer_board,
                          size: 30,
                        ),
                      ),
                    ),
                    TextFormField(
                      initialValue: device.enviroment,
                      decoration: InputDecoration(
                        labelText: 'Ambiente',
                        contentPadding: EdgeInsets.fromLTRB(20, 15, 0, 10),
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
            padding: EdgeInsets.only(top: 20),
            sliver: SliverToBoxAdapter(
              child: SpentChart(device.consumptionList, 600),
            ),
          )
        ],
      ),
    );
  }
}
