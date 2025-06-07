import '../../../../core/utils/app_images.dart';
import '../view/category_meal_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/app_spacer.dart';
import '../../../../core/helpers/default_app_button.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';

class ExploreMealItem extends StatelessWidget {
  const ExploreMealItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.h,
      width: 200.w,
      padding: EdgeInsets.only(
        left: 20.w,
        bottom: 20.h,
      ),
      decoration: const BoxDecoration(
        color: Color(0xffccfee9),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(22),
          topRight: Radius.circular(100),
          bottomLeft: Radius.circular(22),
          bottomRight: Radius.circular(22),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Image.asset(AppImages.meal),
          ),
          const VerticalSpace(12),
          Text(
            'Breakfast',
            style: AppStyles.medium14,
          ),
          const VerticalSpace(5),
          Text(
            '120+ Foods',
            style: AppStyles.regular12.copyWith(
              color: AppColors.greyLighterColor,
            ),
          ),
          const VerticalSpace(15),
          SizedBox(
            width: 100.w,
            height: 40.h,
            child: DefaultAppButton(
              onPressed: () {
                Navigator.pushNamed(context, CategoryMealView.routeName);
              },
              text: 'Select',
            ),
          ),
        ],
      ),
    );
  }
}
