import 'package:fit_track_app/core/errors/exceptions.dart';
import 'package:fit_track_app/features/activity/data/model/activity_tracker_model.dart';
import '../../../../core/api/api_consumer.dart';
import '../../../../core/errors/error_model.dart';
import '../../../../core/api/end_ponits.dart';
import 'dart:convert';

abstract class ActivityRemoteDatasource {
  Future<ActivityTrackerModel> getTrackerData();
  Future<void> addDailyTarget({
    required int waterIntake,
    required int footSteps,
  });
}

class ActivityRemoteDatasourceImpl implements ActivityRemoteDatasource {
  final ApiConsumer apiConsumer;
  ActivityRemoteDatasourceImpl({required this.apiConsumer});
  @override
  Future<ActivityTrackerModel> getTrackerData() async {
    final response = await apiConsumer.get(EndPoints.getTrackerData);
    if (response.statusCode == 200) {
      return ActivityTrackerModel.fromJson(response.data);
    } else {
      throw ServerException(ErrorModel.fromJson(response.data));
    }
  }

  @override
  Future<void> addDailyTarget(
      {required int waterIntake, required int footSteps}) async {
    final response = await apiConsumer.post(
      EndPoints.getTrackerData,
      data: json.encode(
        {
          "dailyTarget": {"waterIntake": waterIntake, "footSteps": footSteps}
        },
      ),
    );
    if (response.statusCode == 200) {
      return;
    } else {
      throw ServerException(ErrorModel.fromJson(response.data));
    }
  }
}
