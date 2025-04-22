import 'package:flutter/material.dart';

import '../widgets/meal_planner_view_body.dart';

class MealPlannerView extends StatelessWidget {
  const MealPlannerView({super.key});
  static const routeName = 'meal_planner_view';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: MealPlannerViewBody(),
    );
  }
}
