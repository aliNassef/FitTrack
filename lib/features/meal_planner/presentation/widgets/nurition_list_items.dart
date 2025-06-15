import '../../data/model/meal_category_model/meal_nutrition_model.dart';
import 'nurition_item.dart';
import 'package:flutter/material.dart';

import '../../../../core/helpers/app_spacer.dart';

class NutritionListItems extends StatelessWidget {
  const NutritionListItems({super.key, required this.mealNutritionModel});
  final MealNutritionModel mealNutritionModel;
  @override
  Widget build(BuildContext context) {
    List<Map<String, num>> nutritionMap = [
      {
        'Calories': mealNutritionModel.calories,
      },
      {
        'Fats': mealNutritionModel.fats,
      },
      {
        'Proteins': mealNutritionModel.proteins,
      },
    ];
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemBuilder: (_, index) {
        return NutritionItem(
          mealNutritionModel: nutritionMap[index],
        );
      },
      separatorBuilder: (_, __) => const HorizontalSpace(15),
      itemCount: nutritionMap.length,
    );
  }
}
