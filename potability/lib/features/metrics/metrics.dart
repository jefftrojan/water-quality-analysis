import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class Metrics extends StatelessWidget {
  const Metrics({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      body: Center(
        child: SizedBox(
          height: MediaQuery.of(context).size.height/2,
          width: MediaQuery.of(context).size.width * .9,
          child: LineChart(
            LineChartData(
              backgroundColor: Colors.white,
              titlesData: FlTitlesData(
                topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false))
              ),
              minX: 0,
              minY: 0,
              maxX: 5,
              maxY: 5,
              lineBarsData: [
                LineChartBarData(
                  spots: [FlSpot(0, 0),FlSpot(1, 2) ],
                  color: Colors.cyan,
                  barWidth: 6
                )
              ]
            )
          ),
        )
      ),
    );
  }
}
