import 'package:bloc/bloc.dart';
import '../../../data/repo/meal_repo.dart';
import 'package:meta/meta.dart';

import '../../../data/model/meal_planner_model/meal_model.dart';

part 'get_meal_planner_state.dart';

class GetMealPlannerCubit extends Cubit<GetMealPlannerState> {
  GetMealPlannerCubit(this._mealRepo) : super(GetMealPlannerInitial());
  final MealRepo _mealRepo;

  void getMealPlanner() async {
    emit(GetMealPlannerLoading());
    final mealOrfailure = await _mealRepo.getMealPlanner();
    mealOrfailure.fold(
      (failure) => emit(GetMealPlannerFailure(failure.errMessage)),
      (mealModel) => emit(GetMealPlannerSuccess(mealModel)),
    );
  }
}
