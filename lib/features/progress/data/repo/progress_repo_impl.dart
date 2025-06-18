import 'package:dartz/dartz.dart';
import 'package:fit_track_app/core/errors/exceptions.dart';
import 'package:fit_track_app/core/errors/failure.dart';
import 'package:fit_track_app/features/progress/data/datasource/progress_remote_datasource.dart';
import 'package:fit_track_app/features/progress/data/model/gallrey_model.dart';
import 'package:fit_track_app/features/progress/data/model/last_compare_model.dart';
import 'package:fit_track_app/features/progress/data/model/progress_comparison_model.dart';
import 'package:fit_track_app/features/progress/data/repo/progress_repo.dart';

class ProgressRepoImpl extends ProgressRepo {
  final ProgressRemoteDatasource progressRemoteDatasource;

  ProgressRepoImpl({required this.progressRemoteDatasource});

  @override
  Future<Either<Failure, ProgressModel>> getProgress() async {
    try {
      final progress = await progressRemoteDatasource.getProgress();
      return right(progress);
    } on ServerException catch (e) {
      return left(Failure(errMessage: e.errorModel.errorMessage));
    }
  }

  @override
  Future<Either<Failure, ProgressComparisonModel>> getProgressComparison({required String beforePhotoId, required String afterPhotoId}) async {
    try {
      final progressComparison =
          await progressRemoteDatasource.getProgressComparison(
        beforePhotoId: beforePhotoId,
        afterPhotoId: afterPhotoId,
      );
      return right(progressComparison);
    } on ServerException catch (e) {
      return left(Failure(errMessage: e.errorModel.errorMessage));
    }
  }

  @override
  Future<Either<Failure, LastCompareModel>> getLastCompare() async {
    try {
      final lastCompare = await progressRemoteDatasource.getLastCompare();
      return right(lastCompare);
    } on ServerException catch (e) {
      return left(Failure(errMessage: e.errorModel.errorMessage));
    }
  } 
}
