import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/app_spacer.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart'; 
class CustomListWheel extends StatefulWidget {
  const CustomListWheel({
    super.key,
  });

  @override
  State<CustomListWheel> createState() => _CustomListWheelState();
}

class _CustomListWheelState extends State<CustomListWheel> {
  int indexSelected = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150.h,
      child: ListWheelScrollView(
        itemExtent: 60.h,
        diameterRatio: 1.5,
        physics: const FixedExtentScrollPhysics(),
        children: List.generate(
          3,
          (index) => Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: Colors.grey.withValues(alpha: 0.2),
                  width: 1,
                ),
                bottom: BorderSide(
                  color: Colors.grey.withValues(alpha: 0.2),
                  width: 1,
                ),
              ),
            ),
            child: Row(
              spacing: 10.w,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.local_fire_department,
                      color: index == indexSelected
                          ? Colors.red
                          : Colors.pink.withValues(alpha: 0.3),
                      size: 24,
                    ),
                    const HorizontalSpace(10),
                    Text(
                      '450 Calories Burn',
                      style: AppStyles.regular10.copyWith(
                        color: index == indexSelected
                            ? AppColors.greyLighterColor
                            : const Color(0xffA5A3B0),
                      ),
                    ),
                  ],
                ),
                Text(
                  '30',
                  style: AppStyles.medium24.copyWith(
                    color: index == indexSelected
                        ? const Color(0xffA5A3B0)
                        : AppColors.greyLighterColor,
                    fontSize: index == indexSelected ? 24.sp : 18.sp,
                  ),
                ),
                if (index == indexSelected)
                  Text(
                    'times',
                    style: AppStyles.regular16.copyWith(
                      color: const Color(0xffA5A3B0),
                    ),
                  )
              ],
            ),
          ),
        ),
        onSelectedItemChanged: (index) {
          setState(() {
            indexSelected = index;
          });
        },
      ),
    );
  }
}
