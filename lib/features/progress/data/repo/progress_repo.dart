import 'package:dartz/dartz.dart';
import 'package:fit_track_app/features/progress/data/model/gallrey_model.dart';

import '../../../../core/errors/failure.dart';

abstract class ProgressRepo {
  Future<Either<Failure, ProgressModel>> getProgress();
}