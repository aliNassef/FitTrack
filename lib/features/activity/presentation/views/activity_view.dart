import '../../../../core/di/service_locator.dart';
import '../cubits/cubit/activity_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/extensions/padding_extension.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import '../cubits/get_activity_cubit/get_activity_cubit.dart';
import '../widgets/activity_view_body.dart';

class ActivityView extends StatelessWidget {
  const ActivityView({super.key, required this.controller});
  final PersistentTabController controller;
  static const String routeName = 'activity';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => injector<GetActivityCubit>()..getTrackerData(),
          ),
          BlocProvider(
            create: (context) => injector<ActivityCubit>(),
          ),
        ],
        child: ActivityViewBody(controller: controller),
      ).withHorizontalPadding(30),
    );
  }
}
