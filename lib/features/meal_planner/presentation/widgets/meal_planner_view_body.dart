import 'package:fit_track_app/features/meal_planner/presentation/cubits/get_meal_planner_cubit/get_meal_planner_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/extensions/padding_extension.dart';
import '../../../../core/helpers/app_spacer.dart';
import '../../../../core/widgets/curve_chart.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import 'meal_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_gradients.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../core/widgets/title_with_customdropdown.dart';
import 'explore_meals_list_items.dart';

class MealPlannerViewBody extends StatelessWidget {
  const MealPlannerViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetMealPlannerCubit, GetMealPlannerState>(
      buildWhen: (previous, current) =>
          current is GetMealPlannerSuccess ||
          current is GetMealPlannerFailure ||
          current is GetMealPlannerLoading,
      builder: (context, state) {
        if (state is GetMealPlannerSuccess) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAppBar(
                onBackButtonPressed: () {
                  Navigator.of(context).pop();
                },
                title: 'Meal Planner',
              ).withHorizontalPadding(30),
              const VerticalSpace(30),
              const TitleWithCustomDropDown(
                title: 'Meal Nutritions',
                gradientColor: AppGradients.purpleGradient,
              ).withHorizontalPadding(30),
              CurveChart(
                nutritionModel: state.mealModel.nutrition,
                textColor: AppColors.greyLighterColor,
              ).withHorizontalPadding(30),
              const VerticalSpace(30),
              Container(
                padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 20.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: AppColors.secondaryColor,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Daily Meal Schedule',
                      style: AppStyles.medium14,
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: AppColors.primaryColor,
                      ),
                      child: Text(
                        'Check',
                        style: AppStyles.regular12.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
              ).withHorizontalPadding(30),
              const VerticalSpace(30),
              const TitleWithCustomDropDown(
                title: 'Today Meals',
                gradientColor: AppGradients.greenGradient,
              ).withHorizontalPadding(30),
              const VerticalSpace(18),
              ...state.mealModel.dailyMeals.map(
                (meal) => MealItem(
                  dailyMealModel: meal,
                ).withHorizontalPadding(30),
              ),
              Text(
                'Find Something to Eat',
                style: AppStyles.semiBold16,
              ).withHorizontalPadding(30),
              const VerticalSpace(15),
              ExploreMealsListItems(
                suggestedCategoryModel: state.mealModel.suggestedCategories,
              ),
              const VerticalSpace(30),
            ],
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}
