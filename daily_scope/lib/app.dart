import 'package:auth_module/auth_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_module/news_module.dart';
import 'package:weather_module/weather_module.dart';

import 'package:common/common.dart';

import 'src/core/di/app_dependencies.dart';
import 'src/core/router/app_router.dart';
import 'src/core/services/connectivity_service.dart';

class DailyScopeApp extends StatelessWidget {
  const DailyScopeApp({super.key});

  @override
  Widget build(BuildContext context) {
    final dependencies = AppScope.of(context);
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<AuthRepository>.value(
            value: dependencies.authRepository),
        RepositoryProvider<NewsRepository>.value(
            value: dependencies.newsRepository),
        RepositoryProvider<WeatherRepository>.value(
            value: dependencies.weatherRepository),
        RepositoryProvider<ConnectivityService>.value(
            value: dependencies.connectivityService),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<AuthCubit>(
              create: (_) => dependencies.createAuthCubit()),
          BlocProvider<NewsCubit>(
              create: (_) => dependencies.createNewsCubit()),
          BlocProvider<WeatherCubit>(
              create: (_) => dependencies.createWeatherCubit()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Daily Scope',
          theme: buildDailyTheme(),
          darkTheme: buildDailyDarkTheme(),
          themeMode: ThemeMode.system,
          onGenerateRoute: AppRouter.onGenerateRoute,
          initialRoute: AppRouter.dashboard,
        ),
      ),
    );
  }
}
