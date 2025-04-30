import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/app_spacer.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';

class CategoryListItems extends StatelessWidget {
  const CategoryListItems({
    super.key,
  });

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
              color: AppColors.greenLightColor,
            ),
            width: 80.w,
            height: 100.h,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 10.h,
              children: [
                CircleAvatar(
                  radius: 20.r,
                  backgroundColor: Colors.white,
                ),
                Text(
                  'Salad',
                  style: AppStyles.regular12,
                ),
              ],
            ),
          );
        },
        separatorBuilder: (_, index) {
          return const HorizontalSpace(15);
        },
        itemCount: 10,
      ),
    );
  }
}
