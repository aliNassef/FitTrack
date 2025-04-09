import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/app_styles.dart';

class HomeTopBar extends StatelessWidget {
  const HomeTopBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 5.h,
          children: [
            Text(
              'Welcome Back,',
              style: AppStyles.regular12.copyWith(
                color: Color(0xffA5A3B0),
              ),
            ),
            Text(
              'Masi Ramezanzade',
              style: AppStyles.bold20,
            ),
          ],
        ),
        InkWell(
          borderRadius: BorderRadius.circular(8),
          onTap: () {},
          child: Container(
            width: 40.w,
            height: 40.h,
            decoration: ShapeDecoration(
              color: const Color(0xFFF7F8F8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Center(
              child: SvgPicture.asset(
                AppIcons.notificationIcon,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
