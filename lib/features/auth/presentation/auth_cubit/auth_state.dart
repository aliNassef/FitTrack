part of 'auth_cubit.dart';

sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class LoginLoading extends AuthState {}

final class LoginSuccess extends AuthState {}

final class LoginFailure extends AuthState {
  final String errMessage;

  LoginFailure({required this.errMessage});
}

final class SignupLoading extends AuthState {}

final class SignupSuccess extends AuthState {}

final class SignupFailure extends AuthState {
  final String errMessage;

  SignupFailure({required this.errMessage});
}

final class Authenticated extends AuthState {}

final class UnAuthenticated extends AuthState {}
final class AuthLoading extends AuthState {}
