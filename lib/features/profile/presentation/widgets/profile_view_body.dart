import '../../../../core/widgets/custom_failure_widget.dart';
import '../../data/model/profile_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/helpers/app_spacer.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../cubit/get_profile_cubit.dart';
import 'account_section.dart';
import 'others_section.dart';
import 'personal_info_list_items.dart';
import 'popup_notification_section.dart';
import 'profile_head_tile.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({
    super.key,
    required this.controller,
  });

  final PersistentTabController controller;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetProfileCubit, GetProfileState>(
      buildWhen: (previous, current) =>
          current is GetProfileLoading ||
          current is GetProfileFailure ||
          current is GetProfileLoaded,
      builder: (context, state) {
        if (state is GetProfileLoaded) {
          return Column(
            children: [
              CustomAppBar(
                title: 'Profile',
                onBackButtonPressed: () {
                  controller.jumpToTab(1);
                },
              ),
              const VerticalSpace(30),
              ProfileHeadTile(
                name: state.user.name,
                email: state.user.email,
              ),
              const VerticalSpace(16),
              PersonalInfoListItems(user: state.user),
              const VerticalSpace(30),
              const AccountSection(),
              const VerticalSpace(15),
              const PopupNotificationSection(),
              const VerticalSpace(15),
              const OtherSection(),
              const VerticalSpace(20),
            ],
          );
        } else if (state is GetProfileFailure) {
          return CustomFailureWidget(errMessage: state.errorMessage);
        } else if (state is GetProfileLoading) {
          return Skeletonizer(
            enabled: true,
            child: Column(
              children: [
                CustomAppBar(
                  title: 'Profile',
                  onBackButtonPressed: () {
                    controller.jumpToTab(1);
                  },
                ),
                const VerticalSpace(30),
                const ProfileHeadTile(
                  name: 'ali nassef',
                  email: 'ali@gmail.com',
                ),
                const VerticalSpace(16),
                const PersonalInfoListItems(
                  user: UserProfile(
                    name: 'ali nassef',
                    email: 'ali@gmail.com',
                    phoneNumber: '123456789',
                    gender: 'male',
                    dataOfbirth: '2000-01-01',
                    weight: 70,
                    height: 180,
                  ),
                ),
                const VerticalSpace(30),
                const AccountSection(),
                const VerticalSpace(15),
                const PopupNotificationSection(),
                const VerticalSpace(15),
                const OtherSection(),
                const VerticalSpace(20),
              ],
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
