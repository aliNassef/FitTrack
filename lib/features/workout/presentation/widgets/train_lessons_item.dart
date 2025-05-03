import 'package:fit_track_app/core/extensions/padding_extension.dart';
import 'package:fit_track_app/features/workout/presentation/view/workout_details_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/app_spacer.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/app_styles.dart';
import 'view_more_button.dart';

class TrainLessonsItem extends StatelessWidget {
  const TrainLessonsItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xfff6e3fa),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Fullbody Workout',
                style: AppStyles.medium14,
              ),
              Text.rich(
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
                  ],
                ),
              ),
              const VerticalSpace(15),
              ViewMoreButton(
                onTap: () {
               Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const WorkoutDetailsView(),),
                
                );},),
              
            ],
          ).withAllPadding(20),
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.only(right: 20.w),
            foregroundDecoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppImages.character),
                fit: BoxFit.fill,
              ),
            ),
            child: CircleAvatar(
              radius: 45.r,
              backgroundColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
