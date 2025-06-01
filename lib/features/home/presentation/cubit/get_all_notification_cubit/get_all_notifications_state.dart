part of 'get_all_notifications_cubit.dart';

@immutable
sealed class GetAllNotificationsState {}

final class GetAllNotificationsInitial extends GetAllNotificationsState {}

final class GetAllNotificationsLoading extends GetAllNotificationsState {}

final class GetAllNotificationsSuccess extends GetAllNotificationsState {
  final List<NotificationModel> notificationsModel;

  GetAllNotificationsSuccess({required this.notificationsModel});
}

final class GetAllNotificationsError extends GetAllNotificationsState {
  final String errMessage;

  GetAllNotificationsError({required this.errMessage});
}
