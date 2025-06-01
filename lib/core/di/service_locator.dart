import 'package:dio/dio.dart';
import 'package:fit_track_app/features/home/data/repo/home_repo.dart';
import 'package:get_it/get_it.dart';

import '../../features/auth/data/datasource/auth_local_datasource.dart';
import '../../features/auth/data/datasource/auth_remote_datasource.dart';
import '../../features/auth/data/repo/auth_repo.dart';
import '../../features/auth/data/repo/auth_repo_impl.dart';
import '../../features/auth/presentation/auth_cubit/auth_cubit.dart';
import '../../features/home/data/repo/home_repo_impl.dart';
import '../../features/home/data/source/home_remote_datasource.dart';
import '../../features/home/presentation/cubit/get_all_notification_cubit/get_all_notifications_cubit.dart';
import '../api/api_consumer.dart';
import '../api/dio_consumer.dart';
import 'package:shared_preferences/shared_preferences.dart';

final injector = GetIt.instance;

// features -> cubit -- repo -- data
// core
// external
Future<void> setupServiceLocator() async {
  await _setupExternalFeature();
  _setupAuthFeature();
  _setupHomeFeature();
}

void _setupHomeFeature() {
  injector.registerFactory(
    () => GetAllNotificationsCubit(
      injector<HomeRepo>(),
    ),
  );
  injector.registerLazySingleton<HomeRepo>(
    () => HomeRepoImpl(
      homeRemoteDatasource: injector<HomeRemoteDatasource>(),
    ),
  );
  injector.registerLazySingleton<HomeRemoteDatasource>(
    () => HomeRemoteDatasourceImpl(
      apiConsumer: injector<ApiConsumer>(),
    ),
  );
}

void _setupAuthFeature() {
  injector.registerFactory(
    () => AuthCubit(
      injector<AuthRepo>(),
    ),
  );
  injector.registerLazySingleton<AuthRepo>(
    () => AuthRepoImpl(
      authRemoteDatasource: injector<AuthRemoteDatasource>(),
      authLocalDatasource: injector<AuthLocalDatasource>(),
    ),
  );
  injector.registerLazySingleton<AuthRemoteDatasource>(
    () => AuthRemoteDatasourceImpl(
      apiConsumer: injector<ApiConsumer>(),
    ),
  );
  injector.registerLazySingleton<AuthLocalDatasource>(
    () => AuthLocalDatasourceImpl(
      sharedPreferences: injector<SharedPreferences>(),
    ),
  );
}

Future<void> _setupExternalFeature() async {
  injector.registerLazySingleton<Dio>(() => Dio());
  injector.registerLazySingleton<ApiConsumer>(
    () => DioConsumer(
      dio: injector<Dio>(),
    ),
  );
  final sharedPrefrence = await SharedPreferences.getInstance();
  injector.registerLazySingleton<SharedPreferences>(
    () => sharedPrefrence,
  );
}
