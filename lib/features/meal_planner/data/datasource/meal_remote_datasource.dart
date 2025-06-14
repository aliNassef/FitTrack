import 'package:fit_track_app/core/api/api_consumer.dart';
import 'package:fit_track_app/core/api/end_ponits.dart';
import 'package:fit_track_app/core/errors/error_model.dart';
import 'package:fit_track_app/core/errors/exceptions.dart';

import '../model/meal_model.dart';

abstract class MealRemoteDataSource {
  Future<MealModel> getMealPlanner();
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
}
