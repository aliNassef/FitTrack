import 'package:bloc/bloc.dart';
import 'package:fit_track_app/features/progress/data/model/gallrey_model.dart';
import 'package:fit_track_app/features/progress/data/repo/progress_repo.dart';
import 'package:meta/meta.dart';

import '../../../data/model/last_compare_model.dart';
import '../../../data/model/progress_comparison_model.dart';
import '../../../data/model/upload_image_input_model.dart';
import '../../../data/model/upload_image_model.dart';

part 'progress_state.dart';

class ProgressCubit extends Cubit<ProgressState> {
  ProgressCubit(this.progressRepo) : super(ProgressInitial());
  final ProgressRepo progressRepo;

  void getProgress() async {
    emit(ProgressLoading());
    final progressOrfailure = await progressRepo.getProgress();
    progressOrfailure.fold(
      (failure) => emit(
        ProgressFailure(errMessage: failure.errMessage),
      ),
      (progress) => emit(
        ProgressLoaded(progressModel: progress),
      ),
    );
  }

  void getProgressComparison({required String beforePhotoId, required String afterPhotoId}) async {
    emit(ProgressLoading());
    final progressComparisonOrfailure = await progressRepo.getProgressComparison(
      beforePhotoId: beforePhotoId,
      afterPhotoId: afterPhotoId,
    );
    progressComparisonOrfailure.fold(
      (failure) => emit(
        ProgressComparisonFailure(errMessage: failure.errMessage),
      ),
      (progressComparison) => emit(
        ProgressComparisonLoaded(progressComparisonModel: progressComparison),
      ),
    );
  }

  void getLastCompare() async {
    emit(LastCompareLoading());
    final lastCompareOrfailure = await progressRepo.getLastCompare();
    lastCompareOrfailure.fold(
      (failure) => emit(
        LastCompareFailure(errMessage: failure.errMessage),
      ),
      (lastCompare) => emit(
        LastCompareLoaded(lastCompareModel: lastCompare),
      ),
    );
  }

  void uploadImageWithData(UploadImageInputModel imageModel) async {
    emit(UploadImageLoading());
    final uploadImageOrFailure = await progressRepo.uploadImageWithData(imageModel);
    uploadImageOrFailure.fold(
      (failure) => emit(
        UploadImageFailure(errMessage: failure.errMessage),
      ),
      (uploadImage) => emit(
        UploadImageLoaded(uploadImageModel: uploadImage),
      ),
    );
  }
}
