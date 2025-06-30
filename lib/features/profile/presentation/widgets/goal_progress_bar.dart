import '../../../../core/helpers/app_spacer.dart';
import '../../../../core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_styles.dart';

class GoalProgressBar extends StatelessWidget {
  final String title;
  final double progressPercentage;
  final int leftPercentage;
  final int rightPercentage;
  final Color progressColor;
  final Color backgroundColor;

  const GoalProgressBar({
    super.key,
    required this.title,
    required this.progressPercentage,
    required this.leftPercentage,
    required this.rightPercentage,
    this.progressColor = const Color(0xFF00D27A),
    this.backgroundColor = const Color(0xFFFFBFBF),
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          spacing: 5.w,
          children: [
            Text(
              '$leftPercentage%',
              style: AppStyles.regular12.copyWith(
                color: AppColors.greyLighterColor,
              ),
            ),
            Expanded(
              child: LinearProgressIndicator(
                borderRadius: BorderRadius.circular(99),
                value: progressPercentage / 100,
                minHeight: 20,
                backgroundColor: backgroundColor,
                color: progressColor,
              ),
            ),
            Text(
              '$rightPercentage%',
              style: AppStyles.regular12.copyWith(
                color: AppColors.greyLighterColor,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
