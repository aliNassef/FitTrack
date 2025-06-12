import 'package:dartz/dartz.dart';
import 'package:fit_track_app/core/errors/exceptions.dart';
import 'package:fit_track_app/core/errors/failure.dart';
import 'package:fit_track_app/features/progress/data/datasource/progress_remote_datasource.dart';
import 'package:fit_track_app/features/progress/data/model/gallrey_model.dart';
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
}
