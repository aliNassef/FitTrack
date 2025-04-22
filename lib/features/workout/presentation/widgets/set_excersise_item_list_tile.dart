import 'package:fit_track_app/features/workout/presentation/view/workout_excersises_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/app_styles.dart';

class SetExcersiseItemListTile extends StatelessWidget {
  const SetExcersiseItemListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.pushNamed(
          context,
          WorkoutExerciseView.routeName,
        );
      },
      contentPadding: EdgeInsets.zero,
      leading: Container(
        width: 60.w,
        height: 60.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          image: const DecorationImage(
            image: AssetImage(AppImages.character),
            fit: BoxFit.cover,
          ),
        ),
      ),
      title: Text(
        'Warm Up',
        style: AppStyles.medium14,
      ),
      subtitle: Text(
        '05:00',
        style: AppStyles.medium12.copyWith(
          color: AppColors.greyLighterColor,
        ),
      ),
      trailing: SvgPicture.asset(AppIcons.rightArrow),
    );
  }
}
