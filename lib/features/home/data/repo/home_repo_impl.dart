import 'package:dartz/dartz.dart';
import '../../../../core/errors/exceptions.dart';

import '../../../../core/errors/failure.dart';

import '../models/notification_model.dart';
import '../models/notification_status_model.dart';

import '../source/home_remote_datasource.dart';
import 'home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final HomeRemoteDatasource homeRemoteDatasource;

  HomeRepoImpl({required this.homeRemoteDatasource});

  @override
  Future<Either<Failure, NotificationResponse>> getNotifications() async {
    try {
      final result = await homeRemoteDatasource.getNotifications();
      return Right(result);
    } on ServerException catch (e) {
      return Left(Failure(errMessage: e.errorModel.errorMessage));
    }
  }

  @override
  Future<Either<Failure, NotificationStatusResponse>>
      getNotificationStats() async {
    try {
      final result = await homeRemoteDatasource.getNotificationStatus();
      return Right(result);
    } on ServerException catch (e) {
      return Left(Failure(errMessage: e.errorModel.errorMessage));
    }
  }
}
