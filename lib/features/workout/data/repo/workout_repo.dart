import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../model/workout_model.dart';

abstract class WorkoutRepo {
  Future<Either<Failure, List<WorkoutModel>>> getWorkouts();
}
