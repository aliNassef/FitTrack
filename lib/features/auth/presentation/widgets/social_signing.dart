import 'package:fit_track_app/core/extensions/padding_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_images.dart';

class SocialSigning extends StatelessWidget {
  const SocialSigning({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 30.w,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14.r),
            border: Border.all(
              color: AppColors.greyMoreLighterColor,
            ),
          ),
          child: SvgPicture.asset(AppIcons.googleIcon).withAllPadding(15),
        ),
        DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14.r),
            border: Border.all(
              color: AppColors.greyMoreLighterColor,
            ),
          ),
          child: SvgPicture.asset(AppIcons.faceIcon).withAllPadding(15),
        )
      ],
    );
  }
}
