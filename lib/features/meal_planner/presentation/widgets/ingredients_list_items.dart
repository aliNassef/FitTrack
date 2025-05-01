import 'package:flutter/material.dart';

import '../../../../core/helpers/app_spacer.dart';
import 'ingredient_item.dart';

class IngredientsListItems extends StatelessWidget {
  const IngredientsListItems({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemBuilder: (_, __) {
        return const IngredientItem();
      },
      separatorBuilder: (_, __) => const HorizontalSpace(15),
      itemCount: 10,
    );
  }
}
