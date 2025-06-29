import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';
import '../../data/model/workout_model.dart';
import 'toggle_favorite_button.dart';

class FullBodyListTileWithFavButton extends StatelessWidget {
  const FullBodyListTileWithFavButton({
    super.key,
    required this.workout,
  });
  final WorkoutModel workout;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(
        workout.title,
        style: AppStyles.bold16,
      ),
      subtitle: Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: '${workout.exercises} Exercises',
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
              text: '${workout.duration} mins',
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
              text: 'Calories Burn',
              style: AppStyles.regular12.copyWith(
                color: AppColors.greyLighterColor,
              ),
            ),
          ],
        ),
      ),
      trailing: const ToggleFavoriteButton(),
    );
  }
}
