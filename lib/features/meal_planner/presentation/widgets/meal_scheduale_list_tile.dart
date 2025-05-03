
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_gradients.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/app_styles.dart';

class MealSchedualeListTile extends StatelessWidget {
  const MealSchedualeListTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        width: 60.w,
        height: 60.h,
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: AppGradients.greenGradient,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Image.asset(
          AppImages.meal,
        ),
      ),
      contentPadding: EdgeInsets.zero,
      title: Text(
        'Honey Pancake',
        style: AppStyles.medium14,
      ),
      subtitle: Text(
        '07:00am',
        style: AppStyles.regular12.copyWith(
          color: AppColors.greyLighterColor,
        ),
      ),
      trailing: SvgPicture.asset(AppIcons.rightArrow),
    );
  }
}