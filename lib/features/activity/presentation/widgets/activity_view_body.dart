
import 'package:fit_track_app/core/widgets/title_and_seemore.dart';
import 'package:fit_track_app/features/activity/presentation/widgets/bar_progress_chart.dart';
import 'package:fit_track_app/features/activity/presentation/widgets/latest_activity_item.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

import '../../../../core/helpers/app_spacer.dart';
import '../../../../core/utils/app_gradients.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../core/widgets/title_with_customdropdown.dart';
import 'today_target_section.dart';

class ActivityViewBody extends StatelessWidget {
  const ActivityViewBody({
    super.key,
    required this.controller,
  });

  final PersistentTabController controller;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              CustomAppBar(
                title: 'Activity Tracker',
                onBackButtonPressed: () {
                  controller.jumpToTab(0);
                },
              ),
              const VerticalSpace(30),
              const TodayTargetSection(),
              const VerticalSpace(30),
              const TitleWithCustomDropDown(
                title: 'Activity Progress',
                gradientColor: AppGradients.greenGradient,
              ),
              const VerticalSpace(15),
              const BarProgressChart(),
              const VerticalSpace(30),
              const TitleAndSeeMore(
                title: 'Latest Activity',
              ),
              const VerticalSpace(18),
            ],
          ),
        ),
        SliverList.separated(
          itemBuilder: (_, index) {
            return const LatestActivityItem();
          },
          separatorBuilder: (_, index) {
            return const VerticalSpace(15);
          },
          itemCount: 4,
        ),
        const SliverToBoxAdapter(
          child: VerticalSpace(30),
        ),
      ],
    );
  }
}
