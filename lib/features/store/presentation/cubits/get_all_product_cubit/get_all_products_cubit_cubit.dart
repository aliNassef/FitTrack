import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/model/product_model.dart';
import '../../../data/repo/store_repo.dart';

part 'get_all_products_cubit_state.dart';

class GetAllProductsCubitCubit extends Cubit<GetAllProductsCubitState> {
  GetAllProductsCubitCubit(this.repo) : super(GetAllProductsCubitInitial());
  final StoreRepo repo;

  void getAllProducts() async {
    emit(GetAllProductsLoading());
    final result = await repo.getProducts();
    result.fold(
      (failure) => emit(
        GetAllProductsFailure(errMessage: failure.errMessage),
      ),
      (products) => emit(
        GetAllProductsSuccess(products: products),
      ),
    );
  }
}
