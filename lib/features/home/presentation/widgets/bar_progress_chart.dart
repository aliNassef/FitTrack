import 'package:fit_track_app/core/extensions/mediaquery_size.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class BarProgressChart extends StatelessWidget {
  const BarProgressChart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      height: context.height * .3,
      child: _BarChart(
        precentages: [
          10,
          20,
          30,
          40,
          50,
          60,
          70,
        ],
      ),
    );
  }
}

class _BarChart extends StatelessWidget {
  const _BarChart({required this.precentages});
  final List<double> precentages;
  @override
  Widget build(BuildContext context) {
    return BarChart(
      BarChartData(
        maxY: 100,
        minY: 0,
        groupsSpace: 20,
        alignment: BarChartAlignment.spaceBetween,
        barTouchData: BarTouchData(
          enabled: false,
        ),
        titlesData: _borderTitlesData(),
        gridData: _backgroundStyle(),
        borderData: _borderStyle(),
        backgroundColor: Colors.white,
        barGroups: List.generate(
          7,
          (index) => BarChartGroupData(
            x: index,
            barRods: [
              _chartItem(
                toY: precentages[index],
                index: index,
              ),
            ],
          ),
        ),
      ),
    );
  }

  FlTitlesData _borderTitlesData() {
    return FlTitlesData(
      bottomTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          getTitlesWidget: (value, meta) {
            var days = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
            return Padding(
              padding: const EdgeInsets.only(
                top: 7,
              ),
              child: Text(
                days[value.toInt()],
                style: TextStyle(
                  color: Colors.black,
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
          showTitles: false,
        ),
      ),
      leftTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: false,
        ),
      ),
    );
  }

  FlGridData _backgroundStyle() {
    return FlGridData(
      show: false,
      drawVerticalLine: false,
    );
  }

  BarChartRodData _chartItem({required double toY, required int index}) {
    return BarChartRodData(
      toY: toY,
      backDrawRodData: BackgroundBarChartRodData(
        color: Color(0xffF7F8F8),
        fromY: 0,
        toY: 100,
        show: true,
      ),
      // color: color,
      borderRadius: BorderRadius.circular(20),
      gradient: LinearGradient(
        colors: index % 2 == 0
            ? [
                Color(0xff00F0FF),
                Color(0xff00FF66),
              ]
            : [
                Color(0xffEEA4CE),
                Color(0xffC150F6),
              ],
      ),
      width: 22,
    );
  }

  FlBorderData _borderStyle() {
    return FlBorderData(
      show: false,
      border: Border.all(
        color: Colors.white,
        width: 2,
      ),
    );
  }
}
