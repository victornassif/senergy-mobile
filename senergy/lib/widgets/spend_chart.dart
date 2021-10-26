import 'dart:math';
import "package:collection/collection.dart";
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:senergy/models/consumption.dart';
import 'package:senergy/widgets/line_titles.dart';

class SpentChart extends StatelessWidget {
  final List<Consumption> energySpent;
  final double heightDash;

  const SpentChart(this.energySpent, this.heightDash);

  @override
  Widget build(BuildContext context) {
    List<Consumption> consumptionList = [];

    groupBy(energySpent, (Consumption c) => c.dateTime).forEach((key, value) {
      double totalValue = 0;
      double totalKw = 0;
      value.forEach((element) {
        totalValue += element.value;
        totalKw += element.kw;
      });
      consumptionList.add(Consumption(key, totalValue,totalKw));
    });

    var spotsFromList = consumptionList.map((e) {
      return FlSpot(double.parse(e.dateTime.day.toString()), e.valueT);
    }).toList();

    var maxSpotY = spotsFromList.map((e) {
      return e.y;
    }).reduce(max);

    return Container(
      height: heightDash,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      child: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(20.0),
            alignment: Alignment.centerLeft,
            child: Text(
              'Consumo total',
              style: const TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.95,
            height: heightDash * 0.8,
            child: LineChart(
              LineChartData(
                gridData: FlGridData(
                  show: true,
                  horizontalInterval: 2,
                  getDrawingHorizontalLine: (value) {
                    return FlLine(color: Colors.grey.shade200);
                  },
                ),
                maxX: 30,
                minX: 18,
                maxY: maxSpotY + maxSpotY * 0.7,
                titlesData: LineTitles.getTitleData(),
                borderData: FlBorderData(show: true, border: Border()),
                lineBarsData: [
                  LineChartBarData(
                    spots: spotsFromList,
                    isCurved: true,
                    colors: [
                      Theme.of(context).accentColor,
                    ],
                    barWidth: 3,
                    belowBarData: BarAreaData(
                      show: true,
                      colors: [
                        Colors.white70,
                        Theme.of(context).accentColor,
                      ]
                          .map(
                            (e) => e.withOpacity(0.3),
                          )
                          .toList(),
                    ),
                    dotData: FlDotData(getDotPainter: (spot, value, line, i) {
                      return FlDotCirclePainter(
                        color: Colors.white,
                        strokeColor: Theme.of(context).accentColor,
                        strokeWidth: 3,
                      );
                    }),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
