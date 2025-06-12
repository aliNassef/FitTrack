import 'package:bloc/bloc.dart';
import 'package:fit_track_app/features/workout/data/repo/workout_repo.dart';
import 'package:meta/meta.dart';

import '../../../data/model/workout_model.dart';

part 'get_all_workouts_state.dart';

class GetAllWorkoutsCubit extends Cubit<GetAllWorkoutsState> {
  GetAllWorkoutsCubit({required this.workoutRepo})
      : super(GetAllWorkoutsInitial());
  final WorkoutRepo workoutRepo;

  Future<void> getWorkouts() async {
    emit(GetAllWorkoutsLoading());
    final workoutsOrfailure = await workoutRepo.getWorkouts();
    workoutsOrfailure.fold(
      (failure) => emit(
        GetAllWorkoutsError(errMessage: failure.errMessage),
      ),
      (workouts) => emit(
        GetAllWorkoutsSuccess(workouts: workouts),
      ),
    );
  }
}
