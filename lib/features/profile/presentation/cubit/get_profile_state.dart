part of 'get_profile_cubit.dart';

@immutable
sealed class GetProfileState {}

final class GetProfileInitial extends GetProfileState {}

final class GetProfileLoading extends GetProfileState {}

final class GetProfileLoaded extends GetProfileState {
  final UserProfile user;

  GetProfileLoaded({required this.user});
}

final class GetProfileFailure extends GetProfileState {
  final String errorMessage;
  GetProfileFailure({required this.errorMessage});
}
