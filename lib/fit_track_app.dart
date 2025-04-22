import 'package:device_preview_plus/device_preview_plus.dart';
import 'package:fit_track_app/features/workout/presentation/view/workout_excersises_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/utils/app_router.dart';
import 'core/utils/app_themes.dart';

class FitTrackApp extends StatelessWidget {
  const FitTrackApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          locale: DevicePreview.locale(context),
          builder: DevicePreview.appBuilder,
          title: 'Fit Track',
          debugShowCheckedModeBanner: false,
          theme: getLightTheme(),
          onGenerateRoute: (settings) => onGenerateRoute(settings),
          initialRoute: WorkoutExerciseView.routeName,
        );
      },
    );
  }
}
