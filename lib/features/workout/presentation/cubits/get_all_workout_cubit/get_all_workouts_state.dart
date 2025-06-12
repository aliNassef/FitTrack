part of 'get_all_workouts_cubit.dart';

@immutable
sealed class GetAllWorkoutsState {}

final class GetAllWorkoutsInitial extends GetAllWorkoutsState {}

final class GetAllWorkoutsLoading extends GetAllWorkoutsState {}

final class GetAllWorkoutsSuccess extends GetAllWorkoutsState {
  final List<WorkoutModel> workouts;
  GetAllWorkoutsSuccess({required this.workouts});
}

final class GetAllWorkoutsError extends GetAllWorkoutsState {
  final String errMessage;
  GetAllWorkoutsError({required this.errMessage});
}
