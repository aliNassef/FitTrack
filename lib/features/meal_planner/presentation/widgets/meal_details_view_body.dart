import 'package:fit_track_app/features/meal_planner/data/model/meal_category_model/meal_nutrition_model.dart';

import '../../../../core/extensions/mediaquery_size.dart';
import '../../../../core/extensions/padding_extension.dart';
import '../../../../core/widgets/custom_network_image.dart';
import '../../../../core/widgets/read_more_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/helpers/app_spacer.dart';
import '../../../../core/helpers/default_app_button.dart';
import '../../../../core/utils/app_gradients.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../core/widgets/custom_head_title_and_subtitle_button.dart';
import '../../../workout/presentation/widgets/step_item.dart';
import '../../../workout/presentation/widgets/swap_scroll_dvider.dart';
import '../../data/model/meal_category_model/meal_item_model.dart';
import '../widgets/ingredients_list_items.dart';
import '../widgets/meal_list_tile_details_title_with_favorite.dart';
import '../widgets/nurition_list_items.dart';

class MealDetailsViewBody extends StatelessWidget {
  const MealDetailsViewBody({
    super.key,
    required this.meal,
  });
  final MealItemModel meal;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: context.height,
          width: context.width,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: AppGradients.pinkGradient,
            ),
          ),
          child: CustomScrollView(
            slivers: [
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                sliver: SliverAppBar(
                  automaticallyImplyLeading: false,
                  backgroundColor: Colors.transparent,
                  title: CustomAppBar(
                    onBackButtonPressed: () {
                      Navigator.of(context).pop();
                    },
                    title: '',
                    titleColor: Colors.white,
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    const VerticalSpace(10),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(
                          alpha: 0.3,
                        ),
                        image: const DecorationImage(
                          image: AssetImage(AppImages.workoutBackground),
                          fit: BoxFit.cover,
                        ),
                        shape: BoxShape.circle,
                      ),
                      child: CustomNetworkImage(
                        img: meal.image,
                        height: 150.h,
                        width: 150.w,
                      ),
                    ),
                    const VerticalSpace(15),
                  ],
                ).withHorizontalPadding(30),
              ),
              SliverToBoxAdapter(
                child: _buildMealDetailsContent(),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 40.h,
          left: 0,
          right: 0,
          child: DefaultAppButton(
            text: 'Add to Breakfast Meal',
            onPressed: () {},
          ).withHorizontalPadding(30),
        ),
      ],
    );
  }

  Container _buildMealDetailsContent() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30.w),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(40),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const VerticalSpace(10),
          const Align(
            alignment: Alignment.center,
            child: SwapScrollDvider(),
          ),
          const VerticalSpace(30),
          MealListTileDetailsTitleWithFavorite(
            meal: meal,
          ),
          const VerticalSpace(30),
          Text(
            'Nutrition',
            style: AppStyles.semiBold16,
          ),
          const VerticalSpace(15),
          SizedBox(
            height: 45.h,
            child: NutritionListItems(
              mealNutritionModel: meal.nutrition ??
                  const MealNutritionModel(
                    calories: 0,
                    fats: 0,
                    proteins: 0,
                    id: '',
                  ),
            ),
          ),
          const VerticalSpace(30),
          Text(
            'Descriptions',
            style: AppStyles.semiBold16,
          ),
          const VerticalSpace(30),
          ReadMoreText(
            text: meal.description,
          ),
          const VerticalSpace(30),
          CustomHeadTittleAndSubTitleButton(
            title: 'Ingredients That You Will Need',
            subtitle: '${meal.ingredients.length} items',
          ),
          const VerticalSpace(15),
          SizedBox(
            height: 140.h,
            child: IngredientsListItems(
              mealIngredients: meal.ingredients,
            ),
          ),
          const VerticalSpace(30),
          CustomHeadTittleAndSubTitleButton(
            title: 'Step by Step',
            subtitle: '${meal.steps.length} Steps',
          ),
          const VerticalSpace(15),
          // ...List.generate(
          //   meal.steps.length,
          //   (index) => StepItem(
          //     isLast: index == meal.steps.length - 1,
          //     stepModel: meal.steps[index],
          //   ),
          // ),
          const VerticalSpace(100),
        ],
      ),
    );
  }
}
