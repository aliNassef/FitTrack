import 'package:dartz/dartz.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failure.dart';
import '../datasource/progress_remote_datasource.dart';
import '../model/last_compare_model.dart';
import '../model/progress_comparison_model.dart';
import '../model/upload_image_input_model.dart';
import '../model/upload_image_model.dart';
import 'progress_repo.dart';

import '../model/progress_photo_model.dart';

class ProgressRepoImpl extends ProgressRepo {
  final ProgressRemoteDatasource progressRemoteDatasource;

  ProgressRepoImpl({required this.progressRemoteDatasource});

  @override
  Future<Either<Failure, List<ProgressPhotoModel>>> getProgress() async {
    try {
      final progress = await progressRemoteDatasource.getProgress();
      return right(progress);
    } on ServerException catch (e) {
      return left(Failure(errMessage: e.errorModel.errorMessage));
    }
  }

  @override
  Future<Either<Failure, ProgressComparisonModel>> getProgressComparison(
      {required String beforePhotoId, required String afterPhotoId}) async {
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

  @override
  Future<Either<Failure, UploadImageModel>> uploadImageWithData(
      UploadImageInputModel imageModel) async {
    try {
      final uploadImage =
          await progressRemoteDatasource.uploadImageWithData(imageModel);
      return right(uploadImage);
    } on ServerException catch (e) {
      return left(Failure(errMessage: e.errorModel.errorMessage));
    }
  }
  
  @override
  Future<Either<Failure, String>> deletePhotoFromGallrey(String id) async {
    try {
      final message = await progressRemoteDatasource.deletePhotoFromGallrey(id);
      return right(message);
    } on ServerException catch (e) {
      return left(Failure(errMessage: e.errorModel.errorMessage));
    }
  }
}
