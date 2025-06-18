part of 'get_excercise_details_cubit.dart';

@immutable
sealed class GetExcerciseDetailsState {}

final class GetExcerciseDetailsInitial extends GetExcerciseDetailsState {}
final class GetExcerciseDetailsLoading extends GetExcerciseDetailsState {}
final class GetExcerciseDetailsSuccess extends GetExcerciseDetailsState {
  final ExerciseDetailsModel exerciseDetails;

  GetExcerciseDetailsSuccess({required this.exerciseDetails});
}
final class GetExcerciseDetailsError extends GetExcerciseDetailsState {
  final String errMessage;

  GetExcerciseDetailsError({required this.errMessage});
}
