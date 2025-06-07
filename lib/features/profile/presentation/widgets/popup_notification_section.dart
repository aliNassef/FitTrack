import 'profile_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/app_spacer.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/app_shadows.dart';
import '../../../../core/utils/app_styles.dart';

class PopupNotificationSection extends StatelessWidget {
  const PopupNotificationSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: AppShadows.shadow1,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Notification',
            style: AppStyles.semiBold16,
          ),
          const VerticalSpace(15),
          const ProfileListTile(
            withSwitch: true,
            title: 'Pop-up Notification',
            image: AppIcons.popupNotificationIcon,
          ),
        ],
      ),
    );
  }
}
