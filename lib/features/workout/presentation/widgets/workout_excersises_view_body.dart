import '../../../../core/extensions/padding_extension.dart';
import '../../../../core/helpers/app_spacer.dart';
import '../../../../core/helpers/default_app_button.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../core/widgets/custom_head_title_and_subtitle_button.dart';
import '../../../../core/widgets/read_more_text.dart';
import 'step_item.dart';
import 'video_section.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../core/model/step_model.dart';
import 'custom_list_wheel.dart';

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
          CustomAppBar(
            title: '',
            onBackButtonPressed: () {
              Navigator.of(context).pop();
            },
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
