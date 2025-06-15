part of 'get_category_cubit.dart';

@immutable
sealed class GetCategoryState {}

final class GetCategoryInitial extends GetCategoryState {}

final class GetCategoryLoading extends GetCategoryState {}

final class GetCategorySuccess extends GetCategoryState {
  final CategoryMealModel categories;
  GetCategorySuccess(this.categories);
}

final class GetCategoryFailure extends GetCategoryState {
  final String errMessage;
  GetCategoryFailure(this.errMessage);
}
