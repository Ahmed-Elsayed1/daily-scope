import 'package:http/http.dart' as http;
import 'package:sqflite/sqflite.dart';

import 'data/datasources/weather_api_service.dart';
import 'data/datasources/weather_cache_data_source.dart';
import 'data/repositories/weather_repository_impl.dart';
import 'domain/repositories/weather_repository.dart';
import 'presentation/cubit/weather_cubit.dart';

class WeatherModuleFactory {
  WeatherModuleFactory({required this.apiKey});

  final String apiKey;

  Future<WeatherRepository> createRepository(
      Database database, http.Client client) async {
    final cache = WeatherCacheDataSource(database);
    await cache.init();
    final api = WeatherApiService(client: client, apiKey: apiKey);
    return WeatherRepositoryImpl(apiService: api, cacheDataSource: cache);
  }

  WeatherCubit createCubit(WeatherRepository repository) {
    return WeatherCubit(repository);
  }
}
