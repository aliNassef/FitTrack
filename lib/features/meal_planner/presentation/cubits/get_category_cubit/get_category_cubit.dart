import 'package:bloc/bloc.dart';
import '../../../data/repo/meal_repo.dart';
import 'package:meta/meta.dart';

import '../../../data/model/meal_category_model/category_meal_model.dart';

part 'get_category_state.dart';

class GetCategoryCubit extends Cubit<GetCategoryState> {
  GetCategoryCubit(this._mealRepo) : super(GetCategoryInitial());
  final MealRepo _mealRepo;

  void getCategoryById(String id) async {
    emit(GetCategoryLoading());
    final categoriesOrFailure = await _mealRepo.getMealCategoryById(id);
    categoriesOrFailure.fold(
      (failure) => emit(GetCategoryFailure(failure.errMessage)),
      (categories) => emit(GetCategorySuccess(categories)),
    );
  }
}