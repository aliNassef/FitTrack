
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/app_spacer.dart';
import 'explore_meal_item.dart';

class ExploreMealsListItems extends StatelessWidget {
  const ExploreMealsListItems({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 30.w),
      child: SizedBox(
        height: 220.h,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, index) {
            return const ExploreMealItem();
          },
          separatorBuilder: (_, __) {
            return const HorizontalSpace(15);
          },
          itemCount: 4,
        ),
      ),
    );
  }
}
