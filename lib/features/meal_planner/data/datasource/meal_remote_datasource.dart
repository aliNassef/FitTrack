import 'package:fit_track_app/core/api/api_consumer.dart';
import 'package:fit_track_app/core/api/end_ponits.dart';
import 'package:fit_track_app/core/errors/error_model.dart';
import 'package:fit_track_app/core/errors/exceptions.dart';

import '../model/meal_category_model/category_meal_model.dart';
import '../model/meal_planner_model/meal_model.dart';

abstract class MealRemoteDataSource {
  Future<MealModel> getMealPlanner();
  Future<CategoryMealModel> getMealCategoryById(String id);
}

class MealRemoteDataSourceImpl extends MealRemoteDataSource {
  final ApiConsumer api;

  MealRemoteDataSourceImpl({required this.api});

  @override
  Future<MealModel> getMealPlanner() async {
    final response = await api.get(
      EndPoints.getMealPlanner,
    );
    if (response.statusCode == 200) {
      return MealModel.fromJson(response.data['data'][0]);
    } else {
      throw ServerException(ErrorModel.fromJson(response.data['data']));
    }
  }

  @override
  Future<CategoryMealModel> getMealCategoryById(String id) async {
    final response = await api.get('${EndPoints.getMealCategories}$id');
    if (response.statusCode == 200) {
      return CategoryMealModel.fromJson(response.data['data']);
    } else {
      throw ServerException(ErrorModel.fromJson(response.data['data']));
    }
  }
}
