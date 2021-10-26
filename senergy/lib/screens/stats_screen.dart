import 'dart:async';

import 'package:flutter/material.dart';
import 'package:senergy/config/styles.dart';
import 'package:senergy/controller/enviroment_controller.dart';
import 'package:senergy/models/consumption.dart';
import 'package:senergy/models/enviroment.dart';
import 'package:senergy/widgets/custom_app_bar.dart';
import 'package:senergy/widgets/spend_chart.dart';
import 'package:senergy/widgets/stats_grid.dart';

class StatsScreen extends StatefulWidget {
  @override
  State<StatsScreen> createState() => _StatsScreenState();
}

class _StatsScreenState extends State<StatsScreen> {
  @override
  void initState() {
    getData();
    super.initState();
  }

  Future<Null> _handleRefresh() async {
    await getData();
  }

  getData() async {
    var list = await EnviromentController.getEnviroments();
    _streamController.add(list);
  }

  final _streamController = StreamController<List<Enviroment>>.broadcast();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: CustomAppBar(_handleRefresh,'Dashboard'),
      body: StreamBuilder(
          stream: _streamController.stream,
          builder: (ctx, snp) {
            if (snp.hasData) {
              List<Enviroment> enviroments = snp.data;
              List<Consumption> listConsumption = [];

              enviroments.forEach((e) {
                e.devices.forEach((element) {
                  listConsumption.addAll(element.consumptionList);
                });
              });

              double totalKw = listConsumption
                  .map((Consumption e) => e.kw)
                  .fold(0, (previousValue, element) => element + previousValue);
              double totalSpent = listConsumption
                  .map((Consumption e) => e.value)
                  .fold(0, (previousValue, element) => element + previousValue);

              return CustomScrollView(
                physics: ClampingScrollPhysics(),
                slivers: <Widget>[
                  SliverPadding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    sliver: SliverToBoxAdapter(
                      child: StatsGrid(
                        totalSpent: totalSpent,
                        totalKw: totalKw,
                      ),
                    ),
                  ),
                  SliverPadding(
                    padding: const EdgeInsets.symmetric(horizontal: 0.0),
                    sliver: SliverToBoxAdapter(
                      child: SpentChart(listConsumption, 500),
                    ),
                  ),
                ],
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

  SliverPadding _buildStatsTabBar() {
    return SliverPadding(
      padding: const EdgeInsets.all(20.0),
      sliver: SliverToBoxAdapter(
        child: DefaultTabController(
          length: 3,
          child: TabBar(
            indicatorColor: Colors.transparent,
            labelStyle: Styles.tabTextStyle,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white60,
            tabs: <Widget>[
              Text('Total'),
              Text('Hoje'),
              Text('Ontem'),
            ],
            onTap: (index) {}, //evento de recarregar dash
          ),
        ),
      ),
    );
  }
}
