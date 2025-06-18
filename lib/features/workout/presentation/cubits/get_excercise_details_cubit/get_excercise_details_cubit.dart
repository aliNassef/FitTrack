import 'package:bloc/bloc.dart';
import 'package:fit_track_app/features/workout/data/model/excersise_details_model.dart';
import 'package:fit_track_app/features/workout/data/repo/workout_repo.dart';
 import 'package:meta/meta.dart';

part 'get_excercise_details_state.dart';

class GetExcerciseDetailsCubit extends Cubit<GetExcerciseDetailsState> {
  GetExcerciseDetailsCubit(this.getExcerciseDetailsRepo) : super(GetExcerciseDetailsInitial());
  final WorkoutRepo getExcerciseDetailsRepo;

  Future<void> getExerciseDetails(String exerciseId) async {
    emit(GetExcerciseDetailsLoading());
    final exerciseDetailsOrFailure = await getExcerciseDetailsRepo.getExerciseDetails(exerciseId);
    exerciseDetailsOrFailure.fold(
      (failure) => emit(GetExcerciseDetailsError(errMessage: failure.errMessage)),
      (exerciseDetails) => emit(GetExcerciseDetailsSuccess(exerciseDetails: exerciseDetails)),
    );
  }
}
  