import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';

class TargetTodayItem extends StatelessWidget {
  const TargetTodayItem({
    super.key,
    required this.title,
    required this.subTitle,
    required this.image,
  });
  final String title;
  final String subTitle;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(0),
        leading: SvgPicture.asset(image),
        title: ShaderMask(
          shaderCallback: (bounds) => LinearGradient(
            colors: [
              AppColors.secondaryColor,
              AppColors.primaryColor,
            ],
          ).createShader(bounds),
          child: Text(
            title,
            style: AppStyles.medium14.copyWith(
              color: Colors.white,
            ),
          ),
        ),
        subtitle: Text(
          subTitle,
          style: AppStyles.regular12.copyWith(
            color: AppColors.greyLighterColor,
          ),
        ),
      ),
    );
  }
}
