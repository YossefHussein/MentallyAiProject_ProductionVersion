import 'package:flutter/material.dart';
import 'package:mental_health_app/core/theme.dart';
import 'package:mental_health_app/features/presentation/meditation/data/model/chart_mode_data_model.dart';
import 'package:mental_health_app/features/presentation/meditation/widgets/custom_mood_bottomsheet.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ChartWidget extends StatefulWidget {
  const ChartWidget({Key? key}) : super(key: key);

  @override
  ChartState createState() => ChartState();
}

class ChartState extends State<ChartWidget> {
  ChartState({Key? key});

  late TrackballBehavior _trackballBehavior;

  @override
  void initState() {
    _trackballBehavior = TrackballBehavior(
        enable: true,
        // Display mode of trackball tooltip
        tooltipDisplayMode: TrackballDisplayMode.floatAllPoints);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      title: ChartTitle(
        text: 'Line Chart',
        textStyle:  Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.black),
      ),
      trackballBehavior: _trackballBehavior,
      primaryXAxis: CategoryAxis(),
      primaryYAxis: NumericAxis(minimum: 0, maximum: 30, interval: 7),
      series: <SplineSeries<ChartModeDataModel, num>>[
        SplineSeries<ChartModeDataModel, num>(
          animationDuration: 1,
          dataSource: chartModeData,
          color: DefaultColors.pink,
          xValueMapper: (ChartModeDataModel sales, _) => sales.happyXValueNum,
          yValueMapper: (ChartModeDataModel sales, _) => sales.happyYValueNum,
          name: 'Happy',
        ),
        SplineSeries<ChartModeDataModel, num>(
          animationDuration: 1,
          dataSource: chartModeData,
          color: DefaultColors.purple,
          xValueMapper: (ChartModeDataModel sales, _) => sales.calmXValueNum,
          yValueMapper: (ChartModeDataModel sales, _) => sales.clamYValueNum,
          name: 'Clam',
        ),
        SplineSeries<ChartModeDataModel, num>(
          animationDuration: 1,
          dataSource: chartModeData,
          color: DefaultColors.orange,
          xValueMapper: (ChartModeDataModel sales, _) => sales.relaxXValueNum,
          yValueMapper: (ChartModeDataModel sales, _) => sales.relaxYValueNum,
          name: 'Relax',
        ),
        SplineSeries<ChartModeDataModel, num>(
          animationDuration: 1,
          dataSource: chartModeData,
          color: DefaultColors.lightTeal,
          xValueMapper: (ChartModeDataModel sales, _) => sales.focusXValueNum,
          yValueMapper: (ChartModeDataModel sales, _) => sales.focusYValueNum,
          name: 'Focus',
        ),
      ],
    );
  }
}

class ChartBubble extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  ChartBubble({super.key});

  @override
  State<ChartBubble> createState() => _BarSeriesState();
}

class _BarSeriesState extends State<ChartBubble> {
  late TrackballBehavior _trackballBehavior;

  @override
  void initState() {
    _trackballBehavior = TrackballBehavior(
        enable: true,
        // Display mode of trackball tooltip
        tooltipDisplayMode: TrackballDisplayMode.floatAllPoints);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
        primaryXAxis: CategoryAxis(),
        primaryYAxis: NumericAxis(minimum: 0, maximum: 30, interval: 7),
        trackballBehavior: _trackballBehavior,
        title: ChartTitle(
          text: 'Bubble Chart',
          textStyle:  Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.black),
        ),
        series: <CartesianSeries<ChartModeDataModel, num>>[
          BubbleSeries<ChartModeDataModel, num>(
            dataSource: chartModeData,
            color: DefaultColors.pink,
            xValueMapper: (ChartModeDataModel sales, _) => sales.happyXValueNum,
            yValueMapper: (ChartModeDataModel sales, _) => sales.happyYValueNum,
            name: 'Happy',
          ),
          BubbleSeries<ChartModeDataModel, num>(
            animationDuration: 1,
            dataSource: chartModeData,
            color: DefaultColors.purple,
            xValueMapper: (ChartModeDataModel sales, _) => sales.calmXValueNum,
            yValueMapper: (ChartModeDataModel sales, _) => sales.clamYValueNum,
            name: 'Clam',
          ),
          BubbleSeries<ChartModeDataModel, num>(
            animationDuration: 1,
            dataSource: chartModeData,
            color: DefaultColors.orange,
            xValueMapper: (ChartModeDataModel sales, _) => sales.relaxXValueNum,
            yValueMapper: (ChartModeDataModel sales, _) => sales.relaxYValueNum,
            name: 'Relax',
          ),
          BubbleSeries<ChartModeDataModel, num>(
            animationDuration: 1,
            dataSource: chartModeData,
            color: DefaultColors.lightTeal,
            xValueMapper: (ChartModeDataModel sales, _) => sales.focusXValueNum,
            yValueMapper: (ChartModeDataModel sales, _) => sales.focusYValueNum,
            name: 'Focus',
          ),
        ]);
  }
}

class ColumnSeriesChartWidget extends StatefulWidget {
  const ColumnSeriesChartWidget({super.key});

  @override
  State<ColumnSeriesChartWidget> createState() =>
      _ColumnSeriesChartWidgetState();
}

class _ColumnSeriesChartWidgetState extends State<ColumnSeriesChartWidget> {
  @override
  Widget build(BuildContext context) {
    return  SfCartesianChart(
        primaryXAxis: CategoryAxis(),
        primaryYAxis: NumericAxis(minimum: 0, maximum: 30, interval: 7),
        title: ChartTitle(
          text: 'ColumnSeries Chart',
          textStyle:  Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.black),
        ),
        series: <CartesianSeries<ChartModeDataModel, num>>[
          ColumnSeries<ChartModeDataModel, num>(
            dataSource: chartModeData,
            color: DefaultColors.pink,
            xValueMapper: (ChartModeDataModel sales, _) => sales.happyXValueNum,
            yValueMapper: (ChartModeDataModel sales, _) => sales.happyYValueNum,
            name: 'Happy',
          ),
          ColumnSeries<ChartModeDataModel, num>(
            animationDuration: 1,
            dataSource: chartModeData,
            color: DefaultColors.purple,
            xValueMapper: (ChartModeDataModel sales, _) => sales.calmXValueNum,
            yValueMapper: (ChartModeDataModel sales, _) => sales.clamYValueNum,
            name: 'Clam',
          ),
          ColumnSeries<ChartModeDataModel, num>(
            animationDuration: 1,
            dataSource: chartModeData,
            color: DefaultColors.orange,
            xValueMapper: (ChartModeDataModel sales, _) => sales.relaxXValueNum,
            yValueMapper: (ChartModeDataModel sales, _) => sales.relaxYValueNum,
            name: 'Relax',
          ),
          ColumnSeries<ChartModeDataModel, num>(
            animationDuration: 1,
            dataSource: chartModeData,
            color: DefaultColors.lightTeal,
            xValueMapper: (ChartModeDataModel sales, _) => sales.focusXValueNum,
            yValueMapper: (ChartModeDataModel sales, _) => sales.focusYValueNum,
            name: 'Focus',
          ),
        ],
    );
  }
}
