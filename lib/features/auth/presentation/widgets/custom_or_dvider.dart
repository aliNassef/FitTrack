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
        const Expanded(
          child: Divider(
            color: AppColors.greyMoreLighterColor,
            thickness: 1,
          ),
        ),
        const HorizontalSpace(10),
        Text(
          'Or',
          style: AppStyles.regular12.copyWith(
            color: AppColors.blackColor,
          ),
        ),
        const HorizontalSpace(10),
        const Expanded(
          child: Divider(
            color: AppColors.greyMoreLighterColor,
            thickness: 1,
          ),
        ),
      ],
    );
  }
}
