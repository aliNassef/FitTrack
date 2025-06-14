import 'package:dartz/dartz.dart';
import 'package:fit_track_app/core/errors/failure.dart';

import '../model/meal_model.dart';

abstract class MealRepo {
  Future<Either<Failure, MealModel>> getMealPlanner();
}
