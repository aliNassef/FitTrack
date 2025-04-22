import 'package:fit_track_app/core/extensions/padding_extension.dart';
import 'package:fit_track_app/core/helpers/app_spacer.dart';
import 'package:fit_track_app/core/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import '../../../../core/utils/app_gradients.dart';
import '../../../../core/widgets/title_and_seemore.dart';
import '../../../../core/widgets/title_with_customdropdown.dart';
import '../widgets/bar_progress_chart.dart';
import '../widgets/latest_activity_item.dart';
import '../widgets/today_target_section.dart';

class ActivityView extends StatelessWidget {
  const ActivityView({super.key});
  static const String routeName = 'activity';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(
            child: Column(
              children: [
                CustomAppBar(title: 'Activity Tracker'),
                VerticalSpace(30),
                TodayTargetSection(),
                VerticalSpace(30),
                TitleWithCustomDropDown(
                  title: 'Activity Progress',
                  gradientColor: AppGradients.greenGradient,
                ),
                VerticalSpace(15),
                BarProgressChart(),
                VerticalSpace(30),
                TitleAndSeeMore(
                  title: 'Latest Activity',
                ),
                VerticalSpace(18),
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
      ).withHorizontalPadding(30),
    );
  }
}
