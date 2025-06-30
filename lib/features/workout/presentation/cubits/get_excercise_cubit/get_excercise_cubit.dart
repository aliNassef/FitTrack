import 'package:bloc/bloc.dart';
import '../../../data/model/excersise_model.dart';
import '../../../data/repo/workout_repo.dart';
import 'package:meta/meta.dart';

part 'get_excercise_state.dart';

class GetExcerciseCubit extends Cubit<GetExcerciseState> {
  GetExcerciseCubit(this.repo) : super(GetExcerciseInitial());
  final WorkoutRepo repo;

  void getExercises(String workoutId) async {
    emit(GetExcerciseLoading());
    final exercisesOrFailure = await repo.getExercises(workoutId);
    exercisesOrFailure.fold(
      (failure) => emit(GetExcerciseError(errMessage: failure.errMessage)),
      (exercises) => emit(GetExcerciseSuccess(exercises: exercises)),
    );
  }
}
