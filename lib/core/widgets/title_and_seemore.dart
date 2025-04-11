import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';

class TitleAndSeeMore extends StatelessWidget {
  const TitleAndSeeMore({
    super.key,
    required this.title,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
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
