import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../model/activity_tracker_model.dart';

abstract class ActivityRepo {
  Future<Either<Failure, ActivityTrackerModel>> getTrackerData();
  Future<Either<Failure, void>> addDailyTarget({
    required int waterIntake,
    required int footSteps,
  });
}
