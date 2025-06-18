import 'package:fit_track_app/core/di/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubits/get_excercise_cubit/get_excercise_cubit.dart';
import '../widgets/workout_details_view_body.dart';

class WorkoutDetailsView extends StatelessWidget {
  const WorkoutDetailsView({super.key, required this.id});
  static const String routeName = 'workoutDetailsView';
  final String id;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: BlocProvider(
        create: (context) => injector<GetExcerciseCubit>()..getExercises(id),
        child: const WorkoutDetailsViewBody(),
      ),
    );
  }
}
