import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../core/widgets/custom_switch.dart';

class ProfileListTile extends StatelessWidget {
  const ProfileListTile({
    super.key,
    required this.title,
    required this.image,
    this.withSwitch = false,
    this.onTap,
  });
  final String title;
  final String image;
  final bool withSwitch;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap  ,
      contentPadding: EdgeInsets.zero,
      leading: SvgPicture.asset(
        image,
        height: 20.h,
        width: 20.w,
      ),
      title: Text(
        title,
        style: AppStyles.regular12.copyWith(
          color: AppColors.greyLighterColor,
        ),
      ),
      trailing: withSwitch
          ? const CustomSwitch()
          : Transform.rotate(
              angle: pi,
              child: SvgPicture.asset(
                AppIcons.backArrowIcon,
                height: 20.h,
                width: 20.w,
                colorFilter: const ColorFilter.mode(
                  AppColors.greyLighterColor,
                  BlendMode.srcIn,
                ),
              ),
            ),
    );
  }
}
