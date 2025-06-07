part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}
final class GetNotificationCountLoading extends HomeState {}
final class GetNotificationCountError extends HomeState {}
final class GetNotificationCountLoaded extends HomeState {
  final int count;
  GetNotificationCountLoaded({required this.count});
}
