import 'package:flutter/material.dart';
import '../../data/model/meal_category_model/meal_item_model.dart';
import '../widgets/meal_details_view_body.dart';

class MealDetailsView extends StatelessWidget {
  const MealDetailsView({super.key, required this.meal});
  static const String routeName = 'meal-details';
  final MealItemModel meal;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MealDetailsViewBody(
        meal: meal,
      ),
    );
  }
}
