import 'package:dartz/dartz.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failure.dart';
import '../datasource/meal_remote_datasource.dart';
import '../model/meal_category_model/category_meal_model.dart';
import '../model/meal_planner_model/meal_model.dart';
import 'meal_repo.dart';

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

  @override
  Future<Either<Failure, CategoryMealModel>> getMealCategoryById(String id) async {
    try {
      final result = await remoteDataSource.getMealCategoryById(id);
      return Right(result);
    } on ServerException catch (e) {
      return Left(Failure(errMessage: e.errorModel.errorMessage));
    }
  }
}
