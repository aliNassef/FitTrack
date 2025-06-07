import '../../../../core/extensions/mediaquery_size.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class HomeChart extends StatelessWidget {
  const HomeChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: context.width,
      padding: const EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        color: const Color(0xfff4dffc),
        borderRadius: BorderRadius.circular(20),
      ),
      child: LineChart(
        LineChartData(
          lineBarsData: [
            LineChartBarData(
              spots: [
                const FlSpot(0, 1),
                const FlSpot(1, 2),
                const FlSpot(2, 3),
                const FlSpot(3, 4),
                const FlSpot(4, 5),
                const FlSpot(5, 6),
              ],
              isCurved: true,
              barWidth: 4,
              belowBarData: BarAreaData(show: false),
              dotData: const FlDotData(show: false),
            ),
          ],
          titlesData: _homeChartTitle(),
          gridData: _homeChartBackgroundStyle(),
          borderData: _homeChartBorderStyle(),
        ),
      ),
    );
  }

  FlGridData _homeChartBackgroundStyle() {
    return const FlGridData(
      show: false,
    );
  }

  FlBorderData _homeChartBorderStyle() {
    return FlBorderData(
      show: false,
    );
  }

  FlTitlesData _homeChartTitle() {
    return const FlTitlesData(
      leftTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: false,
        ),
      ),
      bottomTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: false,
        ),
      ),
      topTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: false,
        ),
      ),
      rightTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: false,
        ),
      ),
    );
  }
}
