import 'package:device_preview_plus/device_preview_plus.dart';
import 'package:fit_track_app/features/onboarding/presentation/views/welcome_view.dart';
import 'package:fit_track_app/features/progress/presentation/views/progress_photo_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/di/service_locator.dart';
import 'core/utils/app_router.dart';
import 'core/utils/app_themes.dart';
import 'features/auth/presentation/auth_cubit/auth_cubit.dart';
import 'features/layout/presentation/layout_view.dart';

class FitTrackApp extends StatelessWidget {
  const FitTrackApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return BlocProvider(
          create: (context) => injector<AuthCubit>()..checkAuthState(),
          child: Builder(
            builder: (context) {
              return BlocBuilder<AuthCubit, AuthState>(
                buildWhen: (previous, current) =>
                    current is Authenticated || current is UnAuthenticated,
                builder: (context, state) {
                  if (state is Authenticated) {
                    return MaterialApp(
                      locale: DevicePreview.locale(context),
                      builder: DevicePreview.appBuilder,
                      title: 'Fit Track',
                      debugShowCheckedModeBanner: false,
                      theme: getLightTheme(),
                      onGenerateRoute: (settings) => onGenerateRoute(settings),
                      initialRoute: ProgressPhotoView.routeName,
                    );
                }
                  return MaterialApp(
                    locale: DevicePreview.locale(context),
                    builder: DevicePreview.appBuilder,
                    title: 'Fit Track',
                    debugShowCheckedModeBanner: false,
                    theme: getLightTheme(),
                    onGenerateRoute: (settings) => onGenerateRoute(settings),
                    initialRoute: WelcomeView.routeName,
                  );
                },
              );
            },
            
          ),
        );
      },
    );
  }
}
