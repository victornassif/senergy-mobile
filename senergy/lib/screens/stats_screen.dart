import 'package:flutter/material.dart';
import 'package:senergy/config/styles.dart';
import 'package:senergy/data/data.dart';
import 'package:senergy/widgets/custom_app_bar.dart';
import 'package:senergy/widgets/spend_chart.dart';
import 'package:senergy/widgets/stats_grid.dart';

class StatsScreen extends StatefulWidget {
  @override
  State<StatsScreen> createState() => _StatsScreenState();
}

class _StatsScreenState extends State<StatsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: CustomAppBar(),
      body: CustomScrollView(
        physics: ClampingScrollPhysics(),
        slivers: <Widget>[
          _buildStatsTabBar(),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            sliver: SliverToBoxAdapter(
              child: StatsGrid(),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 0.0),
            sliver: SliverToBoxAdapter(
              child: SpentChart(energySpent: energySpent),
            ),
          ),
        ],
      ),
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
