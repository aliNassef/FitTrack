import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/service_locator.dart';
import '../cubits/get_meal_planner_cubit/get_meal_planner_cubit.dart';
import '../widgets/meal_planner_view_body.dart';

class MealPlannerView extends StatelessWidget {
  const MealPlannerView({super.key});
  static const routeName = 'meal_planner_view';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: BlocProvider(
          create: (context) =>
              injector<GetMealPlannerCubit>()..getMealPlanner(),
          child: const SingleChildScrollView(
            child: MealPlannerViewBody(),
          ),
        ),
      ),
    );
  }
}
