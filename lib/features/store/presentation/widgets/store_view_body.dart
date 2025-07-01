import 'package:fit_track_app/features/store/presentation/widgets/category_section.dart';

import 'product_card_item.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/helpers/app_spacer.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/widgets/custom_failure_widget.dart';
import '../../../../core/widgets/custom_icon_button.dart';
import '../../../meal_planner/presentation/widgets/custom_search_bar.dart';
import '../manger/search_bloc/search_store_bloc.dart';
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
              CustomSearchBar(
                onChanged: (value) {
                  context.read<SearchStoreBloc>().add(
                        OnSearchStoreEvent(searchQuery: value),
                      );
                },
                hintText: 'Search equipment',
              ),
              const VerticalSpace(30),
              BlocBuilder<SearchStoreBloc, SearchStoreState>(
                builder: (context, state) {
                  if (state is SearchStoreLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (state is SearchStoreLoaded) {
                    if (state.products.isEmpty) {
                      return const Center(
                        child: Text('No products found'),
                      );
                    }
                    return GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 6.w,
                        mainAxisSpacing: 12.h,
                        childAspectRatio: 0.7,
                      ),
                      itemCount: state.products.length,
                      itemBuilder: (context, index) {
                        return ProductCard(
                          name: state.products[index].name,
                          price: '${state.products[index].price.toString()}\$',
                          image: state.products[index].image,
                          backgroundColor: const Color(0xFFCCF7F2),
                        );
                      },
                    );
                  }
                  if (state is SearchStoreError) {
                    return CustomFailureWidget(errMessage: state.errMessage);
                  }
                  return const CategorySection();
                },
              ),
            ],
          ),
        ),
        BlocBuilder<SearchStoreBloc, SearchStoreState>(
          builder: (context, state) {
            if (state is SearchStoreInitial) {
              return const ProductItemsBlocBuilder();
            }
            return const SliverToBoxAdapter(child: SizedBox.shrink());
          },
        ),
        const SliverToBoxAdapter(
          child: VerticalSpace(100),
        )
      ],
    );
  }
}
