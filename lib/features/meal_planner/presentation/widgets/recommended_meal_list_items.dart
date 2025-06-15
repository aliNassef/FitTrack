import 'package:fit_track_app/core/widgets/custom_network_image.dart';
import 'package:fit_track_app/features/meal_planner/data/model/meal_category_model/meal_item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/app_spacer.dart';
import '../../../../core/helpers/default_app_button.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/app_styles.dart';

class RecommendedMealListItems extends StatelessWidget {
  const RecommendedMealListItems({
    super.key,
    required this.meals,
  });
  final List<MealItemModel> meals;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Container(
          width: 200.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: AppColors.greenLightColor,
          ),
          child: Column(
            children: [
              const VerticalSpace(30),
              CustomNetworkImage(
                img: meals[index].image,
                height: 80.h,
              ),
              const VerticalSpace(15),
              Text(
                meals[index].name,
                style: AppStyles.medium14,
              ),
              const VerticalSpace(5),
              Text(
                '${meals[index].difficulty} | ${meals[index].time}mins | ${meals[index].calories}kCal',
                style: AppStyles.regular12.copyWith(
                  color: AppColors.greyLighterColor,
                ),
              ),
              const VerticalSpace(15),
              SizedBox(
                width: 110.w,
                height: 38.h,
                child: const DefaultAppButton(text: 'View'),
              ),
            ],
          ),
        ),
        separatorBuilder: (context, index) => const HorizontalSpace(15),
        itemCount: meals.length,
      ),
    );
  }
}
