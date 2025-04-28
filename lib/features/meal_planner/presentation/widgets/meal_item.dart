import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/app_shadows.dart';
import '../../../../core/utils/app_styles.dart';

class MealItem extends StatelessWidget {
  const MealItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(boxShadow: AppShadows.shadow1),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(vertical: 19.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        title: Text(
          'Salmon Nigiri',
          style: AppStyles.medium14,
        ),
        subtitle: Text(
          'Today | 7am',
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
        leading: SvgPicture.asset(AppIcons.achivementsIcon),
      ),
    );
  }
}
