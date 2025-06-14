part of 'get_meal_planner_cubit.dart';

@immutable
sealed class GetMealPlannerState {}

final class GetMealPlannerInitial extends GetMealPlannerState {}

final class GetMealPlannerLoading extends GetMealPlannerState {}

final class GetMealPlannerSuccess extends GetMealPlannerState {
  final MealModel mealModel;
  GetMealPlannerSuccess(this.mealModel);
}

final class GetMealPlannerFailure extends GetMealPlannerState {
  final String errMessage;
  GetMealPlannerFailure(this.errMessage);
}
