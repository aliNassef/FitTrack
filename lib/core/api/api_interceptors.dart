import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../di/service_locator.dart';

class ApiInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['Accept-Language'] = 'ar';
    options.headers['Authorization'] =
        'Bearer ${injector<SharedPreferences>().getString('token') ?? ''}';
    super.onRequest(options, handler);
  }
}
