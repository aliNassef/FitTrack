import 'package:fit_track_app/core/di/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/model/workout_model.dart';
import '../cubits/get_equipment_by_id_cubit/get_equipment_by_id_cubit.dart';
import '../cubits/get_excercise_cubit/get_excercise_cubit.dart';
import '../widgets/workout_details_view_body.dart';

class WorkoutDetailsView extends StatelessWidget {
  const WorkoutDetailsView({super.key, required this.workout});
  static const String routeName = 'workoutDetailsView';
  final WorkoutModel workout;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                injector<GetExcerciseCubit>()..getExercises(workout.id),
          ),
          BlocProvider(
            create: (context) =>
                injector<GetEquipmentByIdCubit>()..getEquipmentById(workout.id),
          ),
        ],
        child: WorkoutDetailsViewBody(
          workout: workout,
        ),
      ),
    );
  }
}
