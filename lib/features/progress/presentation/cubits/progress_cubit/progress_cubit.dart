import 'package:bloc/bloc.dart';
import 'package:fit_track_app/features/progress/data/model/gallrey_model.dart';
import 'package:fit_track_app/features/progress/data/repo/progress_repo.dart';
import 'package:meta/meta.dart';

part 'progress_state.dart';

class ProgressCubit extends Cubit<ProgressState> {
  ProgressCubit(this.progressRepo) : super(ProgressInitial());
  final ProgressRepo progressRepo;

  void getProgress() async {
    emit(ProgressLoading());
    final progressOrfailure = await progressRepo.getProgress();
    progressOrfailure.fold(
      (failure) => emit(
        ProgressFailure(errMessage: failure.errMessage),
      ),
      (progress) => emit(
        ProgressLoaded(progressModel: progress),
      ),
    );
  }
}
