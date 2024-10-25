import 'package:assignment_lufick/presentation/widgets/indicator_widget.dart';
import 'package:assignment_lufick/presentation/widgets/pie_chart_sections.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class PieChartPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => PieChartPageState();
}

class PieChartPageState extends State {
  int touchedIndex=0;

  @override
  Widget build(BuildContext context) => Column(
    children: <Widget>[
      SizedBox(
        height: 300,
        child: PieChart(
          PieChartData(
            borderData: FlBorderData(show: false),
            sectionsSpace: 0,
            centerSpaceRadius: 40,
            sections: getSections(touchedIndex),
          ),
        ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: IndicatorsWidget(),
          ),
        ],
      ),
    ],
  );
}