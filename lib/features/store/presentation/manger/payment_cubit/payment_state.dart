part of 'payment_cubit.dart';

@immutable
sealed class PaymentState {}

final class PaymentInitial extends PaymentState {}

final class PaymentLoading extends PaymentState {}

final class PaymentFailure extends PaymentState {
  final String error;

  PaymentFailure(this.error);
}

final class PaymentSuccess extends PaymentState {}
