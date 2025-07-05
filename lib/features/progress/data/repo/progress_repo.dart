import 'package:dartz/dartz.dart';
import '../model/last_compare_model.dart';

import '../../../../core/errors/failure.dart';
import '../model/progress_comparison_model.dart';
import '../model/progress_photo_model.dart';
import '../model/upload_image_input_model.dart';
import '../model/upload_image_model.dart';

abstract class ProgressRepo {
  Future<Either<Failure, UploadImageModel>> uploadImageWithData(
    UploadImageInputModel imageModel,
  );
  Future<Either<Failure, List<ProgressPhotoModel>>> getProgress();
  Future<Either<Failure, ProgressComparisonModel>> getProgressComparison({
    required String beforePhotoId,
    required String afterPhotoId,
  });
  Future<Either<Failure, LastCompareModel>> getLastCompare();
  Future<Either<Failure, String>> deletePhotoFromGallrey(String id);
}
