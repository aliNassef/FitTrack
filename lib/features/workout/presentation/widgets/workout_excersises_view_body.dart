import '../../../../core/widgets/custom_failure_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/extensions/padding_extension.dart';
import '../../../../core/helpers/app_spacer.dart';
import '../../../../core/helpers/default_app_button.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../core/widgets/custom_head_title_and_subtitle_button.dart';
import '../../../../core/widgets/read_more_text.dart';
import '../cubits/get_excercise_details_cubit/get_excercise_details_cubit.dart';
import 'step_item.dart';
import 'video_section.dart';
import 'package:flutter/material.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import 'custom_list_wheel.dart';

class WorkoutExerciseViewBody extends StatelessWidget {
  const WorkoutExerciseViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: BlocBuilder<GetExcerciseDetailsCubit, GetExcerciseDetailsState>(
          builder: (context, state) {
        if (state is GetExcerciseDetailsLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is GetExcerciseDetailsError) {
          return CustomFailureWidget(errMessage: state.errMessage);
        }

        if (state is GetExcerciseDetailsSuccess) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAppBar(
                title: '',
                onBackButtonPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              const VerticalSpace(30),
              VideoSection(
                url: state.exerciseDetails.video,
              ),
              const VerticalSpace(20),
              Text(
                state.exerciseDetails.title,
                style: AppStyles.semiBold16,
              ),
              const VerticalSpace(5),
              Text(
                'Easy | ${state.exerciseDetails.totalCaloriesBurned} Calories Burn',
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
              ReadMoreText(
                text: state.exerciseDetails.description,
              ),
              const VerticalSpace(30),
              CustomHeadTittleAndSubTitleButton(
                title: 'How To Do It',
                subtitle: '${state.exerciseDetails.steps.length} Steps',
              ),
              const VerticalSpace(14),
              ...state.exerciseDetails.steps.map(
                (step) => StepItem(
                  isLast: step.stepNumber == state.exerciseDetails.steps.length,
                  stepModel: step,
                ),
              ),
              Text(
                'Custom Repetitions',
                style: AppStyles.semiBold16,
              ),
              CustomListWheel(
                customRepetitions: state.exerciseDetails.customRepetitions,
              ),
              const VerticalSpace(30),
              const DefaultAppButton(text: 'Save'),
              const VerticalSpace(30),
            ],
          );
        }
        return const SizedBox.shrink();
      }).withHorizontalPadding(30),
    );
  }
}
