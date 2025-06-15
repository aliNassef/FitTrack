 
import '../../features/meal_planner/data/model/meal_planner_model/nuration_model.dart';
import '../extensions/mediaquery_size.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class CurveChart extends StatelessWidget {
  const CurveChart({
    super.key,
    this.textColor = Colors.white,
    required this.nutritionModel,
  });
  final Color textColor;
  final NutritionModel nutritionModel;
  @override
  Widget build(BuildContext context) {
    double _getMaxNutritionValue() {
      return [
        nutritionModel.calories.toDouble(),
        nutritionModel.protein.toDouble(),
        nutritionModel.fat.toDouble(),
        nutritionModel.carbs.toDouble(),
        nutritionModel.fiber.toDouble(),
        nutritionModel.sugar.toDouble(),
      ].reduce((curr, next) => curr > next ? curr : next);
    }

    final _getMax = _getMaxNutritionValue();
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(20),
      ),
      height: context.height * .3,
      child: LineChart(
        LineChartData(
          maxY: _getMax * 1.2,
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
        FlSpot(0, nutritionModel.calories.toDouble()),
        FlSpot(1, nutritionModel.fat.toDouble()),
        FlSpot(2, nutritionModel.carbs.toDouble()),
        FlSpot(3, nutritionModel.protein.toDouble()),
        FlSpot(4, nutritionModel.fiber.toDouble()),
        FlSpot(5, nutritionModel.sugar.toDouble()),
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
          const nurititons = [
            'Calories',
            'Fat',
            'Carbs',
            'Protein',
            'Fiber',
            'Sugar',
          ];
          return Padding(
            padding: const EdgeInsets.only(top: 12),
            child: Text(
              nurititons[value.toInt()],
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
        showTitles: false,
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
