import 'package:fit_track_app/core/di/service_locator.dart';
import 'package:fit_track_app/core/extensions/padding_extension.dart';
import 'package:fit_track_app/features/progress/presentation/cubits/progress_cubit/progress_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/progress_photo_view_body.dart';

class ProgressPhotoView extends StatelessWidget {
  const ProgressPhotoView({super.key});

  static const String routeName = 'progress_photo_view';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => injector<ProgressCubit>()..getProgress(),
        child: SafeArea(
          child: const ProgressPhotoViewBody().withHorizontalPadding(30),
        ),
      ),
    );
  }
}
