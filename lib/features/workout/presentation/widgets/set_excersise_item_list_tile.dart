import '../../data/model/excersise_model.dart';
import '../view/workout_excersises_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/app_styles.dart';

class SetExcersiseItemListTile extends StatelessWidget {
  const SetExcersiseItemListTile({super.key, required this.exercise});
  final ExerciseModel exercise;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return const WorkoutExerciseView();
            },
          ),
        );
      },
      contentPadding: EdgeInsets.zero,
      leading: Container(
        width: 60.w,
        height: 60.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          image: DecorationImage(
            image: NetworkImage(
              exercise.image ??
                  'https://cdn.pixabay.com/photo/2023/03/28/13/28/ai-generated-7883147_960_720.jpg',
            ),
            fit: BoxFit.cover,
          ),
        ),
      ),
      title: Text(
        exercise.title,
        style: AppStyles.medium14,
      ),
      subtitle: Text(
        '${exercise.duration} min',
        style: AppStyles.medium12.copyWith(
          color: AppColors.greyLighterColor,
        ),
      ),
      trailing: SvgPicture.asset(AppIcons.rightArrow),
    );
  }
}
