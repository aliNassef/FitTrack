import '../../../../core/extensions/mediaquery_size.dart';
import '../../../../core/extensions/padding_extension.dart';
import '../../../../core/widgets/read_more_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/helpers/app_spacer.dart';
import '../../../../core/helpers/default_app_button.dart';
import '../../../../core/model/step_model.dart';
import '../../../../core/utils/app_gradients.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../core/widgets/custom_head_title_and_subtitle_button.dart';
import '../../../workout/presentation/widgets/step_item.dart';
import '../../../workout/presentation/widgets/swap_scroll_dvider.dart';
import '../widgets/ingredients_list_items.dart';
import '../widgets/meal_list_tile_details_title_with_favorite.dart';
import '../widgets/nurition_list_items.dart';

class MealDetailsViewBody extends StatelessWidget {
  const MealDetailsViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: context.height,
          width: context.width,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: AppGradients.pinkGradient,
            ),
          ),
          child: CustomScrollView(
            slivers: [
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                sliver: SliverAppBar(
                  automaticallyImplyLeading: false,
                  backgroundColor: Colors.transparent,
                  title: CustomAppBar(
                    onBackButtonPressed: () {
                      Navigator.of(context).pop();
                    },
                    title: '',
                    titleColor: Colors.white,
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    const VerticalSpace(10),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(
                          alpha: 0.3,
                        ),
                        image: const DecorationImage(
                          image: AssetImage(AppImages.workoutBackground),
                          fit: BoxFit.cover,
                        ),
                        shape: BoxShape.circle,
                      ),
                      child: Image.asset(
                        AppImages.character,
                        fit: BoxFit.fill,
                        height: context.height * 0.3,
                      ),
                    ),
                    const VerticalSpace(15),
                  ],
                ).withHorizontalPadding(30),
              ),
              SliverToBoxAdapter(
                child: _buildMealDetailsContent(),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 40.h,
          left: 0,
          right: 0,
          child: DefaultAppButton(
            text: 'Add to Breakfast Meal',
            onPressed: () {},
          ).withHorizontalPadding(30),
        ),
      ],
    );
  }

  Container _buildMealDetailsContent() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30.w),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(40),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const VerticalSpace(10),
          const Align(
            alignment: Alignment.center,
            child: SwapScrollDvider(),
          ),
          const VerticalSpace(30),
          const MealListTileDetailsTitleWithFavorite(),
          const VerticalSpace(30),
          Text(
            'Nutrition',
            style: AppStyles.semiBold16,
          ),
          const VerticalSpace(15),
          SizedBox(
            height: 45.h,
            child: const NutritionListItems(),
          ),
          const VerticalSpace(30),
          Text(
            'Descriptions',
            style: AppStyles.semiBold16,
          ),
          const VerticalSpace(30),
          const ReadMoreText(
            text:
                'Pancakes are some people\'s favorite breakfast, who doesn\'t like pancakes? Especially with the real honey splash on top of the pancakes, of course everyone loves that! besides being ',
          ),
          const VerticalSpace(30),
          const CustomHeadTittleAndSubTitleButton(
            title: 'Ingredients That You Will Need',
            subtitle: '6 items',
          ),
          const VerticalSpace(15),
          SizedBox(
            height: 140.h,
            child: const IngredientsListItems(),
          ),
          const VerticalSpace(30),
          const CustomHeadTittleAndSubTitleButton(
            title: 'Step by Step',
            subtitle: '8 Steps',
          ),
          const VerticalSpace(15),
          ...List.generate(
            4,
            (index) => StepItem(
              isLast: index == 3,
              stepModel: StepModel(
                stepNumber: index + 1,
                title: 'Step ${index + 1}',
                description:
                    'To make the gestures feel more relaxed, stretch your arms as you start this movement. No bending of hands.',
                isActive: false,
              ),
            ),
          ),
          const VerticalSpace(100),
        ],
      ),
    );
  }
}
