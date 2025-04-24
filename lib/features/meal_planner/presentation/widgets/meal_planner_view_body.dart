import 'package:fit_track_app/core/helpers/app_spacer.dart';
import 'package:fit_track_app/core/widgets/curve_chart.dart';
import 'package:fit_track_app/core/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_gradients.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../core/widgets/title_with_customdropdown.dart';

class MealPlannerViewBody extends StatelessWidget {
  const MealPlannerViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomAppBar(
          title: 'Meal Planner',
        ),
        const VerticalSpace(30),
        const TitleWithCustomDropDown(
          title: 'Meal Nutritions',
          gradientColor: AppGradients.purpleGradient,
        ),
        const CurveChart(),
        const VerticalSpace(30),
        Container(
          padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 20.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: AppColors.secondaryColor,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Daily Meal Schedule',
                style: AppStyles.medium14,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: AppColors.primaryColor,
                ),
                child: Text(
                  'Check',
                  style: AppStyles.regular12.copyWith(
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
        ),
        const VerticalSpace(30),
        const TitleWithCustomDropDown(
          title: 'Today Meals',
          gradientColor: AppGradients.greenGradient,
        ),
        const VerticalSpace(18),
        
      ],
    );
  }
}
