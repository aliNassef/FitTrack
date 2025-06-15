import 'package:fit_track_app/core/widgets/custom_failure_widget.dart';
import 'package:fit_track_app/features/meal_planner/presentation/cubits/get_category_cubit/get_category_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/helpers/app_spacer.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import '../../../../core/utils/app_styles.dart';
import '../../data/model/meal_category_model/meal_item_model.dart';
import '../../data/model/meal_category_model/sub_category_meal_model.dart';
import '../view/meal_details_view.dart';
import '../widgets/category_list_items.dart';
import '../widgets/custom_search_bar.dart';
import '../widgets/popular_meal_item.dart';
import '../widgets/recommended_meal_list_items.dart';

class CategoryMealViewBody extends StatelessWidget {
  const CategoryMealViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetCategoryCubit, GetCategoryState>(
      buildWhen: (previous, current) =>
          current is GetCategorySuccess ||
          current is GetCategoryFailure ||
          current is GetCategoryLoading,
      builder: (context, state) {
        if (state is GetCategorySuccess) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAppBar(
                title: state.categories.name,
                onBackButtonPressed: () {
                  Navigator.pop(context);
                },
              ),
              const VerticalSpace(34),
              const CustomSearchBar(),
              const VerticalSpace(30),
              Text(
                'Category',
                style: AppStyles.semiBold16,
              ),
              const VerticalSpace(15),
              CategoryListItems(
                subcategoryMealModel: state.categories.subcategories,
              ),
              const VerticalSpace(30),
              Text(
                'Recommendation for Diet',
                style: AppStyles.semiBold16,
              ),
              const VerticalSpace(15),
              RecommendedMealListItems(
                meals: getPopularMeal(state.categories.subcategories),
              ),
              const VerticalSpace(30),
              Text(
                'Popular',
                style: AppStyles.semiBold16,
              ),
              const VerticalSpace(15),
              Expanded(
                child: ListView.separated(
                  itemBuilder: (_, index) {
                    return PopularMealItem(
                      meal:
                          getPopularMeal(state.categories.subcategories)[index],
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          MealDetailsView.routeName,
                        );
                      },
                    );
                  },
                  separatorBuilder: (_, __) {
                    return const VerticalSpace(15);
                  },
                  itemCount:
                      getPopularMeal(state.categories.subcategories).length,
                ),
              ),
            ],
          );
        }

        if (state is GetCategoryFailure) {
          return CustomFailureWidget(errMessage: state.errMessage);
        }

        if (state is GetCategoryLoading) {
          return const Center(child: CircularProgressIndicator.adaptive());
        }
        return const SizedBox.shrink();
      },
    );
  }

  List<MealItemModel> getPopularMeal(List<SubcategoryMealModel> categories) {
    List<MealItemModel> meals = [];
    for (var meal in categories) {
      for (var mealItem in meal.meals) {
        meals.add(mealItem);
      }
    }
    return meals;
  }
}
