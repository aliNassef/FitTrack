import 'package:fit_track_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

import '../../../core/utils/app_images.dart';
import '../../../core/utils/app_shadows.dart';
import '../../activity/presentation/views/activity_view.dart';
import '../../home/presentation/views/home_view.dart';
import '../../profile/presentation/views/profile_view.dart';

class LayoutView extends StatefulWidget {
  const LayoutView({super.key});
  static const String routeName = 'layout_view';

  @override
  State<LayoutView> createState() => _LayoutViewState();
}

class _LayoutViewState extends State<LayoutView> {
  late PersistentTabController _controller;
  @override
  initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      decoration: NavBarDecoration(
        colorBehindNavBar: Colors.white,
        boxShadow: AppShadows.shadow1,
      ),
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      hideNavigationBarWhenKeyboardAppears: true,
      popBehaviorOnSelectedNavBarItemPress: PopBehavior.all,
      padding: EdgeInsets.only(top: 16.h),
      backgroundColor: Colors.white,
      isVisible: true,
      animationSettings: const NavBarAnimationSettings(
        navBarItemAnimation: ItemAnimationSettings(
          duration: Duration(milliseconds: 300),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: ScreenTransitionAnimationSettings(
          animateTabTransition: true,
          duration: Duration(milliseconds: 300),
          screenTransitionAnimationType: ScreenTransitionAnimationType.fadeIn,
        ),
      ),
      confineToSafeArea: true,
      navBarHeight: kBottomNavigationBarHeight,
      navBarStyle: NavBarStyle.style12,
    );
  }

  _buildScreens() {
    return [
      HomeView(),
      ActivityView(),
      ProfileView(),
    ];
  }

  _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        inactiveIcon: SvgPicture.asset(AppIcons.homeIcon),
        icon: SvgPicture.asset(AppIcons.activeHomeIcon),
        title: '.',
        activeColorPrimary: AppColors.primaryColor,
        inactiveColorPrimary: AppColors.primaryColor,
      ),
      PersistentBottomNavBarItem(
        inactiveIcon: SvgPicture.asset(AppIcons.activityIcon),
        icon: SvgPicture.asset(AppIcons.activeActivityIcon),
        title: '.',
        activeColorPrimary: AppColors.primaryColor,
        inactiveColorPrimary: AppColors.primaryColor,
      ),
      PersistentBottomNavBarItem(
        inactiveIcon: SvgPicture.asset(AppIcons.profileNavIcon),
        icon: SvgPicture.asset(AppIcons.activeProfileIcon),
        activeColorPrimary: AppColors.primaryColor,
        inactiveColorPrimary: AppColors.primaryColor,
        title: '.',
      ),
    ];
  }
}
