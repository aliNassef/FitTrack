import 'package:bloc/bloc.dart';
import 'package:fit_track_app/features/home/data/repo/home_repo.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.homeRepo) : super(HomeInitial());
  final HomeRepo homeRepo;
  void getNotificationUnreadedCount() async {
    emit(GetNotificationCountLoading());
    final notificationStatsOrFailure = await homeRepo.getNotificationStats();
    notificationStatsOrFailure.fold(
      (failure) => emit(GetNotificationCountError()),
      (notificationStatsResponse) => emit(
        GetNotificationCountLoaded(
          count: notificationStatsResponse.data.statusStats.isNotEmpty
              ? notificationStatsResponse.data.statusStats[0].count
              : 0,
        ),
      ),
    );
  }
}
