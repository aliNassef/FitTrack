
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
 import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/utils/app_images.dart';
import '../../../../core/widgets/custom_failure_widget.dart';
import '../cubits/get_all_categories_cubit/cubit/get_all_categories_cubit.dart';
import 'category_card_item.dart';

class CategoryItemsBlocBuilder extends StatelessWidget {
  const CategoryItemsBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAllCategoriesCubit, GetAllCategoriesState>(
      buildWhen: (previous, current) =>
          current is GetAllCategoriesSuccess ||
          current is GetAllCategoriesFailure ||
          current is GetAllCategoriesLoading,
      builder: (context, state) {
        if (state is GetAllCategoriesLoading) {
          return _buildCategoriesLoading();
        }
        if (state is GetAllCategoriesFailure) {
          return CustomFailureWidget(errMessage: state.errMessage);
        }
        if (state is GetAllCategoriesSuccess) {
          return SizedBox(
            height: 180.h,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: state.categories.length,
              separatorBuilder: (context, index) => SizedBox(width: 15.w),
              itemBuilder: (context, index) {
                final category = state.categories[index];
                return CategoryCardItem(
                  title: category.name,
                  image: category.image,
                  backgroundColor: const Color(0xFFF6E6FA),
                );
              },
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }

  Skeletonizer _buildCategoriesLoading() {
    return Skeletonizer(
      enabled: true,
      child: SizedBox(
        height: 180.h,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: 4,
          separatorBuilder: (context, index) => SizedBox(width: 15.w),
          itemBuilder: (context, index) {
            return const CategoryCardItem(
              title: 'Resistance &Stretching',
              image: AppImages.meal,
              backgroundColor: Color(0xFFF6E6FA),
            );
          },
        ),
      ),
    );
  }
}
