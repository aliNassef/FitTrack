import 'package:bloc/bloc.dart';
import '../../../data/repo/store_repo.dart';
import 'package:meta/meta.dart';

part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit(this.storeRepo) : super(PaymentInitial());
  final StoreRepo storeRepo;
  Future<void> createPaymentIntent(int amount) async {
    emit(PaymentLoading());
    final result = await storeRepo.createPaymentIntent(amount);
    result.fold(
      (failure) => emit(PaymentFailure(failure.errMessage)),
      (clientSecret) => emit(PaymentSuccess()),
    );
  }
}
