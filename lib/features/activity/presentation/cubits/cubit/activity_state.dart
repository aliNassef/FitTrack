part of 'activity_cubit.dart';

@immutable
sealed class ActivityState {}

final class ActivityInitial extends ActivityState {}

final class AddDailyActivityLoading extends ActivityState {}

final class AddDailyActivitySuccess extends ActivityState {}

final class AddDailyActivityFailure extends ActivityState {
  final String errorMessage;

  AddDailyActivityFailure({required this.errorMessage});
}
