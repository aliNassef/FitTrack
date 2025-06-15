import 'package:flutter/material.dart';

import '../../../../core/helpers/app_spacer.dart';
import '../../data/model/meal_category_model/ingredients_model.dart';
import 'ingredient_item.dart';

class IngredientsListItems extends StatelessWidget {
  const IngredientsListItems({super.key, required this.mealIngredients});
  final List<IngredientModel> mealIngredients;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemBuilder: (_, index) {
        return IngredientItem(
          ingredient: mealIngredients[index],
        );
      },
      separatorBuilder: (_, __) => const HorizontalSpace(15),
      itemCount: mealIngredients.length,
    );
  }
}
