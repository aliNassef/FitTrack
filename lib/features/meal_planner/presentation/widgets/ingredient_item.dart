
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_colors.dart';
 import '../../../../core/utils/app_styles.dart';
import '../../../../core/widgets/custom_network_image.dart';
import '../../data/model/meal_category_model/ingredients_model.dart';

class IngredientItem extends StatelessWidget {
  const IngredientItem({super.key, required this.ingredient});
  final IngredientModel ingredient;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 5.h,
      children: [
        Container(
          padding: const EdgeInsets.all(20),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: const Color(0xffF7F8F8),
            borderRadius: BorderRadius.circular(12),
          ),
          child: CustomNetworkImage(
            img: ingredient.image,
            height: 45.h,
            width: 45.w,
          ),
        ),
        Text(
          ingredient.name,
          style: AppStyles.regular12,
        ),
        Text(
          ingredient.quantity,
          style: AppStyles.regular10.copyWith(
            color: AppColors.greyLighterColor,
          ),
        ),
      ],
    );
  }
}
