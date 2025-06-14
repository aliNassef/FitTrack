import 'package:dartz/dartz.dart';
import 'package:fit_track_app/core/errors/exceptions.dart';
import 'package:fit_track_app/core/errors/failure.dart';
import 'package:fit_track_app/features/meal_planner/data/datasource/meal_remote_datasource.dart';
import 'package:fit_track_app/features/meal_planner/data/model/meal_model.dart';
import 'package:fit_track_app/features/meal_planner/data/repo/meal_repo.dart';

class MealRepoImpl extends MealRepo {
  final MealRemoteDataSource remoteDataSource;

  MealRepoImpl({required this.remoteDataSource});
  @override
  Future<Either<Failure, MealModel>> getMealPlanner() async {
    try {
      final result = await remoteDataSource.getMealPlanner();
      return Right(result);
    } on ServerException catch (e) {
      return Left(
        Failure(errMessage: e.errorModel.errorMessage),
      );
    }
  }
}
