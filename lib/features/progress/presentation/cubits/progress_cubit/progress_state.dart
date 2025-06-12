part of 'progress_cubit.dart';

@immutable
sealed class ProgressState {}

final class ProgressInitial extends ProgressState {}

final class ProgressLoading extends ProgressState {}

final class ProgressLoaded extends ProgressState {
  final ProgressModel progressModel;

  ProgressLoaded({required this.progressModel});
}

final class ProgressFailure extends ProgressState {
  final String errMessage;

  ProgressFailure({required this.errMessage});
}
