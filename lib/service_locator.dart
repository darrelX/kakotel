import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:kakotel_test/domain/repositories/task_repository.dart';
import 'package:kakotel_test/domain/repositories/task_repository_impl.dart';
import 'package:kakotel_test/presentation/blocs/cubit/task_cubit.dart';
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
    ..registerSingleton<TaskRepository>(TaskRepositoryImpl(getIt<LocalStorage>()))
    ..registerFactory<TaskCubit>(() => TaskCubit(getIt<TaskRepository>()));

  // ..registerSingleton<NetworkCubit>(NetworkCubit());
}
