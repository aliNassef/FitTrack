import '../../../../core/api/api_consumer.dart';
import '../../../../core/api/end_ponits.dart';
import '../../../../core/errors/error_model.dart';
import '../../../../core/errors/exceptions.dart';
import '../model/workout_model.dart';

abstract class WorkoutRemoteDatasource {
  Future<List<WorkoutModel>> getWorkouts();
}

class WorkoutRemoteDatasourceImpl implements WorkoutRemoteDatasource {
  final ApiConsumer apiConsumer;
  WorkoutRemoteDatasourceImpl({required this.apiConsumer});
  @override
  Future<List<WorkoutModel>> getWorkouts() async {
    final response = await apiConsumer.get(EndPoints.getWorkouts);
    final data = response.data['data'];
    if (response.statusCode == 200) {
      return data.map<WorkoutModel>((e) => WorkoutModel.fromJson(e)).toList();
    } else {
      throw ServerException(ErrorModel.fromJson(response.data));
    }
  }
}
