import 'package:fit_track_app/core/helpers/app_spacer.dart';
import 'package:fit_track_app/core/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class MealPlannerViewBody extends StatelessWidget {
  const MealPlannerViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        CustomAppBar(
          title: 'Meal Planner',
        ),
        VerticalSpace(30),
        
      ],
    );
  }
}
