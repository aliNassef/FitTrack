import 'package:fit_track_app/core/extensions/mediaquery_size.dart';
import 'package:fit_track_app/core/extensions/padding_extension.dart';
import 'package:fit_track_app/core/helpers/default_app_button.dart';
import 'package:fit_track_app/core/widgets/custom_head_title_and_subtitle_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/helpers/app_spacer.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import 'equipment_list_items.dart';
import 'fullbody_listtile_with_fav_button.dart';
import 'set_excersises_list_items.dart';
import 'swap_scroll_dvider.dart';
import 'workout_info_display.dart';

class WorkoutDetailsViewBody extends StatelessWidget {
  const WorkoutDetailsViewBody({
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
              colors: [
                Color(0xffEEA4CE),
                Color(0xffC150F6),
              ],
            ),
          ),
          child: CustomScrollView(
            slivers: [
              const SliverPadding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                sliver: SliverAppBar(
                  backgroundColor: Colors.transparent,
                  title: CustomAppBar(
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
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 30.w),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(40),
                    ),
                  ),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      VerticalSpace(10),
                      Align(
                        alignment: Alignment.center,
                        child: SwapScrollDvider(),
                      ),
                      VerticalSpace(30),
                      FullBodyListTileWithFavButton(),
                      WorkoutInfoDisplay(
                        image: AppIcons.schedualeIcon,
                        title: 'Schedule Workout',
                        date: '5/27, 09:00 AM',
                        backgroundColor: Color(0xffccfeeb),
                      ),
                      VerticalSpace(15),
                      WorkoutInfoDisplay(
                        image: AppIcons.difficultyIcon,
                        title: 'Difficulity',
                        date: 'Beginner',
                        backgroundColor: Color(0xfff6e3fa),
                      ),
                      VerticalSpace(30),
                      CustomHeadTittleAndSubTitleButton(
                        title: 'You’ll Need',
                        subtitle: '5 Items',
                      ),
                      VerticalSpace(15),
                      // EquipmentItem(),
                      EquipmentListItems(),
                      VerticalSpace(30),
                      CustomHeadTittleAndSubTitleButton(
                        title: 'Exercises',
                        subtitle: '3 Sets',
                      ),
                      VerticalSpace(15),
                      SetExcersisesListItems(),
                      VerticalSpace(100),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 40.h,
          left: 0,
          right: 0,
          child: DefaultAppButton(
            text: 'Start Workout',
            onPressed: () {},
          ).withHorizontalPadding(30),
        ),
      ],
    );
  }
}
