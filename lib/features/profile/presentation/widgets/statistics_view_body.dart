import 'package:flutter/material.dart';

import '../../../../core/helpers/app_spacer.dart';
import '../../../../core/helpers/default_app_button.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../core/widgets/curve_chart.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import 'goal_progress_bar.dart';

class StatisticsViewBody extends StatelessWidget {
  const StatisticsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAppBar(
          title: 'Statistics',
          onBackButtonPressed: () {
            Navigator.pop(context);
          },
        ),
        const VerticalSpace(40),
        const CurveChart(
          textColor: AppColors.greyLighterColor,
        ),
        const VerticalSpace(60),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'May',
              style: AppStyles.semiBold16.copyWith(
                color: AppColors.greyLighterColor,
              ),
            ),
            Text(
              'May',
              style: AppStyles.semiBold16.copyWith(
                color: AppColors.greyLighterColor,
              ),
            ),
          ],
        ),
        const VerticalSpace(15),
        const GoalProgressBar(
          leftPercentage: 33,
          progressPercentage: 33,
          rightPercentage: 67,
          title: 'Lose Weight',
        ),
        const VerticalSpace(20),
        const GoalProgressBar(
          leftPercentage: 88,
          progressPercentage: 88,
          rightPercentage: 12,
          title: 'Height Increase',
        ),
        const VerticalSpace(20),
        const GoalProgressBar(
          leftPercentage: 33,
          progressPercentage: 33,
          rightPercentage: 67,
          title: 'Muscle Mass Increase',
        ),
        const VerticalSpace(20),
        const GoalProgressBar(
          leftPercentage: 88,
          progressPercentage: 88,
          rightPercentage: 12,
          title: 'Abs',
        ),
        const VerticalSpace(30),
        const DefaultAppButton(text: 'Back to Home'),
      ],
    );
  }
}
