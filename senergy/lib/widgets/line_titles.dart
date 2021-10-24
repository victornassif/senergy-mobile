import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';

class LineTitles {
  static getTitleData() => FlTitlesData(
        show: true,
        bottomTitles: SideTitles(
          showTitles: true,
          margin: 8,
          reservedSize: 22,
          getTextStyles: (value) => const TextStyle(
            color: Color(0xff68737d)
          ),
          getTitles: (value) {
            switch (value.toInt()) {
              case 1:
                return 'JAN';
              case 2:
                return 'FEV';
              case 3:
                return 'MAR';
              case 4:
                return 'ABR';
              case 5:
                return 'MAI';
              case 6:
                return 'JUN';
              case 7:
                return 'JUL';
              case 8:
                return 'AGO';
              case 9:
                return 'SET';
              case 10:
                return 'OUT';
              case 11:
                return 'NOV';
              case 12:
                return 'DEZ';
              default:
                return '';
            }
          },
        ),
      );
}
