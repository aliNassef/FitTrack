import 'package:fit_track_app/core/extensions/padding_extension.dart';
import 'package:fit_track_app/core/helpers/app_spacer.dart';
import 'package:fit_track_app/core/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

import '../widgets/account_section.dart';
import '../widgets/others_section.dart';
import '../widgets/personal_info_list_items.dart';
import '../widgets/popup_notification_section.dart';
import '../widgets/profile_head_tile.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});
  static const routeName = 'profile';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomAppBar(title: 'Profile'),
              VerticalSpace(30),
              ProfileHeadTile(),
              VerticalSpace(16),
              PersonalInfoListItems(),
              VerticalSpace(30),
              AccountSection(),
              VerticalSpace(15),
              PopupNotificationSection(),
              VerticalSpace(15),
              OtherSection(),
              VerticalSpace(20),
            ],
          ).withHorizontalPadding(30),
        ),
      ),
    );
  }
}
