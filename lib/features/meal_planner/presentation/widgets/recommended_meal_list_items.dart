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
  });

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
              Image.asset(
                AppImages.meal,
                height: 80.h,
              ),
              const VerticalSpace(15),
              Text(
                'Honey Pancake',
                style: AppStyles.medium14,
              ),
              const VerticalSpace(5),
              Text(
                'Easy | 30mins | 180kCal',
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
        itemCount: 10,
      ),
    );
  }
}
