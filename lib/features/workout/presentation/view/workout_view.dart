import 'package:fit_track_app/core/extensions/padding_extension.dart';
import 'package:fit_track_app/features/workout/presentation/cubits/get_all_workout_cubit/get_all_workouts_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fit_track_app/core/di/service_locator.dart';
import '../widgets/workout_view_body.dart';

class WorkoutView extends StatelessWidget {
  const WorkoutView({super.key});
  static const String routeName = 'workout-view';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => injector<GetAllWorkoutsCubit>()..getWorkouts(),
        child: SafeArea(
          child: const WorkoutViewBody().withHorizontalPadding(30),
        ),
      ),
    );
  }
}
