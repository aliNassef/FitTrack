import 'package:fit_track_app/features/workout/presentation/widgets/equipment_bloc_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/helpers/app_spacer.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/widgets/custom_failure_widget.dart';
import '../../../../core/widgets/custom_head_title_and_subtitle_button.dart';
import '../../data/model/workout_model.dart';
import '../cubits/get_equipment_by_id_cubit/get_equipment_by_id_cubit.dart';
import 'fullbody_listtile_with_fav_button.dart';
import 'set_excersises_list_items.dart';
import 'swap_scroll_dvider.dart';
import 'workout_info_display.dart';
import '../../data/model/excersise_model.dart';

class WorkoutDetailsContent extends StatelessWidget {
  const WorkoutDetailsContent({
    super.key,
    required this.exercises,
    required this.workout,
  });
  final List<ExerciseModel> exercises;
  final WorkoutModel workout;
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 30.w),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(40),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const VerticalSpace(10),
            const Align(
              alignment: Alignment.center,
              child: SwapScrollDvider(),
            ),
            const VerticalSpace(30),
            FullBodyListTileWithFavButton(
              workout: workout,
            ),
            WorkoutInfoDisplay(
              image: AppIcons.schedualeIcon,
              title: 'Schedule Workout',
              date:
                  '${workout.createdAt.day}/${workout.createdAt.month}/${workout.createdAt.year}',
              backgroundColor: const Color(0xffccfeeb),
            ),
            const VerticalSpace(15),
            const WorkoutInfoDisplay(
              image: AppIcons.difficultyIcon,
              title: 'Difficulity',
              date: 'Beginner',
              backgroundColor: Color(0xfff6e3fa),
            ),
            const VerticalSpace(30),
            BlocBuilder<GetEquipmentByIdCubit, GetEquipmentByIdState>(
              builder: (context, state) {
                if (state is GetEquipmentByIdSuccess) {
                  return CustomHeadTittleAndSubTitleButton(
                    title: 'You’ll Need',
                    subtitle: '${state.equipment.length} Items',
                  );
                }
                if (state is GetEquipmentByIdError) {
                  return CustomFailureWidget(
                    errMessage: state.errMessage,
                  );
                }
                if (state is GetEquipmentByIdLoading) {
                  return const Skeletonizer(
                    enabled: true,
                    child: CustomHeadTittleAndSubTitleButton(
                      title: 'You’ll Need',
                      subtitle: '5 Items',
                    ),
                  );
                }
                return const SizedBox.shrink();
              },
            ),
            const VerticalSpace(15),
            // EquipmentItem(),
            const EquipmentBlocBuilder(),
            const VerticalSpace(30),
            CustomHeadTittleAndSubTitleButton(
              title: 'Exercises',
              subtitle: '${exercises.length} Sets',
            ),
            const VerticalSpace(15),
            SetExcersisesListItems(
              exercises: exercises,
            ),
            const VerticalSpace(100),
          ],
        ),
      ),
    );
  }
}
