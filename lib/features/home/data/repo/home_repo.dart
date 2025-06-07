import 'package:dartz/dartz.dart';
import 'package:fit_track_app/core/errors/failure.dart';
import 'package:fit_track_app/features/home/data/models/notification_model.dart';
import 'package:fit_track_app/features/home/data/models/notification_status_model.dart';

abstract class HomeRepo {
  Future<Either<Failure, NotificationResponse>> getNotifications();
  Future<Either<Failure, NotificationStatusResponse>> getNotificationStats();
}