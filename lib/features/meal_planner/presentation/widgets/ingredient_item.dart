
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/app_styles.dart';

class IngredientItem extends StatelessWidget {
  const IngredientItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 5.h,
      children: [
        Container(
          padding: const EdgeInsets.all(20),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: const Color(0xffF7F8F8),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Image.asset(
            AppImages.meal,
            width: 45.w,
            height: 45.h,
          ),
        ),
        Text(
          'Blueberry',
          style: AppStyles.regular12,
        ),
        Text(
          '100gr',
          style: AppStyles.regular10.copyWith(
            color: AppColors.greyLighterColor,
          ),
        ),
      ],
    );
  }
}
