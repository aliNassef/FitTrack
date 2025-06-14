import 'package:fit_track_app/features/meal_planner/data/model/suggest_category_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/app_spacer.dart';
import 'explore_meal_item.dart';

class ExploreMealsListItems extends StatelessWidget {
  const ExploreMealsListItems({
    super.key,
    required this.suggestedCategoryModel,
  });
  final List<SuggestedCategoryModel> suggestedCategoryModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 30.w),
      child: SizedBox(
        height: 220.h,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, index) {
            return ExploreMealItem(
              suggestedCategoryModel: suggestedCategoryModel[index],
            );
          },
          separatorBuilder: (_, __) {
            return const HorizontalSpace(15);
          },
          itemCount: suggestedCategoryModel.length,
        ),
      ),
    );
  }
}
