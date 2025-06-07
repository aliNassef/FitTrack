import '../../../../core/di/service_locator.dart';
import '../../../../core/extensions/padding_extension.dart';
import '../cubit/get_profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

import '../widgets/profile_view_body.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key, required this.controller});
  final PersistentTabController controller;
  static const routeName = 'profile';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => injector<GetProfileCubit>()..getProfile(),
        child: SafeArea(
          bottom: false,
          child: SingleChildScrollView(
            child: ProfileViewBody(controller: controller)
                .withHorizontalPadding(30),
          ),
        ),
      ),
    );
  }
}
