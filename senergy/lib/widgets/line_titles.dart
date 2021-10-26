import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LineTitles {
  static getTitleData() => FlTitlesData(
      show: true,
      bottomTitles: SideTitles(
        showTitles: true,
        margin: 10,
        reservedSize: 22,
        getTextStyles: (value) => const TextStyle(
          color: Colors.grey,
          fontSize: 12,
        ),
        getTitles: (value) {
          return value.toStringAsFixed(0) + '/10';
        },
      ),
      leftTitles: SideTitles(
        showTitles: true,
        margin: 10,
        interval: 1,
        getTitles: (e) {
          return e.toStringAsFixed(0) + 'R\$';
        },
        getTextStyles: (value) => const TextStyle(
          color: Colors.grey,
          fontSize: 12,
        ),
      ));
}
