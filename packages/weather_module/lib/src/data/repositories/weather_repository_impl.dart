import '../../domain/entities/city.dart';
import '../../domain/entities/weather.dart';
import '../../domain/entities/weather_snapshot.dart';
import '../../domain/repositories/weather_repository.dart';
import '../datasources/weather_api_service.dart';
import '../datasources/weather_cache_data_source.dart';
import '../models/city_model.dart';
import '../models/weather_snapshot_model.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  WeatherRepositoryImpl({
    required this.apiService,
    required this.cacheDataSource,
  });

  final WeatherApiService apiService;
  final WeatherCacheDataSource cacheDataSource;

  @override
  Future<Weather> getWeather(double lat, double lon) async {
    try {
      final model = await apiService.getWeather(lat, lon);
      await cacheDataSource.cacheWeather(lat, lon, model);
      return model.toEntity();
    } catch (e) {
      // Try cache
      final cached = await cacheDataSource.getWeather(lat, lon);
      if (cached != null) {
        return cached.toEntity();
      }
      rethrow;
    }
  }

  @override
  Future<List<Weather>> getForecast(double lat, double lon) async {
    try {
      final models = await apiService.getForecast(lat, lon);
      await cacheDataSource.cacheForecast(lat, lon, models);
      return models.map((e) => e.toEntity()).toList();
    } catch (e) {
      // Try cache
      final cached = await cacheDataSource.getForecast(lat, lon);
      if (cached != null) {
        return cached.map((e) => e.toEntity()).toList();
      }
      rethrow;
    }
  }

  @override
  Future<List<City>> searchCities(String query) async {
    final models = await apiService.searchCity(query);
    return models.map((e) => e.toEntity()).toList();
  }

  @override
  Future<List<City>> getSavedCities() async {
    final models = await cacheDataSource.getSavedCities();
    return models.map((e) => e.toEntity()).toList();
  }

  @override
  Future<void> saveCity(City city) async {
    await cacheDataSource.saveCity(CityModel.fromEntity(city));
  }

  @override
  Future<void> deleteCity(City city) async {
    await cacheDataSource.deleteCity(city.lat, city.lon);
  }

  @override
  Future<WeatherSnapshot?> loadCached() async {
    final cached = await cacheDataSource.getWeatherSnapshot();
    return cached?.toEntity();
  }

  @override
  Future<WeatherSnapshot> loadByLocation({
    required double latitude,
    required double longitude,
  }) async {
    final snapshotModel = await apiService.fetchSnapshot(
      latitude: latitude,
      longitude: longitude,
    );
    final snapshot = snapshotModel.toEntity();
    await cacheSnapshot(snapshot);
    return snapshot;
  }

  @override
  Future<void> cacheSnapshot(WeatherSnapshot snapshot) async {
    final model = WeatherSnapshotModel.fromEntity(snapshot);
    await cacheDataSource.cacheWeatherSnapshot(model);
  }
}
