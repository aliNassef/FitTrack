import 'package:device_preview_plus/device_preview_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'core/helpers/app_intialization.dart';
import 'fit_track_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppIntialization.initializer();
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => const FitTrackApp(),
    ),
  );
}
