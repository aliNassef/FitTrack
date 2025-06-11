import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/repo/activity_repo.dart';

part 'activity_state.dart';

class ActivityCubit extends Cubit<ActivityState> {
  ActivityCubit({required this.activityRepo}) : super(ActivityInitial());
  final ActivityRepo activityRepo;

  Future<void> addDailyTarget(
      {required int waterIntake, required int footSteps}) async {
    emit(AddDailyActivityLoading());
    final result = await activityRepo.addDailyTarget(
      waterIntake: waterIntake,
      footSteps: footSteps,
    );
    result.fold(
      (failure) => emit(
        AddDailyActivityFailure(
          errorMessage: failure.errMessage,
        ),
      ),
      (activityTrackerModel) => emit(
        AddDailyActivitySuccess(),
      ),
    );
  }
}
