import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:senergy/widgets/line_titles.dart';

class SpentChart extends StatelessWidget {
  final List<double> energySpent;

  const SpentChart({@required this.energySpent});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 450,
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
            width: MediaQuery.of(context).size.width * 0.90,
            child: LineChart(
              LineChartData(
                gridData: FlGridData(
                  show: true,
                  horizontalInterval: 2,
                  getDrawingHorizontalLine: (value) {
                    return FlLine(color: Colors.grey.shade200);
                  },
                ),
                maxX: 12,
                minX: 1,
                maxY: 6,
                minY: 0,
                titlesData: LineTitles.getTitleData(),
                borderData: FlBorderData(show: true, border: Border()),
                lineBarsData: [
                  LineChartBarData(
                    spots: [
                      FlSpot(1, 3),
                      FlSpot(3, 2),
                      FlSpot(5, 5),
                      FlSpot(7, 2.5),
                      FlSpot(8, 4),
                      FlSpot(10, 3),
                      FlSpot(11, 4),
                    ],
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
