import 'package:dio/dio.dart';
import 'package:fit_track_app/features/activity/data/datasource/activity_remote_datasource.dart';
import 'package:fit_track_app/features/activity/data/repo/activity_repo.dart';
import 'package:fit_track_app/features/activity/data/repo/activity_repo_impl.dart';
import 'package:fit_track_app/features/activity/presentation/cubits/get_activity_cubit/get_activity_cubit.dart';
import 'package:fit_track_app/features/store/data/repo/store_repo.dart';
import 'package:fit_track_app/features/store/presentation/cubits/get_all_product_cubit/get_all_products_cubit_cubit.dart';
import '../../features/activity/presentation/cubits/cubit/activity_cubit.dart';
import '../../features/home/data/repo/home_repo.dart';
import '../../features/profile/data/datasource/profile_remote_datasource.dart';
import '../../features/profile/data/repo/profile_repo.dart';
import '../../features/profile/presentation/cubit/get_profile_cubit.dart';
import 'package:get_it/get_it.dart';

import '../../features/auth/data/datasource/auth_local_datasource.dart';
import '../../features/auth/data/datasource/auth_remote_datasource.dart';
import '../../features/auth/data/repo/auth_repo.dart';
import '../../features/auth/data/repo/auth_repo_impl.dart';
import '../../features/auth/presentation/auth_cubit/auth_cubit.dart';
import '../../features/home/data/repo/home_repo_impl.dart';
import '../../features/home/data/source/home_remote_datasource.dart';
import '../../features/home/presentation/cubit/get_all_notification_cubit/get_all_notifications_cubit.dart';
import '../../features/home/presentation/cubit/home_cubit/home_cubit.dart';
import '../../features/profile/data/repo/profile_repo_impl.dart';
import '../../features/store/data/datasource/store_remote_datasource.dart';
import '../../features/store/data/repo/store_repo_impl.dart';
import '../../features/store/presentation/cubits/get_all_categories_cubit/cubit/get_all_categories_cubit.dart';
import '../../features/workout/data/datasource/workout_remote_datasource.dart';
import '../../features/workout/data/repo/workout_repo.dart';
import '../../features/workout/data/repo/workout_repo_impl.dart';
import '../../features/workout/presentation/cubits/get_all_workout_cubit/get_all_workouts_cubit.dart';
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
  _setupProfileFeature();
  _setupStoreFeature();
  _setupActivityFeature();
  _setupWorkoutFeature();
}

void _setupWorkoutFeature() {
  injector.registerFactory(
    () => GetAllWorkoutsCubit(
      workoutRepo: injector<WorkoutRepo>(),
    ),
  );
  injector.registerLazySingleton<WorkoutRepo>(
    () => WorkoutRepoImpl(
      remoteDatasource: injector<WorkoutRemoteDatasource>(),
    ),
  );
  injector.registerLazySingleton<WorkoutRemoteDatasource>(
    () => WorkoutRemoteDatasourceImpl(
      apiConsumer: injector<ApiConsumer>(),
    ),
  );
}

void _setupActivityFeature() {
  injector.registerFactory(
    () => GetActivityCubit(
      activityRepo: injector<ActivityRepo>(),
    ),
  );
  injector.registerFactory(
    () => ActivityCubit(
      activityRepo: injector<ActivityRepo>(),
    ),
  );
  injector.registerLazySingleton<ActivityRepo>(
    () => ActivityRepoImpl(
      remoteDatasource: injector<ActivityRemoteDatasource>(),
    ),
  );
  injector.registerLazySingleton<ActivityRemoteDatasource>(
    () => ActivityRemoteDatasourceImpl(
      apiConsumer: injector<ApiConsumer>(),
    ),
  );
}

void _setupStoreFeature() {
  injector.registerFactory(
    () => GetAllCategoriesCubit(
      injector<StoreRepo>(),
    ),
  );
  injector.registerFactory(
    () => GetAllProductsCubitCubit(
      injector<StoreRepo>(),
    ),
  );
  injector.registerLazySingleton<StoreRepo>(
    () => StoreRepoImpl(
      remoteDataSource: injector<StoreRemoteDataSource>(),
    ),
  );
  injector.registerLazySingleton<StoreRemoteDataSource>(
    () => StoreRemoteDataSourceImpl(
      apiConsumer: injector<ApiConsumer>(),
    ),
  );
}

void _setupProfileFeature() {
  injector.registerFactory(
    () => GetProfileCubit(
      injector<ProfileRepo>(),
    ),
  );
  injector.registerLazySingleton<ProfileRepo>(
    () => ProfileRepoImpl(
      profileRemoteDatasource: injector<ProfileRemoteDatasource>(),
    ),
  );
  injector.registerLazySingleton<ProfileRemoteDatasource>(
    () => ProfileRemoteDatasourceImpl(
      api: injector<ApiConsumer>(),
    ),
  );
}

void _setupHomeFeature() {
  injector.registerFactory(
    () => GetAllNotificationsCubit(
      injector<HomeRepo>(),
    ),
  );
  injector.registerFactory(
    () => HomeCubit(
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
