import 'package:fit_track_app/core/utils/app_shadows.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fit_track_app/core/utils/app_styles.dart';
import 'package:fit_track_app/core/utils/app_colors.dart';
import 'package:fit_track_app/core/helpers/app_spacer.dart';

class CaloriesProgressBar extends StatelessWidget {
  final int calories;
  final int maxCalories;
  final double progress;

  const CaloriesProgressBar({
    super.key,
    required this.calories,
    this.maxCalories = 2000,
  }) : progress = calories / maxCalories;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: AppShadows.shadow1,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Row(
                children: [
                  Text(
                    'Calories',
                    style: AppStyles.medium12,
                  ),
                  const HorizontalSpace(8),
                  const Icon(
                    Icons.local_fire_department,
                    color: Colors.red,
                    size: 20,
                  ),
                ],
              ),
              const Spacer(),
              Text(
                '$calories kCal',
                style: AppStyles.regular12.copyWith(
                  color: AppColors.greyLighterColor,
                ),
              ),
            ],
          ),
          const VerticalSpace(5),
          LinearProgressIndicator(
            value: progress,
            borderRadius: BorderRadius.circular(99),
            backgroundColor: const Color(0xffF7F8F8),
            valueColor: const AlwaysStoppedAnimation<Color>(
              Color(0xffC150F6),
            ),
            minHeight: 10.h,
          ),
        ],
      ),
    );
  }
}
