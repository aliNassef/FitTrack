import 'package:bloc/bloc.dart';
import '../../../data/model/activity_tracker_model.dart';
import 'package:meta/meta.dart';

import '../../../data/repo/activity_repo.dart';

part 'get_activity_state.dart';

class GetActivityCubit extends Cubit<GetActivityState> {
  GetActivityCubit({required this.activityRepo}) : super(GetActivityInitial());
  final ActivityRepo activityRepo;

  Future<void> getTrackerData() async {
    emit(GetActivityLoading());
    final result = await activityRepo.getTrackerData();
    result.fold(
      (failure) => emit(
        GetActivityFailure(errorMessage: failure.errMessage),
      ),
      (activityTrackerModel) => emit(
        GetActivitySuccess(activityTrackerModel: activityTrackerModel),
      ),
    );
  }
}
