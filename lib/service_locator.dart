import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:kakotel_test/core/database/local_storage.dart';

import 'core/networking/http_logger_interceptor.dart';
import 'core/networking/token_interceptor.dart';
// import 'core/routing/app_router.dart';

final getIt = GetIt.instance;

Future<void> setupLocator() async {
  getIt
    //route
    // ..registerSingleton<AppRouter>(AppRouter())
    ..registerSingleton<Logger>(Logger(printer: PrettyPrinter(colors: true)))
    // SharedPreferences
    ..registerSingleton<LocalStorage>(LocalStorage())
    // Dio
    ..registerLazySingleton<Dio>(
      () => Dio(
        BaseOptions(
          baseUrl: '${dotenv.env['API_ACCOUNT']}',
          connectTimeout: const Duration(seconds: 12),
          receiveTimeout: const Duration(seconds: 12),
          headers: {
            'accept': 'application/json',
            'Content-Type': 'application/json',
          },
        ),
      )..interceptors.addAll([TokenInterceptor(), HttpLoggerInterceptor()]),
      instanceName: 'accountApi',
    )
    ..registerLazySingleton<Dio>(
      () => Dio(
        BaseOptions(
          baseUrl: '${dotenv.env['API_DATA']}',
          connectTimeout: const Duration(seconds: 12),
          receiveTimeout: const Duration(seconds: 12),
          headers: {
            'accept': 'application/json',
            'Content-Type': 'application/json',
          },
        ),
      )..interceptors.addAll([TokenInterceptor(), HttpLoggerInterceptor()]),
      instanceName: 'dataApi',
    );

  // ..registerSingleton<NetworkCubit>(NetworkCubit());
}
