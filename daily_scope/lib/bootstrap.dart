import 'package:flutter/widgets.dart';

import 'src/core/di/app_dependencies.dart';

typedef AppBuilder = Widget Function();

Future<void> bootstrap(AppBuilder builder) async {
  WidgetsFlutterBinding.ensureInitialized();
  final dependencies = await AppDependencies.create();
  runApp(AppScope(
    dependencies: dependencies,
    child: builder(),
  ));
}
