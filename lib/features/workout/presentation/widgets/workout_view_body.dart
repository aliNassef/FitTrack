import 'package:fit_track_app/core/extensions/mediaquery_size.dart';
import 'package:fit_track_app/core/extensions/padding_extension.dart';
import 'package:fit_track_app/core/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/helpers/app_spacer.dart';
import '../../../../core/widgets/curve_chart.dart';
import '../../../../core/widgets/title_and_seemore.dart';
import 'swap_scroll_dvider.dart';
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
          colors: [
            Color(0xffEEA4CE),
            Color(0xffC150F6),
          ],
        ),
      ),
      child: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            sliver: SliverAppBar(
              backgroundColor: Colors.transparent,
              title: CustomAppBar(
                title: 'Workout Tracker',
                titleColor: Colors.white,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                VerticalSpace(34),
                CurveChart(),
                VerticalSpace(15),
              ],
            ).withHorizontalPadding(30),
          ),
          SliverFillRemaining(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
              ),
              child: Column(
                children: [
                  VerticalSpace(10),
                  SwapScrollDvider(),
                  VerticalSpace(60),
                  TitleAndSeeMore(
                    title: 'Upcoming Workout',
                  ),
                  VerticalSpace(15),
                  UpComingWorkoutListTile(),
                  VerticalSpace(15),
                  UpComingWorkoutListTile(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
