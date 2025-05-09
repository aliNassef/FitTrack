import 'package:fit_track_app/core/utils/app_images.dart';
import 'package:fit_track_app/features/home/data/models/home_model.dart';
import 'package:fit_track_app/features/meal_planner/presentation/view/meal_planner_view.dart';
import 'package:fit_track_app/features/profile/presentation/views/statistics_view.dart';
import 'package:fit_track_app/features/workout/presentation/view/workout_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/helpers/app_spacer.dart';
import '../../../../core/helpers/default_app_button.dart';
import '../../../../core/utils/app_shadows.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../store/presentation/views/store_view.dart';

class HomeGridItem extends StatelessWidget {
  const HomeGridItem({
    super.key,
    required this.instance,
    required this.index,
  });
  final HomeModel instance;
  final int index;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _goToSelectedPage(context);
      },
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xffFFFFFF),
          borderRadius: BorderRadius.circular(20.r),
          boxShadow: AppShadows.shadow1,
        ),
        width: 160.w,
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        child: Stack(
          children: [
            Text(
              instance.title,
              style: AppStyles.medium14.copyWith(
                color: const Color(0xff000000),
              ),
              textAlign: TextAlign.center,
            ),
            const VerticalSpace(7),
            Positioned(
              top: 50.h,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 20.h,
                    width: 50.w,
                    child: DefaultAppButton(
                      text: 'Go To',
                      textStyle: AppStyles.semiBold10.copyWith(
                        color: Colors.white,
                      ),
                      onPressed: () {},
                    ),
                  ),
                  ShaderMask(
                    shaderCallback: (bounds) => const LinearGradient(
                      colors: [
                        Color(0xff263238),
                        Color(0xffC150F6),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ).createShader(
                      Rect.fromLTWH(0, 0, bounds.width, bounds.height),
                    ),
                    child: Text(
                      ' ${instance.subTitle}',
                      style: AppStyles.semiBold10.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 0.h,
              child: Image.asset(
                alignment: Alignment.topCenter,
                AppImages.homeBackgroundItem,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _goToSelectedPage(BuildContext context) {
    switch (index) {
      case 0:
        Navigator.of(context, rootNavigator: true).pushNamed(
          StoreView.routeName,
        );
        break;
      case 1:
        Navigator.of(context, rootNavigator: true).pushNamed(
          MealPlannerView.routeName,
        );
        break;
      case 2:
        Navigator.of(context, rootNavigator: true).pushNamed(
          WorkoutView.routeName,
        );
        break;
      case 3:
        Navigator.of(context, rootNavigator: true).pushNamed(
          StatisticsView.routeName,
        );
        break;
    }
  }
}
