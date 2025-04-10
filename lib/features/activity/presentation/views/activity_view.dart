import 'package:fit_track_app/core/extensions/padding_extension.dart';
import 'package:fit_track_app/core/helpers/app_spacer.dart';
import 'package:fit_track_app/core/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/app_styles.dart';
import '../widgets/bar_progress_chart.dart';
import '../widgets/custom_drop_down_menu.dart';
import '../widgets/latest_activity_head_title.dart';
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
          SliverToBoxAdapter(
            child: Column(
              children: [
                CustomAppBar(title: 'Activity Tracker'),
                VerticalSpace(30),
                TodayTargetSection(),
                VerticalSpace(30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Activity Progress',
                      style: AppStyles.semiBold16,
                    ),
                    SizedBox(
                      height: 30.h,
                      child: CustomDropdownButton(),
                    ),
                  ],
                ),
                VerticalSpace(15),
                BarProgressChart(),
                VerticalSpace(30),
                LatestActivitySectionHeadTitle(),
                VerticalSpace(18),
              ],
            ),
          ),
          SliverList.separated(
            itemBuilder: (_, index) {
              return LatestActivityItem();
            },
            separatorBuilder: (_, index) {
              return VerticalSpace(15);
            },
            itemCount: 4,
          ),
          SliverToBoxAdapter(
            child: VerticalSpace(30),
          ),
        ],
      ).withHorizontalPadding(30),
    );
  }
}
