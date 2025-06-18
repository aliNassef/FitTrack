import 'package:fit_track_app/features/workout/data/model/workout_model.dart';

import '../../../../core/extensions/padding_extension.dart';
import '../view/workout_details_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/app_spacer.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';
import 'view_more_button.dart';

class TrainLessonsItem extends StatelessWidget {
  const TrainLessonsItem({
    super.key,
    required this.instance,
  });
  final WorkoutModel instance;
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
                instance.title,
                style: AppStyles.medium14,
              ),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: '${instance.exercises} Exercises',
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
                      text: '${instance.duration} mins',
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
                  Navigator.of(context, rootNavigator: true).pushNamed(
                    WorkoutDetailsView.routeName,
                    arguments: instance.id,
                  );
                },
              ),
            ],
          ).withAllPadding(20),
          CircleAvatar(
            radius: 45.r,
            backgroundImage: NetworkImage(
              instance.image,
            ),
            backgroundColor: Colors.white,
          ),
          const HorizontalSpace(3),
        ],
      ),
    );
  }
}
