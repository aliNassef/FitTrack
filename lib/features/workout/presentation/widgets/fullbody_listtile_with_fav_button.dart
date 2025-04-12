import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';
import 'toggle_favorite_button.dart';

class FullBodyListTileWithFavButton extends StatelessWidget {
  const FullBodyListTileWithFavButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(
        'Fullbody Workout',
        style: AppStyles.bold16,
      ),
      subtitle: Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: '11 Exercises',
              style: AppStyles.regular12.copyWith(
                color: AppColors.greyLighterColor,
              ),
            ),
            TextSpan(
              text: ' | ',
              style: AppStyles.regular12.copyWith(
                color: AppColors.greyLighterColor,
              ),
            ),
            TextSpan(
              text: '32mins',
              style: AppStyles.regular12.copyWith(
                color: AppColors.greyLighterColor,
              ),
            ),
            TextSpan(
              text: ' | ',
              style: AppStyles.regular12.copyWith(
                color: AppColors.greyLighterColor,
              ),
            ),
            TextSpan(
              text: '320 Calories Burn',
              style: AppStyles.regular12.copyWith(
                color: AppColors.greyLighterColor,
              ),
            ),
          ],
        ),
      ),
      trailing: ToggleFavoriteButton(),
    );
  }
}
