import 'package:fit_track_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/app_styles.dart';
class NotificationItem extends StatelessWidget {
  const NotificationItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: CircleAvatar(
        radius: 20,
        backgroundColor: AppColors.secondaryColor,
        child: Image.asset(
          AppImages.dummy,
          height: 20,
          width: 20,
        ),
      ),
      title: Text(
        'Hey, it’s time for lunch',
        style: AppStyles.medium12.copyWith(
          color: AppColors.blackColor,
        ),
      ),
      subtitle: Text(
        'About 1 minutes ago',
        style: AppStyles.regular10.copyWith(
          color: AppColors.greyLighterColor,
        ),
      ),
      trailing: Icon(
        Icons.more_vert_outlined,
        color: AppColors.greyColor,
      ),
    );
  }
}
