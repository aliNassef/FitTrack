part of 'search_store_bloc.dart';

@immutable
sealed class SearchStoreState {}

final class SearchStoreInitial extends SearchStoreState {}
final class SearchStoreLoading extends SearchStoreState {}
final class SearchStoreLoaded extends SearchStoreState {
  final List<ProductModel> products;
  SearchStoreLoaded({required this.products});
}
final class SearchStoreError extends SearchStoreState {
  final String errMessage;
  SearchStoreError({required this.errMessage});
}
