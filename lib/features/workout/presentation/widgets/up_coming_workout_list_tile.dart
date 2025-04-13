import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/app_shadows.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../core/widgets/custom_switch.dart';

class UpComingWorkoutListTile extends StatelessWidget {
  const UpComingWorkoutListTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: AppShadows.shadow1,
        borderRadius: BorderRadius.circular(16),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: CircleAvatar(
          radius: 25.r,
          backgroundColor: AppColors.secondaryColor,
          child: Image.asset(
            AppImages.dummy,
            width: 36.w,
            height: 36.h,
          ),
        ),
        title: Text(
          'Fullbody Workout',
          style: AppStyles.medium12,
        ),
        subtitle: Text(
          'Today, 03:00pm',
          style: AppStyles.regular10.copyWith(
            color: AppColors.greyLighterColor,
          ),
        ),
        trailing: const CustomSwitch(),
      ),
    );
  }
}
