import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/app_styles.dart';

class EquipmentItem extends StatelessWidget {
  const EquipmentItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 10.h,
      children: [
        Container(
          padding: EdgeInsets.all(10.r),
          height: 130.h,
          width: 130.w,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: const Color(0xffF7F8F8),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Image.asset(
            AppImages.character,
            height: 90.h,
            width: 90.w,
          ),
        ),
        Text(
          'Barbell',
          style: AppStyles.regular12.copyWith(
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
