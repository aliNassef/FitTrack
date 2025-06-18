import 'package:dartz/dartz.dart';
import 'package:fit_track_app/features/progress/data/model/gallrey_model.dart';
import 'package:fit_track_app/features/progress/data/model/last_compare_model.dart';

import '../../../../core/errors/failure.dart';
import '../model/progress_comparison_model.dart';

abstract class ProgressRepo {
  Future<Either<Failure, ProgressModel>> getProgress();
  Future<Either<Failure, ProgressComparisonModel>> getProgressComparison({
    required String beforePhotoId,
    required String afterPhotoId,
  });
  Future<Either<Failure, LastCompareModel>> getLastCompare();
}
