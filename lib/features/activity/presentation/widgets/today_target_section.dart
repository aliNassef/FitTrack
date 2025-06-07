import '../../../../core/extensions/padding_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/app_styles.dart';
import 'target_today_item.dart';

class TodayTargetSection extends StatelessWidget {
  const TodayTargetSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color:const Color(0xfff6e3fa),
        borderRadius: BorderRadius.circular(22),
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        spacing: 15.h,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Today Target',
                style: AppStyles.semiBold16,
              ),
              DecoratedBox(
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      AppColors.secondaryColor,
                      AppColors.primaryColor,
                    ],
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                ).withAllPadding(5),
              )
            ],
          ),
          Row(
            spacing: 15.w,
            children: [
            const  Expanded(
                child: TargetTodayItem(
                  title: '8L',
                  subTitle: 'Water intake',
                  image: AppIcons.cupOfWaterIcon,
                ),
              ),
       const       Expanded(
                child: TargetTodayItem(
                  title: '2400',
                  subTitle: 'Foot Steps',
                  image: AppIcons.footStepIcon,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
