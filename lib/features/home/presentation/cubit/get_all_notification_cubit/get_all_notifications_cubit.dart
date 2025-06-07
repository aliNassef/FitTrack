import 'package:bloc/bloc.dart';
import '../../../data/models/notification_model.dart';
import 'package:meta/meta.dart';

import '../../../data/repo/home_repo.dart';

part 'get_all_notifications_state.dart';

class GetAllNotificationsCubit extends Cubit<GetAllNotificationsState> {
  GetAllNotificationsCubit(this.homeRepo) : super(GetAllNotificationsInitial());
  final HomeRepo homeRepo;

  void getAllNotifications() async {
    emit(GetAllNotificationsLoading());
    final notificationsOrfailure = await homeRepo.getNotifications();
    notificationsOrfailure.fold(
      (failure) => emit(
        GetAllNotificationsError(errMessage: failure.errMessage),
      ),
      (notificationResponse) => emit(
        GetAllNotificationsSuccess(
          notificationsModel: notificationResponse.data.notifications,
        ),
      ),
    );
  }
}
