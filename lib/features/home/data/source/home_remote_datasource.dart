import '../../../../core/api/api_consumer.dart';
import '../../../../core/api/end_ponits.dart';
import '../../../../core/errors/error_model.dart';
import '../../../../core/errors/exceptions.dart';

import '../models/notification_model.dart';
import '../models/notification_status_model.dart';

abstract class HomeRemoteDatasource {
  Future<NotificationResponse> getNotifications();
  Future<NotificationStatusResponse> getNotificationStatus();
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

  @override
  Future<NotificationStatusResponse> getNotificationStatus() async {
    final response = await apiConsumer.get(EndPoints.getNotificationsStats);
    if (response.statusCode == 200) {
      return NotificationStatusResponse.fromJson(response.data);
    } else {
      throw ServerException(ErrorModel.fromJson(response.data));
    }
  }
}
