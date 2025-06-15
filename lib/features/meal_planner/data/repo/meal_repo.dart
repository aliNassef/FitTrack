import 'package:dartz/dartz.dart';
import 'package:fit_track_app/core/errors/failure.dart';

import '../model/meal_category_model/category_meal_model.dart';
import '../model/meal_planner_model/meal_model.dart';

abstract class MealRepo {
  Future<Either<Failure, CategoryMealModel>> getMealCategoryById(String id);
  Future<Either<Failure, MealModel>> getMealPlanner();
}
