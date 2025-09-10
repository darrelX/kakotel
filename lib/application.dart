import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:kakotel_test/core/connectivity/bloc/network_cubit.dart';

import 'service_locator.dart';
// import 'core/routing/app_router.dart';
import 'core/theme/light_theme.dart';

class Application extends StatefulWidget {
  const Application({super.key});

  @override
  State<Application> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  // final _appRouter = getIt.get<AppRouter>();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [

      ],
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        child: MaterialApp.router(
          title: 'kakotel_test',
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          // supportedLocales: L10n.all,
          debugShowCheckedModeBanner: false,
          theme: buildLightTheme(),
          locale: const Locale('en'),
          darkTheme: buildLightTheme(),
          themeMode: ThemeMode.dark,
          builder: (context, child) {
            final mediaQueryData = MediaQuery.of(context);
            return MediaQuery(
              data: mediaQueryData.copyWith(
                textScaler: const TextScaler.linear(1.0),
              ),
              child: _UnFocusWrapper(child: child),
            );
          },
        ),
      ),
    );
  }
}

class _UnFocusWrapper extends StatelessWidget {
  const _UnFocusWrapper({required this.child});
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: child,
    );
  }
}
