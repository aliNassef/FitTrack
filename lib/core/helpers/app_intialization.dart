import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../cache/cache_helper.dart';
import '../di/service_locator.dart';
import 'custom_bloc_observer.dart';

class AppIntialization {
  AppIntialization._();
  static Future<void> initializer() async {
    WidgetsFlutterBinding.ensureInitialized();
    // await EasyLocalization.ensureInitialized();
    await setupServiceLocator();
    await CacheHelper.init();
    await ScreenUtil.ensureScreenSize();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    Bloc.observer = CustomBlocObserver();
  }
}
