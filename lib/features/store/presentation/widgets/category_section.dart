import 'package:fit_track_app/core/helpers/app_spacer.dart';
import 'package:fit_track_app/core/utils/app_styles.dart';
import 'package:fit_track_app/features/store/presentation/widgets/category_items_bloc_builder.dart';
import 'package:flutter/material.dart';

class CategorySection extends StatelessWidget {
  const CategorySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
    );
  }
}
