import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';

class PersonalInfoItem extends StatelessWidget {
  const PersonalInfoItem({
    super.key,
    required this.title,
    required this.subTitle,
  });
  final String title;
  final String subTitle;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 24.w,
        vertical: 10.h,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Color(0xff1D1617).withValues(alpha: 0.07),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        spacing: 5.h,
        children: [
          ShaderMask(
            shaderCallback: (bounds) => const LinearGradient(
              colors: [
                AppColors.secondaryColor,
                AppColors.primaryColor,
              ],
            ).createShader(bounds),
            child: Text(
              title,
              style: AppStyles.medium14.copyWith(
                color: Colors.white,
              ),
            ),
          ),
          Text(
            subTitle,
            style: AppStyles.regular12.copyWith(
              color: AppColors.greyLighterColor,
            ),
          ),
        ],
      ),
    );
  }
}
