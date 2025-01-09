part of '../main.dart';

final injector = GetIt.instance;

Future<void> init() async {

  // Инициализация SharedPreferencesManager
  final sharedPreferencesManager = SharedPreferencesManager();
  await sharedPreferencesManager.init();

  injector
    //* Network
    ..registerLazySingleton<DioClient>(DioClient.new)

    //* Database

    //* Data Sources
    ..registerLazySingleton<NewsRemoteDataSource>(() => NewsRemoteDataSourceImpl(injector()))
    ..registerLazySingleton<AuthRemoteDataSource>(() => AuthRemoteDataSourceImpl(injector()))

    //* Repositories
    ..registerLazySingleton<NewsRepository>(() => NewsRepositoryImpl(injector()))
    ..registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(injector()))

    //* Usecases
    ..registerLazySingleton<NewsUsecases>(() => NewsUsecases(injector()))
    ..registerLazySingleton<AuthUsecases>(() => AuthUsecases(injector()))

    //* Cubits
    ..registerFactory<GetNewsCubit>(() => GetNewsCubit(injector()))
    ..registerFactory<GetNewsDetailCubit>(() => GetNewsDetailCubit(injector()))
    ..registerFactory<VerifyCubit>(() => VerifyCubit(injector()))
    ..registerFactory<AuthCubit>(() => AuthCubit(injector()))

  //* SharedPreferencesManager
  ..registerSingleton<SharedPreferencesManager>(sharedPreferencesManager);

}
