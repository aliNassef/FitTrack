import '../../data/model/meal_planner_model/daily_meal_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/app_shadows.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../core/widgets/custom_network_image.dart';

class MealItem extends StatelessWidget {
  const MealItem({
    super.key,
    required this.dailyMealModel,
  });
  final DailyMealModel dailyMealModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: AppShadows.shadow1,
        color: Colors.white,
      ),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 6.w),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        title: Text(
          dailyMealModel.name,
          style: AppStyles.medium14,
        ),
        subtitle: Text(
          'Today | ${dailyMealModel.time}',
          style: AppStyles.regular12.copyWith(
            color: AppColors.greyLighterColor,
          ),
        ),
        trailing: GestureDetector(
          onTap: () {},
          child: SvgPicture.asset(
            AppIcons.activeReminderIcon,
          ),
        ),
        leading: CustomNetworkImage(
          img: dailyMealModel.image,
          height: 48.h,
          width: 48.w,
        ),
      ),
    );
  }
}
