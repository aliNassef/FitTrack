import 'package:fit_track_app/core/utils/app_shadows.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/app_styles.dart';

class PopularMealItem extends StatelessWidget {
  const PopularMealItem({super.key, this.onTap});
  final void Function()? onTap;
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
          
          contentPadding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
          leading: Image.asset(AppImages.meal),
          title: Text(
            'Blueberry Pancake',
            style: AppStyles.medium14,
          ),
          subtitle: Text(
            'Medium | 30mins | 230kCal',
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
