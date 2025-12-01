import 'package:auth_module/auth_module.dart';
import 'package:flutter/material.dart';
import 'package:news_module/news_module.dart';
import 'package:weather_module/weather_module.dart';

import '../../widgets/app_shell.dart';

class AppRouter {
  static const String dashboard = '/';
  static const String news = '/news';
  static const String weather = '/weather';
  static const String auth = '/auth';
  static const String articleDetails = '/news/details';

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case dashboard:
        return MaterialPageRoute(builder: (_) => const AppShell());
      case news:
        return MaterialPageRoute(builder: (_) => const NewsPage());
      case weather:
        return MaterialPageRoute(builder: (_) => const WeatherPage());
      case auth:
        return MaterialPageRoute(builder: (_) => const LoginPage());
      case articleDetails:
        final article = settings.arguments as NewsArticle;
        return MaterialPageRoute(
          builder: (_) => ArticleDetailsPage(article: article),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const AppShell(),
          settings: const RouteSettings(name: dashboard),
        );
    }
  }
}
