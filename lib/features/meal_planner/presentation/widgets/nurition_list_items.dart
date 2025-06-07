import 'nurition_item.dart';
import 'package:flutter/material.dart';

import '../../../../core/helpers/app_spacer.dart';

class NutritionListItems extends StatelessWidget {
  const NutritionListItems({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemBuilder: (_, __) {
        return const NutritionItem();
      },
      separatorBuilder: (_, __) => const HorizontalSpace(15),
      itemCount: 10,
    );
  }
}