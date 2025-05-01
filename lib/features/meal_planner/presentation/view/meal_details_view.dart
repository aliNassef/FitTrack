import 'package:flutter/material.dart';
import '../widgets/meal_details_view_body.dart';

class MealDetailsView extends StatelessWidget {
  const MealDetailsView({super.key});
  static const String routeName = 'meal-details';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: MealDetailsViewBody(),
    );
  }
}
