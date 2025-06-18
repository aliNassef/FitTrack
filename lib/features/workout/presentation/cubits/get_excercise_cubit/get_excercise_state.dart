part of 'get_excercise_cubit.dart';

@immutable
sealed class GetExcerciseState {}

final class GetExcerciseInitial extends GetExcerciseState {}
final class GetExcerciseLoading extends GetExcerciseState {}
final class GetExcerciseSuccess extends GetExcerciseState {
  final List<ExerciseModel> exercises;
  GetExcerciseSuccess({required this.exercises});
}
final class GetExcerciseError extends GetExcerciseState {
  final String errMessage;
  GetExcerciseError({required this.errMessage});
}

