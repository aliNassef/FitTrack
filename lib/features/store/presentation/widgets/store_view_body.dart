import '../../../../core/helpers/app_spacer.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/widgets/custom_icon_button.dart';
import '../../../meal_planner/presentation/widgets/custom_search_bar.dart';
import 'category_card_item.dart';
import 'product_card_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_styles.dart';

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
              SizedBox(
                height: 180.h,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: 4,
                  separatorBuilder: (context, index) => SizedBox(width: 15.w),
                  itemBuilder: (context, index) {
                    return const CategoryCardItem(
                      title: 'Resistance &\nStretching',
                      image: AppImages.meal,
                      backgroundColor: Color(0xFFF6E6FA),
                    );
                  },
                ),
              ),
              const VerticalSpace(16),
              Text(
                'Strength Training & Weightlifting',
                style: AppStyles.semiBold16,
              ),
              const VerticalSpace(24),
            ],
          ),
        ),
        SliverGrid.builder(
          itemCount: 10,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 6.w,
            mainAxisSpacing: 12.h,
            childAspectRatio: 0.7,
          ),
          itemBuilder: (_, index) {
            return const ProductCard(
              name: 'Dumbbells',
              price: '200\$',
              image: AppImages.meal, // Replace with actual dumbbell image
              backgroundColor: Color(0xFFCCF7F2),
            );
          },
        ),
      ],
    );
  }
}
