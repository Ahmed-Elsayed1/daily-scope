import '../entities/weather_snapshot.dart';

abstract class WeatherRepository {
  Future<WeatherSnapshot> loadByLocation(
      {required double latitude, required double longitude});
  Future<WeatherSnapshot?> loadCached();
  Future<void> cacheSnapshot(WeatherSnapshot snapshot);
}
