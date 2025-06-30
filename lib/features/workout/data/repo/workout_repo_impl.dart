import '../model/excersise_model.dart';
import 'workout_repo.dart';

import '../datasource/workout_remote_datasource.dart';
import '../model/equipment_model.dart';
import '../model/excersise_details_model.dart';
import '../model/workout_model.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/errors/exceptions.dart';

class WorkoutRepoImpl implements WorkoutRepo {
  final WorkoutRemoteDatasource remoteDatasource;
  WorkoutRepoImpl({required this.remoteDatasource});
  @override
  Future<Either<Failure, List<WorkoutModel>>> getWorkouts() async {
    try {
      final workouts = await remoteDatasource.getWorkouts();
      return Right(workouts);
    } on ServerException catch (e) {
      return Left(
        Failure(errMessage: e.errorModel.errorMessage),
      );
    }
  }

  @override
  Future<Either<Failure, List<ExerciseModel>>> getExercises(
      String workoutId) async {
    try {
      final exercises = await remoteDatasource.getExercises(workoutId);
      return Right(exercises);
    } on ServerException catch (e) {
      return Left(
        Failure(errMessage: e.errorModel.errorMessage),
      );
    }
  }

  @override
  Future<Either<Failure, ExerciseDetailsModel>> getExerciseDetails(
      String exerciseId) async {
    try {
      final exerciseDetails = await remoteDatasource.getExerciseDetails(exerciseId);
      return Right(exerciseDetails);
    } on ServerException catch (e) {
      return Left(
        Failure(errMessage: e.errorModel.errorMessage),
      );
    }
  }

  @override
  Future<Either<Failure, List<EquipmentModel>>> getEquipment(String equipmentId) async {
    try {
      final equipment = await remoteDatasource.getEquipment(equipmentId);
      return Right(equipment);
    } on ServerException catch (e) {
      return Left(
        Failure(errMessage: e.errorModel.errorMessage),
      );
    }
  }
}
