/// Example of a combo time series chart with two series rendered as lines, and
/// a third rendered as points along the top line with a different color.
///
/// This example demonstrates a method for drawing points along a line using a
/// different color from the main series color. The line renderer supports
/// drawing points with the "includePoints" option, but those points will share
/// the same color as the line.
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class SimpleTimeSeriesChart extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  SimpleTimeSeriesChart(this.seriesList, {this.animate});

  /// Creates a [TimeSeriesChart] with sample data and no transition.
  factory SimpleTimeSeriesChart.withSampleData() {
    return new SimpleTimeSeriesChart(
      _createSampleData(),
      // Disable animations for image tests.
      animate: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return new charts.TimeSeriesChart(
      seriesList,
      animate: animate,
      customSeriesRenderers: [
        new charts.LineRendererConfig(
            // ID used to link series to this renderer.
            customRendererId: 'customArea',
            includePoints: true,
            includeArea: true,
            stacked: true),
      ],
      domainAxis: charts.DateTimeAxisSpec(
        tickFormatterSpec: charts.AutoDateTimeTickFormatterSpec(
          // day: charts.TimeFormatterSpec(
          //   format: 'EEE',
          //   transitionFormat: 'EEE',
          // ),
          month: charts.TimeFormatterSpec(
            format: 'MMM',
            transitionFormat: 'MMM' 
          )
        ),
      ),
    );
  }

  /// Create one series with sample hard coded data.
  static List<charts.Series<TimeSeriesSales, DateTime>> _createSampleData() {
    final orcado = [
      new TimeSeriesSales(new DateTime(2021, 2, 1), 40),
      new TimeSeriesSales(new DateTime(2021, 3, 1), 70),
      new TimeSeriesSales(new DateTime(2021, 4, 1), 60),
      new TimeSeriesSales(new DateTime(2021, 5, 1), 80),
      new TimeSeriesSales(new DateTime(2021, 6, 1), 100),
      new TimeSeriesSales(new DateTime(2021, 7, 1), 60),
      new TimeSeriesSales(new DateTime(2021, 8, 1), 70),
      new TimeSeriesSales(new DateTime(2021, 9, 1), 84),
      new TimeSeriesSales(new DateTime(2021, 10, 1), 120)
    ];

    final realizado = [
      new TimeSeriesSales(new DateTime(2021, 2, 1), 10 + 40),
      new TimeSeriesSales(new DateTime(2021, 3, 1), 0 + 70),
      new TimeSeriesSales(new DateTime(2021, 4, 1), 10 + 60),
      new TimeSeriesSales(new DateTime(2021, 5, 1), 10 + 80),
      new TimeSeriesSales(new DateTime(2021, 6, 1), 0 + 100),
      new TimeSeriesSales(new DateTime(2021, 7, 1), 10 + 60),
      new TimeSeriesSales(new DateTime(2021, 8, 1), 10 + 70),
      new TimeSeriesSales(new DateTime(2021, 9, 1), 10 + 80),
      new TimeSeriesSales(new DateTime(2021, 10, 1), 0 + 120)
    ];

    return [
      new charts.Series<TimeSeriesSales, DateTime>(
        id: 'Desktop',
        colorFn: (_, __) => charts.MaterialPalette.yellow.shadeDefault,
        domainFn: (TimeSeriesSales sales, _) => sales.time,
        measureFn: (TimeSeriesSales sales, _) => sales.sales,
        data: orcado,
      )
        // Configure our custom bar target renderer for this series.
        ..setAttribute(charts.rendererIdKey, 'customArea'),
      new charts.Series<TimeSeriesSales, DateTime>(
        id: 'Tablet',
        colorFn: (_, __) => charts.MaterialPalette.gray.shade300,
        seriesColor: charts.MaterialPalette.red.shadeDefault,
        domainFn: (TimeSeriesSales sales, _) => sales.time,
        measureFn: (TimeSeriesSales sales, _) => sales.sales,
        data: realizado,
      ),
    ];
  }
}

/// Sample time series data type.
class TimeSeriesSales {
  final DateTime time;
  final int sales;
  String timeStr;

  TimeSeriesSales(this.time, this.sales) {
    timeStr = time.month.toString();
  }
}
