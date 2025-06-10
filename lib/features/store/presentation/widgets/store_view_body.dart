import '../../../../core/helpers/app_spacer.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/widgets/custom_icon_button.dart';
import '../../../meal_planner/presentation/widgets/custom_search_bar.dart';
import 'category_items_bloc_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_styles.dart';
import 'product_items_bloc_builder.dart';

class StoreViewBody extends StatelessWidget {
  const StoreViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                spacing: 100.w,
                children: [
                  CustomIconButton(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    image: AppIcons.backArrowIcon,
                  ),
                  Text(
                    'Store',
                    style: AppStyles.bold16.copyWith(
                      color: AppColors.blackColor,
                    ),
                  ),
                ],
              ),
              const VerticalSpace(30),
              Text(
                'Find\nall the fitness equipment\nyou need!',
                style: AppStyles.bold32.copyWith(
                  color: const Color(0xFF3A1F5D),
                ),
              ),
              const VerticalSpace(24),
              const CustomSearchBar(),
              const VerticalSpace(30),
              Text(
                'Category',
                style: AppStyles.semiBold16,
              ),
              const VerticalSpace(16),
              const CategoryItemsBlocBuilder(),
              const VerticalSpace(16),
              Text(
                'Strength Training & Weightlifting',
                style: AppStyles.semiBold16,
              ),
              const VerticalSpace(24),
            ],
          ),
        ),
        const ProductItemsBlocBuilder(),
      ],
    );
  }
}
