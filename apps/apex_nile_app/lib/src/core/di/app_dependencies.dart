import 'package:auth_module/auth_module.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:news_module/news_module.dart';
import 'package:sqflite/sqflite.dart';
import 'package:weather_module/weather_module.dart';

import '../services/connectivity_service.dart';
import '../services/database_service.dart';

class AppDependencies {
  AppDependencies._({
    required this.database,
    required this.databaseService,
    required this.authRepository,
    required this.newsRepository,
    required this.weatherRepository,
    required this.connectivityService,
    required this.httpClient,
    required this.authFactory,
    required this.newsFactory,
    required this.weatherFactory,
  });

  final Database database;
  final AppDatabase databaseService;
  final AuthRepository authRepository;
  final NewsRepository newsRepository;
  final WeatherRepository weatherRepository;
  final ConnectivityService connectivityService;
  final http.Client httpClient;
  final AuthModuleFactory authFactory;
  final NewsModuleFactory newsFactory;
  final WeatherModuleFactory weatherFactory;

  static Future<AppDependencies> create() async {
    final databaseService = AppDatabase.instance;
    final database = await databaseService.ensureOpen();
    final httpClient = http.Client();

    const newsApiKey =
        String.fromEnvironment('NEWS_API_KEY', defaultValue: '98c54a6d56b2483aa79f723fcd1b8100');
    const weatherApiKey = String.fromEnvironment('OPENWEATHER_API_KEY',
        defaultValue: '0978f98de446c60ab6a55db33f75668d');

    const authFactory = AuthModuleFactory();
    final authRepository = await authFactory.createRepository(database);

    final newsFactory = NewsModuleFactory(
      apiKey: newsApiKey,
      country: 'us',
      language: 'en',
    );
    final newsRepository =
        await newsFactory.createRepository(database, httpClient);

    final weatherFactory = WeatherModuleFactory(apiKey: weatherApiKey);
    final weatherRepository =
        await weatherFactory.createRepository(database, httpClient);

    final connectivityService = ConnectivityService();

    return AppDependencies._(
      database: database,
      databaseService: databaseService,
      authRepository: authRepository,
      newsRepository: newsRepository,
      weatherRepository: weatherRepository,
      connectivityService: connectivityService,
      httpClient: httpClient,
      authFactory: authFactory,
      newsFactory: newsFactory,
      weatherFactory: weatherFactory,
    );
  }

  AuthCubit createAuthCubit() {
    return authFactory.createCubit(authRepository);
  }

  NewsCubit createNewsCubit() {
    return newsFactory.createCubit(newsRepository);
  }

  WeatherCubit createWeatherCubit() {
    return weatherFactory.createCubit(weatherRepository);
  }

  Future<void> dispose() async {
    connectivityService.dispose();
    httpClient.close();
    await databaseService.close();
  }
}

class AppScope extends StatefulWidget {
  const AppScope({super.key, required this.dependencies, required this.child});

  final AppDependencies dependencies;
  final Widget child;

  static AppDependencies of(BuildContext context) {
    final scope =
        context.dependOnInheritedWidgetOfExactType<_AppDependenciesInherited>();
    assert(scope != null, 'AppScope not found in widget tree');
    return scope!.dependencies;
  }

  @override
  State<AppScope> createState() => _AppScopeState();
}

class _AppScopeState extends State<AppScope> {
  @override
  void dispose() {
    widget.dependencies.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _AppDependenciesInherited(
      dependencies: widget.dependencies,
      child: widget.child,
    );
  }
}

class _AppDependenciesInherited extends InheritedWidget {
  const _AppDependenciesInherited({
    required super.child,
    required this.dependencies,
  });

  final AppDependencies dependencies;

  @override
  bool updateShouldNotify(covariant _AppDependenciesInherited oldWidget) =>
      false;
}
