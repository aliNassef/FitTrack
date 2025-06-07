import '../../../../core/extensions/mediaquery_size.dart';
import '../../../../core/extensions/padding_extension.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/helpers/app_spacer.dart';
import '../../../../core/utils/app_gradients.dart';
import '../../../../core/widgets/curve_chart.dart';
import '../../../../core/widgets/title_and_seemore.dart';
import 'swap_scroll_dvider.dart';
import 'train_lessons_item.dart';
import 'up_coming_workout_list_tile.dart';

class WorkoutViewBody extends StatelessWidget {
  const WorkoutViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.height,
      width: context.width,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: AppGradients.pinkGradient,
        ),
      ),
      child: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            sliver: SliverAppBar(
              automaticallyImplyLeading: false,
              backgroundColor: Colors.transparent,
              title: CustomAppBar(
                title: 'Workout Tracker',
                titleColor: Colors.white,
                onBackButtonPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: const Column(
              children: [
                VerticalSpace(30),
                CurveChart(),
                VerticalSpace(15),
              ],
            ).withHorizontalPadding(30),
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const VerticalSpace(10),
                  const Align(
                    alignment: Alignment.center,
                    child: SwapScrollDvider(),
                  ),
                  const VerticalSpace(60),
                  const TitleAndSeeMore(
                    title: 'Upcoming Workout',
                  ),
                  const VerticalSpace(15),
                  const UpComingWorkoutListTile(),
                  const VerticalSpace(15),
                  const UpComingWorkoutListTile(),
                  VerticalSpace(context.height * .08),
                  Text(
                    'What Do You Want to Train',
                    style: AppStyles.semiBold16,
                  ),
                  const VerticalSpace(15),
                  Column(
                    children: List.generate(
                      10,
                      (index) => Padding(
                        padding: EdgeInsets.only(bottom: 15.h),
                        child: const TrainLessonsItem(),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
