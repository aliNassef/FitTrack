part of 'get_activity_cubit.dart';

@immutable
sealed class GetActivityState {}

final class GetActivityInitial extends GetActivityState {}

final class GetActivityLoading extends GetActivityState {}

final class GetActivitySuccess extends GetActivityState {
  final ActivityTrackerModel activityTrackerModel;

  GetActivitySuccess({required this.activityTrackerModel});
}

final class GetActivityFailure extends GetActivityState {
  final String errorMessage;

  GetActivityFailure({required this.errorMessage});
}
