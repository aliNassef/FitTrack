import 'package:fit_track_app/core/extensions/mediaquery_size.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
 
class CurveChart extends StatelessWidget {
  const CurveChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      height: context.height * .3,
      child: LineChart(
        LineChartData(
          maxY: 10,
          minY: 0,
          gridData: _backgroundStyle(),
          borderData: _borderStyle(),
          titlesData: _borderTitlesData(),
          lineBarsData: [
            _chartItemLine(),
          ],
        ),
      ),
    );
  }

  LineChartBarData _chartItemLine() {
    return LineChartBarData(
      isCurved: true,
      show: true,
      spots: [
        FlSpot(0, 0),
        FlSpot(1, 3),
        FlSpot(2, 4),
        FlSpot(3, 6),
        FlSpot(4, 8),
        FlSpot(5, 10),
        FlSpot(6, 0),
      ],
    );
  }
}

FlBorderData _borderStyle() {
  return FlBorderData(
    show: true,
    border: Border.symmetric(
      horizontal: BorderSide(
        color: Colors.black.withValues(alpha: 0.2),
        width: 1,
      ),
    ),
  );
}

FlGridData _backgroundStyle() {
  return FlGridData(
    show: true,
    drawVerticalLine: false,
    drawHorizontalLine: true,
    horizontalInterval: 2,
    checkToShowHorizontalLine: (value) => true,
    getDrawingHorizontalLine: (value) {
      return FlLine(
        color: Colors.black.withValues(alpha: 0.2),
        strokeWidth: 1,
      );
    },
  );
}

FlTitlesData _borderTitlesData() {
  return FlTitlesData(
    show: true,
    bottomTitles: AxisTitles(
      sideTitles: SideTitles(
        showTitles: true,
        reservedSize: 30,
        interval: 1,
        getTitlesWidget: (value, meta) {
          const days = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
          return Padding(
            padding: const EdgeInsets.only(top: 12),
            child: Text(
              days[value.toInt()],
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 12,
              ),
            ),
          );
        },
      ),
    ),
    topTitles: AxisTitles(
      sideTitles: SideTitles(
        showTitles: false,
      ),
    ),
    rightTitles: AxisTitles(
      sideTitles: SideTitles(
        showTitles: true,
        interval: 2,
        reservedSize: 40,
        getTitlesWidget: (value, meta) {
          return Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Text(
              '${(value * 10).toInt()}%',
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 10,
                letterSpacing: 0.5,
              ),
            ),
          );
        },
      ),
    ),
    leftTitles: AxisTitles(
      sideTitles: SideTitles(
        showTitles: false,
      ),
    ),
  );
}
