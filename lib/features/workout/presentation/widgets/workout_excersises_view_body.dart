import 'package:fit_track_app/core/extensions/padding_extension.dart';
import 'package:fit_track_app/core/helpers/app_spacer.dart';
import 'package:fit_track_app/core/helpers/default_app_button.dart';
import 'package:fit_track_app/core/utils/app_styles.dart';
import 'package:fit_track_app/core/widgets/custom_head_title_and_subtitle_button.dart';
import 'package:fit_track_app/core/widgets/read_more_text.dart';
import 'package:fit_track_app/features/workout/presentation/widgets/step_item.dart';
import 'package:fit_track_app/features/workout/presentation/widgets/video_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../data/model/step_model.dart';

class WorkoutExerciseViewBody extends StatelessWidget {
  const WorkoutExerciseViewBody({super.key});
  static List<StepModel> steps = [
    StepModel(
      stepNumber: 1,
      title: 'Spread Your Arms',
      description:
          'To make the gestures feel more relaxed, stretch your arms as you start this movement. No bending of hands.',
    ),
    StepModel(
      stepNumber: 2,
      title: 'Spread Your Arms',
      description:
          'To make the gestures feel more relaxed, stretch your arms as you start this movement. No bending of hands.',
    ),
    StepModel(
      stepNumber: 3,
      title: 'Spread Your Arms',
      description:
          'To make the gestures feel more relaxed, stretch your arms as you start this movement. No bending of hands.',
    ),
    StepModel(
      stepNumber: 4,
      title: 'Spread Your Arms',
      description:
          'To make the gestures feel more relaxed, stretch your arms as you start this movement. No bending of hands.',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomAppBar(
            title: '',
          ),
          const VerticalSpace(30),
          const VideoSection(),
          const VerticalSpace(20),
          Text(
            'Jumping Jack',
            style: AppStyles.semiBold16,
          ),
          const VerticalSpace(5),
          Text(
            'Easy | 390 Calories Burn',
            style: AppStyles.regular12.copyWith(
              color: AppColors.greyLighterColor,
            ),
          ),
          const VerticalSpace(30),
          Text(
            'Description',
            style: AppStyles.semiBold16,
          ),
          const VerticalSpace(15),
          const ReadMoreText(
            text:
                'A jumping jack, also known as a star jump and called a side-straddle hop in the US military, is a physical jumping exercise performed by jumping to a position with the legs spread wide',
          ),
          const VerticalSpace(30),
          const CustomHeadTittleAndSubTitleButton(
            title: 'How To Do It',
            subtitle: '4 Steps',
          ),
          const VerticalSpace(14),
          ...steps.map(
            (step) => StepItem(
              isLast: step.stepNumber == steps.length,
              stepModel: step,
            ),
          ),
          Text(
            'Custom Repetitions',
            style: AppStyles.semiBold16,
          ),
          const CustomListWheel(),
          const VerticalSpace(30),
          const DefaultAppButton(text: 'Save'),
          const VerticalSpace(30),
        ],
      ).withHorizontalPadding(30),
    );
  }
}

class CustomListWheel extends StatefulWidget {
  const CustomListWheel({
    super.key,
  });

  @override
  State<CustomListWheel> createState() => _CustomListWheelState();
}

class _CustomListWheelState extends State<CustomListWheel> {
  int indexSelected = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150.h,
      child: ListWheelScrollView(
        itemExtent: 60.h,
        diameterRatio: 1.5,
        physics: const FixedExtentScrollPhysics(),
        children: List.generate(
          3,
          (index) => Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: Colors.grey.withValues(alpha: 0.2),
                  width: 1,
                ),
                bottom: BorderSide(
                  color: Colors.grey.withValues(alpha: 0.2),
                  width: 1,
                ),
              ),
            ),
            child: Row(
              spacing: 10.w,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.local_fire_department,
                      color: index == indexSelected
                          ? Colors.red
                          : Colors.pink.withValues(alpha: 0.3),
                      size: 24,
                    ),
                    const HorizontalSpace(10),
                    Text(
                      '450 Calories Burn',
                      style: AppStyles.regular10.copyWith(
                        color: index == indexSelected
                            ? AppColors.greyLighterColor
                            : const Color(0xffA5A3B0),
                      ),
                    ),
                  ],
                ),
                Text(
                  '30',
                  style: AppStyles.medium24.copyWith(
                    color: index == indexSelected
                        ? const Color(0xffA5A3B0)
                        : AppColors.greyLighterColor,
                    fontSize: index == indexSelected ? 24.sp : 18.sp,
                  ),
                ),
                if (index == indexSelected)
                  Text(
                    'times',
                    style: AppStyles.regular16.copyWith(
                      color: const Color(0xffA5A3B0),
                    ),
                  )
              ],
            ),
          ),
        ),
        onSelectedItemChanged: (index) {
          setState(() {
            indexSelected = index;
          });
        },
      ),
    );
  }
}
