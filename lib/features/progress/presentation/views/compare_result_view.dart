import 'package:fit_track_app/core/extensions/padding_extension.dart';
import 'package:fit_track_app/core/helpers/app_spacer.dart';
import 'package:fit_track_app/core/widgets/custom_app_bar.dart';
import 'package:fit_track_app/core/widgets/custom_network_image.dart';
import 'package:fit_track_app/features/profile/presentation/widgets/goal_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_gradients.dart';
import '../../../../core/utils/app_styles.dart';
import '../../data/model/progress_comparison_model.dart';

class CompareResultView extends StatelessWidget {
  const CompareResultView({super.key, required this.comparisonModel});
  static const String routeName = 'compareResultView';
  final ProgressComparisonModel comparisonModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CustomAppBar(
              title: 'Comparison Result',
              onBackButtonPressed: () {
                Navigator.pop(context);
              },
            ),
            const VerticalSpace(40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Average Progress',
                  style: AppStyles.semiBold16.copyWith(
                    color: AppColors.blackColor,
                  ),
                ),
                Text(
                  (comparisonModel.progressPercentage?.toDouble() ?? 0) > 50
                      ? 'Good'
                      : 'Bad',
                  style: AppStyles.medium12.copyWith(
                    color:
                        (comparisonModel.progressPercentage?.toDouble() ?? 0) >
                                50
                            ? const Color(0xff42D742)
                            : const Color(0xFFFFBFBF),
                  ),
                )
              ],
            ),
            const VerticalSpace(15),
            GoalProgressBar(
              leftPercentage: comparisonModel.progressPercentage?.toInt() ?? 0,
              progressPercentage:
                  comparisonModel.progressPercentage?.toDouble() ?? 0,
              rightPercentage:
                  100 - (comparisonModel.progressPercentage?.toInt() ?? 0),
              title: '',
            ),
            const VerticalSpace(40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Before',
                  style: AppStyles.semiBold16.copyWith(
                    color: AppColors.greyLighterColor,
                  ),
                ),
                Text(
                  'After',
                  style: AppStyles.semiBold16.copyWith(
                    color: AppColors.greyLighterColor,
                  ),
                )
              ],
            ),
            const VerticalSpace(40),
            Row(
              spacing: 50.w,
              children: [
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(
                      vertical: 10.h,
                    ),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: AppGradients.pinkGradient,
                      ),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Text(
                      '${comparisonModel.beforePhoto.weight} Kg',
                      style: AppStyles.medium16.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(
                      vertical: 10.h,
                    ),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: AppGradients.pinkGradient,
                      ),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Text(
                      '${comparisonModel.afterPhoto.weight} Kg',
                      style: AppStyles.medium16.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const VerticalSpace(40),
            Row(
              children: [
                Expanded(
                  child: CustomNetworkImage(
                    height: 150.h,
                    radius: 20,
                    img: comparisonModel.beforePhoto.url,
                  ),
                ),
                const HorizontalSpace(50),
                Expanded(
                  child: CustomNetworkImage(
                    height: 150.h,
                    radius: 20,
                    img: comparisonModel.afterPhoto.url,
                  ),
                ),
              ],
            ),
          ],
        ).withHorizontalPadding(30),
      ),
    );
  }
}
