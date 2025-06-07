import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../models/notification_model.dart';
import '../models/notification_status_model.dart';

abstract class HomeRepo {
  Future<Either<Failure, NotificationResponse>> getNotifications();
  Future<Either<Failure, NotificationStatusResponse>> getNotificationStats();
}