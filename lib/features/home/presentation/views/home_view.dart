import 'package:fit_track_app/core/di/service_locator.dart';
import 'package:fit_track_app/core/extensions/padding_extension.dart';
import 'package:fit_track_app/features/home/presentation/cubit/home_cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({
    super.key,
  });

  static const String routeName = 'home_view';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => injector<HomeCubit>(),
        child: SafeArea(
          bottom: false,
          child: const HomeViewBody().withHorizontalPadding(30),
        ),
      ),
    );
  }
}
