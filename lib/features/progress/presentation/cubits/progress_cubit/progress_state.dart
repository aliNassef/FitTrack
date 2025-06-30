part of 'progress_cubit.dart';

@immutable
sealed class ProgressState {}

final class ProgressInitial extends ProgressState {}

final class ProgressLoading extends ProgressState {}

final class ProgressLoaded extends ProgressState {
  final List<ProgressPhotoModel> progressModel;

  ProgressLoaded({required this.progressModel});
}

final class ProgressFailure extends ProgressState {
  final String errMessage;

  ProgressFailure({required this.errMessage});
}

final class ProgressComparisonLoaded extends ProgressState {
  final ProgressComparisonModel progressComparisonModel;

  ProgressComparisonLoaded({required this.progressComparisonModel});
}

final class ProgressComparisonFailure extends ProgressState {
  final String errMessage;

  ProgressComparisonFailure({required this.errMessage});
}

final class LastCompareLoading extends ProgressState {}

final class LastCompareLoaded extends ProgressState {
  final LastCompareModel lastCompareModel;

  LastCompareLoaded({required this.lastCompareModel});
}

final class LastCompareFailure extends ProgressState {
  final String errMessage;

  LastCompareFailure({required this.errMessage});
}

final class UploadImageLoading extends ProgressState {}

final class UploadImageLoaded extends ProgressState {
  final UploadImageModel uploadImageModel;
  UploadImageLoaded({required this.uploadImageModel});
}

final class UploadImageFailure extends ProgressState {
  final String errMessage;
  UploadImageFailure({required this.errMessage});
}
