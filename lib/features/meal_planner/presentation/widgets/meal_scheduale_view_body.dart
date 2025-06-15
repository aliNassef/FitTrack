import '../../../../core/helpers/app_spacer.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../core/widgets/custom_head_title_and_subtitle_button.dart';
import 'package:flutter/material.dart';
import 'meal_scheduale.dart';
import 'meal_scheduale_list_tile.dart';
import 'progress_bar.dart';

class MealSchedualeViewBody extends StatelessWidget {
  const MealSchedualeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomAppBar(
          title: 'Meal Schedule',
          onBackButtonPressed: () {
            Navigator.pop(context);
          },
        ),
        const VerticalSpace(30),
        const MealScheduale(),
        const VerticalSpace(30),
        const CustomHeadTittleAndSubTitleButton(
          title: 'Breakfast',
          subtitle: '2 meals | 230 calories',
        ),
        const MealSchedualeListTile(),
        const VerticalSpace(30),
        Text(
          'Today Meal Nutritions',
          style: AppStyles.semiBold16,
        ),
        const CaloriesProgressBar(
          calories: 300,
        )
      ],
    );
  }
}
