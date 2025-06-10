import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../data/model/category_model.dart';
import '../../../../data/repo/store_repo.dart';

part 'get_all_categories_state.dart';

class GetAllCategoriesCubit extends Cubit<GetAllCategoriesState> {
  GetAllCategoriesCubit(this.repo) : super(GetAllCategoriesInitial());
  final StoreRepo repo;

  void getAllCategories() async {
    emit(GetAllCategoriesLoading());
    final result = await repo.getCategories();
    result.fold(
      (failure) => emit(
        GetAllCategoriesFailure(errMessage: failure.errMessage),
      ),
      (categories) => emit(
        GetAllCategoriesSuccess(categories: categories),
      ),
    );
  }
}
