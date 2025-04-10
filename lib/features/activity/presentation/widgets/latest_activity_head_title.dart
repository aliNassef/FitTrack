import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';

class LatestActivitySectionHeadTitle extends StatelessWidget {
  const LatestActivitySectionHeadTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Latest Activity',
          style: AppStyles.semiBold16,
        ),
        Text(
          'See more',
          style: AppStyles.medium12.copyWith(
            color: AppColors.greyLighterColor,
          ),
        )
      ],
    );
  }
}
