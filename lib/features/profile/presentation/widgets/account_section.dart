import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/app_spacer.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/app_shadows.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../workout/presentation/view/workout_view.dart';
import 'profile_list_tile.dart';

class AccountSection extends StatelessWidget {
  const AccountSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: AppShadows.shadow1,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Account',
            style: AppStyles.semiBold16,
          ),
          const VerticalSpace(15),
          const ProfileListTile(
            title: 'Personal Data',
            image: AppIcons.profilegreenIcon,
          ),
          const VerticalSpace(5),
          const ProfileListTile(
            title: 'Achievement',
            image: AppIcons.achivementsIcon,
          ),
          const VerticalSpace(5),
          const ProfileListTile(
            title: 'Activity History',
            image: AppIcons.activityHistoryIcon,
          ),
          const VerticalSpace(5),
          ProfileListTile(
            onTap: () {
              Navigator.pushNamed(
                context,
                WorkoutView.routeName,
              );
            },
            title: 'Workout Progress',
            image: AppIcons.workoutIcon,
          ),
        ],
      ),
    );
  }
}
