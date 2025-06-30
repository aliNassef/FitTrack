import '../../../../core/widgets/custom_network_image.dart';
import '../../data/model/meal_category_model/meal_item_model.dart';

import '../../../../core/utils/app_shadows.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/app_styles.dart';

class PopularMealItem extends StatelessWidget {
  const PopularMealItem({super.key, this.onTap, required this.meal});
  final void Function()? onTap;
  final MealItemModel meal;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          boxShadow: AppShadows.shadow1,
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: ListTile(
          contentPadding:
              EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
          leading: CustomNetworkImage(
            img: meal.image,
            height: 45.h,
            width: 45.w,
          ),
          title: Text(
            meal.name,
            style: AppStyles.medium14,
          ),
          subtitle: Text(
            '${meal.difficulty} | ${meal.time}mins | ${meal.calories}kCal',
            style: AppStyles.regular12.copyWith(
              color: AppColors.greyLighterColor,
            ),
          ),
          trailing: SvgPicture.asset(AppIcons.goToIcon),
        ),
      ),
    );
  }
}
