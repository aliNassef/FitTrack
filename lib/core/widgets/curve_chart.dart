import 'package:fit_track_app/core/extensions/mediaquery_size.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class CurveChart extends StatelessWidget {
  const CurveChart({super.key, this.textColor = Colors.white});
  final Color textColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(20),
      ),
      height: context.height * .3,
      child: LineChart(
        LineChartData(
          maxY: 10,
          minY: 0,
          gridData: _backgroundStyle(),
          borderData: _borderStyle(),
          titlesData: _borderTitlesData(textColor),
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
        const FlSpot(0, 0),
        const FlSpot(1, 3),
        const FlSpot(2, 4),
        const FlSpot(3, 6),
        const FlSpot(4, 8),
        const FlSpot(5, 10),
        const FlSpot(6, 0),
      ],
    );
  }
}

FlBorderData _borderStyle() {
  return FlBorderData(
    show: true,
    border: const Border.symmetric(
      horizontal: BorderSide(
        color: Color(0xffF7F8F8),
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
      return const FlLine(
        color: Color(0xffF7F8F8),
        strokeWidth: 1,
      );
    },
  );
}

FlTitlesData _borderTitlesData(Color textColor) {
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
              style: TextStyle(
                color: textColor,
                fontSize: 12,
              ),
            ),
          );
        },
      ),
    ),
    topTitles: const AxisTitles(
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
              style: TextStyle(
                color: textColor,
                fontSize: 10,
                letterSpacing: 0.5,
              ),
            ),
          );
        },
      ),
    ),
    leftTitles: const AxisTitles(
      sideTitles: SideTitles(
        showTitles: false,
      ),
    ),
  );
}
