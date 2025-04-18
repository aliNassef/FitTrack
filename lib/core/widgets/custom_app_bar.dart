import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../utils/app_images.dart';
import '../utils/app_styles.dart';
import 'custom_icon_button.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    this.titleColor,
  });
  final String title;
  final Color? titleColor;
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
          title,
          style: AppStyles.bold16.copyWith(
            color: titleColor ?? AppColors.blackColor,
          ),
        ),
        const CustomIconButton(image: AppIcons.moreIcon),
      ],
    );
  }
}
