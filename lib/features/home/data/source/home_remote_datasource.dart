import 'package:fit_track_app/core/api/api_consumer.dart';
import 'package:fit_track_app/core/api/end_ponits.dart';
import 'package:fit_track_app/core/errors/error_model.dart';
import 'package:fit_track_app/core/errors/exceptions.dart';

import '../models/notification_model.dart';

abstract class HomeRemoteDatasource {
  Future<NotificationResponse> getNotifications();
}

class HomeRemoteDatasourceImpl implements HomeRemoteDatasource {
  final ApiConsumer apiConsumer;

  HomeRemoteDatasourceImpl({required this.apiConsumer});
  @override
  Future<NotificationResponse> getNotifications() async {
    final response = await apiConsumer.get(EndPoints.getNotifications);
    if (response.statusCode == 200) {
      return NotificationResponse.fromJson(response.data);
    } else {
      throw ServerException(ErrorModel.fromJson(response.data));
    }
  }
}
