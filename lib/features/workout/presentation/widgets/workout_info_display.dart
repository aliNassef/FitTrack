import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/helpers/app_spacer.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/app_styles.dart';

class WorkoutInfoDisplay extends StatelessWidget {
  const WorkoutInfoDisplay({
    super.key,
    required this.image,
    required this.title,
    required this.date,
    required this.backgroundColor,
  });
  final String image;
  final String title;
  final String date;
  final Color backgroundColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 15.w,
        vertical: 14.h,
      ),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          SvgPicture.asset(image),
          const HorizontalSpace(10),
          Text(
            title,
            style: AppStyles.regular12.copyWith(
              color: AppColors.greyLighterColor,
            ),
          ),
          const Spacer(),
          Text(
            date,
            style: AppStyles.regular10.copyWith(
              color: AppColors.greyLighterColor,
            ),
          ),
          const HorizontalSpace(10),
          Transform.rotate(
            angle: 3.14,
            child: SvgPicture.asset(
              AppIcons.backArrowIcon,
              colorFilter: const ColorFilter.mode(
                AppColors.greyLighterColor,
                BlendMode.srcIn,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
