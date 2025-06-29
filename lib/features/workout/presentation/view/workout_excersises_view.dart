import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/service_locator.dart';
import '../cubits/get_excercise_details_cubit/get_excercise_details_cubit.dart';
import '../widgets/workout_excersises_view_body.dart';

class WorkoutExerciseView extends StatelessWidget {
  final String id;
  const WorkoutExerciseView({super.key, required this.id});
  static const routeName = 'workout-excersises-view';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocProvider(
          create: (context) => injector<GetExcerciseDetailsCubit>()..getExerciseDetails(id),
          child: const WorkoutExerciseViewBody(),
        ),
      ),
    );
  }
}
