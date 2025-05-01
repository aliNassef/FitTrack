import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../workout/presentation/widgets/toggle_favorite_button.dart';

class MealListTileDetailsTitleWithFavorite extends StatelessWidget {
  const MealListTileDetailsTitleWithFavorite({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(
        'Blueberry Pancake',
        style: AppStyles.bold16,
      ),
      subtitle: Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: 'by',
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
              text: 'Arash Ranjbaran Qadikolaei',
              style: AppStyles.regular12.copyWith(
                color: const Color(0xff00FF66),
              ),
            ),
          ],
        ),
      ),
      trailing: const ToggleFavoriteButton(),
    );
  }
}
