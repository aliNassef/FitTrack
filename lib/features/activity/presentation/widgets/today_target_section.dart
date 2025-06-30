import '../../../../core/widgets/custom_failure_widget.dart';
import '../cubits/get_activity_cubit/get_activity_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/app_styles.dart';
import 'add_daily_target.dart';
import 'target_today_item.dart';

class TodayTargetSection extends StatelessWidget {
  const TodayTargetSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xfff6e3fa),
        borderRadius: BorderRadius.circular(22),
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        spacing: 15.h,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Today Target',
                style: AppStyles.semiBold16,
              ),
              const AddDailyTarget()
            ],
          ),
          BlocBuilder<GetActivityCubit, GetActivityState>(
            buildWhen: (previous, current) =>
                current is GetActivitySuccess ||
                current is GetActivityFailure ||
                current is GetActivityLoading,
            builder: (context, state) {
              if (state is GetActivitySuccess) {
                return Row(
                  spacing: 15.w,
                  children: [
                    Expanded(
                      child: TargetTodayItem(
                        title: state
                            .activityTrackerModel.data.dailyTarget.waterIntake
                            .toString(),
                        subTitle: 'Water intake',
                        image: AppIcons.cupOfWaterIcon,
                      ),
                    ),
                    Expanded(
                      child: TargetTodayItem(
                        title: state
                            .activityTrackerModel.data.dailyTarget.footSteps
                            .toString(),
                        subTitle: 'Foot Steps',
                        image: AppIcons.footStepIcon,
                      ),
                    )
                  ],
                );
              } else if (state is GetActivityFailure) {
                return CustomFailureWidget(errMessage: state.errorMessage);
              } else if (state is GetActivityLoading) {
                return Skeletonizer(
                  enabled: true,
                  child: Row(
                    spacing: 15.w,
                    children: [
                      const Expanded(
                        child: TargetTodayItem(
                          title: '8L',
                          subTitle: 'Water intake',
                          image: AppIcons.cupOfWaterIcon,
                        ),
                      ),
                      const Expanded(
                        child: TargetTodayItem(
                          title: '2400',
                          subTitle: 'Foot Steps',
                          image: AppIcons.footStepIcon,
                        ),
                      )
                    ],
                  ),
                );
              }
              return const SizedBox.shrink();
            },
          ),
        ],
      ),
    );
  }
}
