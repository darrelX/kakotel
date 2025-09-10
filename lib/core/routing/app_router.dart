import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:kakotel_test/presentation/views/task/task_screen.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: TaskRoute.page, initial: true),
  ];
}
