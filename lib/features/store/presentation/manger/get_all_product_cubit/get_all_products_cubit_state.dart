part of 'get_all_products_cubit_cubit.dart';

@immutable
sealed class GetAllProductsCubitState {}

final class GetAllProductsCubitInitial extends GetAllProductsCubitState {}

final class GetAllProductsLoading extends GetAllProductsCubitState {}

final class GetAllProductsSuccess extends GetAllProductsCubitState {
  final List<ProductModel> products;

  GetAllProductsSuccess({required this.products});
}

final class GetAllProductsFailure extends GetAllProductsCubitState {
  final String errMessage;

  GetAllProductsFailure({required this.errMessage});
}
