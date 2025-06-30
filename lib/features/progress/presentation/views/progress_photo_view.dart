import '../../../../core/di/service_locator.dart';
import '../../../../core/extensions/padding_extension.dart';
import '../cubits/progress_cubit/progress_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

import '../widgets/progress_photo_view_body.dart';

class ProgressPhotoView extends StatelessWidget {
  const ProgressPhotoView({super.key, required this.controller});
  final PersistentTabController controller;
  static const String routeName = 'progress_photo_view';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => injector<ProgressCubit>()..getProgress(),
        child: SafeArea(
          child: ProgressPhotoViewBody(
            controller: controller,
          ).withHorizontalPadding(30),
        ),
      ),
    );
  }
}
