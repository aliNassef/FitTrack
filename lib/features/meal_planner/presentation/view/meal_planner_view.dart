import 'package:fit_track_app/core/extensions/padding_extension.dart';
import 'package:flutter/material.dart';

import '../widgets/meal_planner_view_body.dart';

class MealPlannerView extends StatelessWidget {
  const MealPlannerView({super.key});
  static const routeName = 'meal_planner_view';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: const MealPlannerViewBody().withHorizontalPadding(30),
        ),
      ),
    );
  }
}
