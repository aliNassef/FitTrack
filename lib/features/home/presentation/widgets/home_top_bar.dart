import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../core/widgets/custom_icon_button.dart';
import '../views/notification_view.dart';

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
                color: const Color(0xffA5A3B0),
              ),
            ),
            Text(
              'Masi Ramezanzade',
              style: AppStyles.bold20,
            ),
          ],
        ),
        CustomIconButton(
          onTap: () {
            Navigator.of(context, rootNavigator: true).pushNamed(
              NotificationView.routeName,
            );
          },
          image: AppIcons.notificationIcon,
        ),
      ],
    );
  }
}
