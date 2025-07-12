import '../../../../core/api/api_consumer.dart';
import '../../../../core/api/end_ponits.dart';
import '../../../../core/errors/error_model.dart';
import '../../../../core/errors/exceptions.dart';
 import '../model/excersise_details_model.dart';
import '../model/excersise_model.dart';
import '../model/workout_model.dart';

abstract class WorkoutRemoteDatasource {
  Future<List<WorkoutModel>> getWorkouts();
  Future<List<ExerciseModel>> getExercises(String workoutId);
  Future<ExerciseDetailsModel> getExerciseDetails(String exerciseId);
  // Future<List<EquipmentModel>> getEquipment(String equipmentId);
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

  @override
  Future<List<ExerciseModel>> getExercises(String workoutId) async {
    final response =
        await apiConsumer.get(EndPoints.getExcersisesByWorkout + workoutId);
    final data = response.data['data'];
    if (response.statusCode == 200) {
      return data.map<ExerciseModel>((e) => ExerciseModel.fromJson(e)).toList();
    } else {
      throw ServerException(ErrorModel.fromJson(response.data));
    }
  }

  @override
  Future<ExerciseDetailsModel> getExerciseDetails(String exerciseId) async {
    final response =
        await apiConsumer.get(EndPoints.getExcersisesDetailsById + exerciseId);
    final data = response.data['data'];
    if (response.statusCode == 200) {
      return ExerciseDetailsModel.fromJson(data);
    } else {
      throw ServerException(ErrorModel.fromJson(response.data));
    }
  }

  // @override
  // Future<List<EquipmentModel>> getEquipment(String equipmentId) async {
  //   final response =
  //       await apiConsumer.get(EndPoints.getAllEquipmentById + equipmentId);
  //   final data = response.data['data'];
  //   List<EquipmentModel> equipmentList = [];
  //   for (var element in data) {
  //     var equipments = element['equipment'];
  //     for (var equipment in equipments) {
  //       equipmentList.add(EquipmentModel.fromJson(equipment));
  //     }
  //   }
  //   if (response.statusCode == 200) {
  //     return equipmentList;
  //   } else {
  //     throw ServerException(ErrorModel.fromJson(response.data));
  //   }
  // }
}
