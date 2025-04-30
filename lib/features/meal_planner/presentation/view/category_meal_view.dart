import 'package:fit_track_app/core/extensions/padding_extension.dart';
import 'package:fit_track_app/core/helpers/app_spacer.dart';
import 'package:fit_track_app/core/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_styles.dart';
import '../widgets/category_list_items.dart';
import '../widgets/custom_search_bar.dart';
import '../widgets/popular_meal_item.dart';
import '../widgets/recommended_meal_list_items.dart';

class CategoryMealView extends StatelessWidget {
  const CategoryMealView({super.key});
  static const routeName = 'category-meals';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomAppBar(title: 'Breakfast'),
            const VerticalSpace(34),
            const CustomSearchBar(),
            const VerticalSpace(30),
            Text(
              'Category',
              style: AppStyles.semiBold16,
            ),
            const VerticalSpace(15),
            const CategoryListItems(),
            const VerticalSpace(30),
            Text(
              'Recommendation for Diet',
              style: AppStyles.semiBold16,
            ),
            const VerticalSpace(15),
            const RecommendedMealListItems(),
            const VerticalSpace(30),
            Text(
              'Popular',
              style: AppStyles.semiBold16,
            ),
            const VerticalSpace(15),
            const PopularMealItem(),
          ],
        ).withHorizontalPadding(30),
      ),
    );
  }
}
