import '../../../../core/widgets/custom_failure_widget.dart';
import '../../data/model/workout_model.dart';
import '../cubits/get_all_workout_cubit/get_all_workouts_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import '../../../../core/helpers/app_spacer.dart';
import 'train_lessons_item.dart';

class WorkoutViewBody extends StatelessWidget {
  const WorkoutViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAppBar(
          title: 'Workout Tracker',
          titleColor: Colors.black,
          onBackButtonPressed: () {
            Navigator.of(context).pop();
          },
        ),
        const VerticalSpace(16),
        BlocBuilder<GetAllWorkoutsCubit, GetAllWorkoutsState>(
          buildWhen: (previous, current) =>
              current is GetAllWorkoutsLoading ||
              current is GetAllWorkoutsSuccess ||
              current is GetAllWorkoutsError,
          builder: (context, state) {
            if (state is GetAllWorkoutsSuccess) {
              return Expanded(
                child: ListView.separated(
                  itemBuilder: (context, index) => TrainLessonsItem(
                    instance: state.workouts[index],
                  ),
                  separatorBuilder: (context, index) => const VerticalSpace(15),
                  itemCount: state.workouts.length,
                ),
              );
            }

            if (state is GetAllWorkoutsLoading) {
              return _buildLoadingWorkout();
            }

            if (state is GetAllWorkoutsError) {
              return CustomFailureWidget(errMessage: state.errMessage);
            }
            return const SizedBox.shrink();
          },
        )
      ],
    );
  }

  Expanded _buildLoadingWorkout() {
    return Expanded(
      child: Skeletonizer(
        enabled: true,
        child: ListView.separated(
          itemBuilder: (context, index) => TrainLessonsItem(
            instance: WorkoutModel(
                id: 'ass',
                title: 'ali anssef',
                exercises: 5,
                duration: 30,
                image:
                    'https://res.cloudinary.com/db8pkirtf/image/upload/v1749749240/workouts/images/phan4c4swvecfqnyg31l.jpg',
                createdAt: DateTime.now(),
                updatedAt: DateTime.now(),
                v: 5),
          ),
          separatorBuilder: (context, index) => const VerticalSpace(15),
          itemCount: 10,
        ),
      ),
    );
  }
}
