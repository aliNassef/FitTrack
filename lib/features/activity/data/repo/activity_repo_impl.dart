import 'activity_repo.dart';

import '../../../../core/errors/exceptions.dart';
import '../datasource/activity_remote_datasource.dart';
import '../model/activity_tracker_model.dart';
import '../../../../core/errors/failure.dart';
import 'package:dartz/dartz.dart';

class ActivityRepoImpl implements ActivityRepo {
  final ActivityRemoteDatasource remoteDatasource;

  ActivityRepoImpl({required this.remoteDatasource});

  @override
  Future<Either<Failure, ActivityTrackerModel>> getTrackerData() async {
    try {
      final result = await remoteDatasource.getTrackerData();
      return Right(result);
    } on ServerException catch (e) {
      return Left(
        Failure(errMessage: e.errorModel.errorMessage),
      );
    }
  }

  @override
  Future<Either<Failure, void>> addDailyTarget(
      {required int waterIntake, required int footSteps}) async {
    try {
      await remoteDatasource.addDailyTarget(
        waterIntake: waterIntake,
        footSteps: footSteps,
      );
      return const Right(null);
    } on ServerException catch (e) {
      return Left(
        Failure(errMessage: e.errorModel.errorMessage),
      );
    }
  }
}
