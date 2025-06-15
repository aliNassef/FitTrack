import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/app_spacer.dart';
import '../../../../core/utils/app_styles.dart';
import '../../data/model/meal_category_model/sub_category_meal_model.dart';

class CategoryListItems extends StatelessWidget {
  const CategoryListItems({
    super.key,
    required this.subcategoryMealModel,
  });
  final List<SubcategoryMealModel> subcategoryMealModel;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: const Color(0xffcdfee6),
            ),
            width: 80.w,
            height: 100.h,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 10.h,
              children: [
                CircleAvatar(
                  radius: 20.r,
                  backgroundImage: NetworkImage(
                    subcategoryMealModel[index].image,
                  ),
                  backgroundColor: Colors.white,
                ),
                Text(
                  subcategoryMealModel[index].name,
                  style: AppStyles.regular12,
                ),
              ],
            ),
          );
        },
        separatorBuilder: (_, index) {
          return const HorizontalSpace(15);
        },
        itemCount: subcategoryMealModel.length,
      ),
    );
  }
}
