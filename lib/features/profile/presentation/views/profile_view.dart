import 'package:fit_track_app/core/extensions/padding_extension.dart';
import 'package:fit_track_app/core/helpers/app_spacer.dart';
import 'package:fit_track_app/core/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

import '../widgets/account_section.dart';
import '../widgets/others_section.dart';
import '../widgets/personal_info_list_items.dart';
import '../widgets/popup_notification_section.dart';
import '../widgets/profile_head_tile.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key, required this.controller});
  final PersistentTabController controller;
  static const routeName = 'profile';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomAppBar(
                title: 'Profile',
                onBackButtonPressed: () {
                  controller.jumpToTab(1);
                },
              ),
              const VerticalSpace(30),
              const ProfileHeadTile(),
              const VerticalSpace(16),
              const PersonalInfoListItems(),
              const VerticalSpace(30),
              const AccountSection(),
              const VerticalSpace(15),
              const PopupNotificationSection(),
              const VerticalSpace(15),
              const OtherSection(),
              const VerticalSpace(20),
            ],
          ).withHorizontalPadding(30),
        ),
      ),
    );
  }
}
