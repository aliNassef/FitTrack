import 'package:fit_track_app/core/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/app_spacer.dart';
import '../../../../core/helpers/default_app_button.dart';
import '../../../../core/utils/app_shadows.dart';
import '../../../../core/utils/app_styles.dart';

class HomeGridItem extends StatelessWidget {
  const HomeGridItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xffFFFFFF),
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: AppShadows.shadow1,
      ),
      width: 150.w,
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
      child: Stack(
        children: [
          Text(
            'Equipment You Need',
            style: AppStyles.medium14.copyWith(
              color: Color(0xff000000),
            ),
            textAlign: TextAlign.center,
          ),
          VerticalSpace(7),
          Positioned(
            top: 50.h,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 20.h,
                  width: 60.w,
                  child: DefaultAppButton(
                    text: 'Go To',
                    textStyle: AppStyles.semiBold10.copyWith(
                      color: Colors.white,
                    ),
                    onPressed: () {},
                  ),
                ),
                ShaderMask(
                  shaderCallback: (bounds) => const LinearGradient(
                    colors: [
                      Color(0xff263238),
                      Color(0xffC150F6),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ).createShader(
                    Rect.fromLTWH(0, 0, bounds.width, bounds.height),
                  ),
                  child: Text(
                    '  Store',
                    style: AppStyles.semiBold10.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0.h,
            child: Image.asset(
              alignment: Alignment.topCenter,
              AppImages.homeBackgroundItem,
            ),
          ),
        ],
      ),
    );
  }
}
