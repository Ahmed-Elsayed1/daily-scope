import '../../domain/entities/city.dart';
import '../../domain/entities/weather.dart';
import '../../domain/entities/weather_snapshot.dart';

abstract class WeatherRepository {
  Future<Weather> getWeather(double lat, double lon);
  Future<List<Weather>> getForecast(double lat, double lon);
  Future<List<City>> searchCities(String query);
  Future<List<City>> getSavedCities();
  Future<void> saveCity(City city);
  Future<void> deleteCity(City city);

  // WeatherSnapshot methods for use case compatibility
  Future<WeatherSnapshot?> loadCached();
  Future<WeatherSnapshot> loadByLocation({
    required double latitude,
    required double longitude,
  });
  Future<void> cacheSnapshot(WeatherSnapshot snapshot);
}
