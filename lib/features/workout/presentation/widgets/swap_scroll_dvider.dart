import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_colors.dart';

class SwapScrollDvider extends StatelessWidget {
  const SwapScrollDvider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50.w,
      height: 5.h,
      decoration: BoxDecoration(
        color: AppColors.blackColor.withValues(alpha: .1),
        borderRadius: BorderRadius.circular(50),
      ),
    );
  }
}
