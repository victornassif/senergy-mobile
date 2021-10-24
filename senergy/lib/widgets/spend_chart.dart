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
                maxX: 11,
                maxY: 6,
                minX: 0,
                minY: 0,
                titlesData: LineTitles.getTitleData(),
                borderData: FlBorderData(show: true, border: Border()),
                lineBarsData: [
                  LineChartBarData(
                    spots: [
                      FlSpot(0, 3),
                      FlSpot(2.6, 2),
                      FlSpot(4.9, 5),
                      FlSpot(6.8, 2.5),
                      FlSpot(8, 4),
                      FlSpot(9.5, 3),
                      FlSpot(11, 4),
                    ],
                    isCurved: true,
                    colors: [
                      Color(0xffFFDB00),
                    ],
                    barWidth: 3,
                    belowBarData: BarAreaData(
                      show: true,
                      colors: [Color(0xffFFDB00), Colors.white]
                          .map(
                            (e) => e.withOpacity(0.2),
                          )
                          .toList(),
                    ),
                    // dotData: FlDotData(
                      
                    //   getStrokeColor: (a,b,c){
                    //     return Color(0xffFFDB00);
                    //   },
                    //   getDotColor: (a, b, c) {
                    //     return Colors.white;
                    //   },
                    // ),
                  ),
                ],
              ),
              swapAnimationDuration: Duration(milliseconds: 150), // Optional
            ),
          ),
        ],
      ),
    );
  }
}
