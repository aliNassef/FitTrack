
import 'package:flutter/material.dart';

import '../../../../core/helpers/app_spacer.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';

class CustomOrDvider extends StatelessWidget {
  const CustomOrDvider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            color: AppColors.greyMoreLighterColor,
            thickness: 1,
          ),
        ),
        HorizontalSpace(10),
        Text(
          'Or',
          style: AppStyles.regular12.copyWith(
            color: AppColors.blackColor,
          ),
        ),
        HorizontalSpace(10),
        Expanded(
          child: Divider(
            color: AppColors.greyMoreLighterColor,
            thickness: 1,
          ),
        ),
      ],
    );
  }
}
