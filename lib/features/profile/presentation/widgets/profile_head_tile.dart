import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/default_app_button.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/app_styles.dart';

class ProfileHeadTile extends StatelessWidget {
  const ProfileHeadTile({
    super.key,
    required this.email,
    required this.name,
  });
  final String email;
  final String name;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: CircleAvatar(
        radius: 27.5,
        backgroundColor: AppColors.secondaryColor,
        child: Image.asset(
          AppImages.dummy,
          height: 35.5,
          width: 35.5,
        ),
      ),
      title: Text(
        name,
        style: AppStyles.medium14,
      ),
      subtitle: Text(
        email,
        style: AppStyles.regular12.copyWith(
          color: AppColors.greyLighterColor,
        ),
      ),
      trailing: SizedBox(
        height: 30.h,
        width: 80.w,
        child: DefaultAppButton(
          text: 'Edit',
          onPressed: () {},
        ),
      ),
    );
  }
}
