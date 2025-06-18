import 'package:dartz/dartz.dart';
import 'package:fit_track_app/features/workout/data/model/excersise_details_model.dart';

import '../../../../core/errors/failure.dart';
import '../model/excersise_model.dart';
import '../model/workout_model.dart';

abstract class WorkoutRepo {
  Future<Either<Failure, List<WorkoutModel>>> getWorkouts();
  Future<Either<Failure, List<ExerciseModel>>> getExercises(String workoutId);
  Future<Either<Failure, ExerciseDetailsModel>> getExerciseDetails(String exerciseId);
}
