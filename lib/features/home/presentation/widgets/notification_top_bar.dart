import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../core/widgets/custom_icon_button.dart';

class NotificationTopBar extends StatelessWidget {
  const NotificationTopBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomIconButton(
          onTap: () {
            Navigator.pop(context);
          },
          image: AppIcons.backArrowIcon,
        ),
        Text(
          'Notification',
          style: AppStyles.bold16.copyWith(
            color: AppColors.blackColor,
          ),
        ),
        CustomIconButton(image: AppIcons.moreIcon),
      ],
    );
  }
}
