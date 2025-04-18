import 'package:flutter/material.dart';
import '../../../../core/helpers/app_spacer.dart';
import '../../../../core/utils/app_styles.dart';
import 'home_banner.dart';
import 'home_chart.dart';
import 'home_grid_item.dart';
import 'home_top_bar.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HomeTopBar(),
              const VerticalSpace(8),
              const HomeBanner(),
              const VerticalSpace(30),
              Text(
                'Activity Status',
                style: AppStyles.semiBold16,
              ),
              const VerticalSpace(15),
              const HomeChart(),
              const VerticalSpace(16),
            ],
          ),
        ),
        SliverGrid.builder(
          itemCount: 6,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1,
            mainAxisSpacing: 8,
          ),
          itemBuilder: (_, index) {
            return const HomeGridItem();
          },
        ),
        const SliverToBoxAdapter(
          child: VerticalSpace(30),
        ),
      ],
    );
  }
}
