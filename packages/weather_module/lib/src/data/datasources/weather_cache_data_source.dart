import 'dart:convert';
import 'package:sqflite/sqflite.dart';

import '../models/city_model.dart';
import '../models/weather_model.dart';
import '../models/weather_snapshot_model.dart';

/// Local data source for caching weather data and saved cities.
class WeatherCacheDataSource {
  /// Creates a weather cache data source
  WeatherCacheDataSource(this._database);

  final Database _database;

  /// Initializes database tables
  Future<void> init() async {
    // Table for saved cities
    await _database.execute('''
      CREATE TABLE IF NOT EXISTS saved_cities (
        name TEXT,
        lat REAL,
        lon REAL,
        country TEXT,
        state TEXT,
        PRIMARY KEY (lat, lon)
      )
    ''');

    // Table for cached weather
    await _database.execute('''
      CREATE TABLE IF NOT EXISTS cached_weather (
        lat REAL,
        lon REAL,
        data TEXT,
        timestamp TEXT,
        PRIMARY KEY (lat, lon)
      )
    ''');

    // Table for cached forecast
    await _database.execute('''
      CREATE TABLE IF NOT EXISTS cached_forecast (
        lat REAL,
        lon REAL,
        data TEXT,
        timestamp TEXT,
        PRIMARY KEY (lat, lon)
      )
    ''');

    // Table for cached weather snapshot (OneCall data)
    await _database.execute('''
      CREATE TABLE IF NOT EXISTS cached_weather_snapshot (
        id INTEGER PRIMARY KEY,
        current_temp REAL,
        high_temp REAL,
        low_temp REAL,
        condition TEXT,
        hourly_temps TEXT,
        daily_highs TEXT,
        daily_lows TEXT,
        updated_at TEXT
      )
    ''');
  }

  /// Saves a city to the list of saved cities
  Future<void> saveCity(CityModel city) async {
    await _database.insert(
      'saved_cities',
      city.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  /// Removes a city from the list of saved cities
  Future<void> deleteCity(double lat, double lon) async {
    await _database.delete(
      'saved_cities',
      where: 'lat = ? AND lon = ?',
      whereArgs: [lat, lon],
    );
  }

  /// Gets all saved cities
  Future<List<CityModel>> getSavedCities() async {
    final rows = await _database.query('saved_cities');
    return rows.map((row) => CityModel.fromMap(row)).toList();
  }

  /// Caches current weather for a location
  Future<void> cacheWeather(
      double lat, double lon, WeatherModel weather) async {
    await _database.insert(
      'cached_weather',
      {
        'lat': lat,
        'lon': lon,
        'data': jsonEncode(weather.toMap()),
        'timestamp': DateTime.now().toIso8601String(),
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  /// Gets cached weather for a location
  Future<WeatherModel?> getWeather(double lat, double lon) async {
    final rows = await _database.query(
      'cached_weather',
      where: 'lat = ? AND lon = ?',
      whereArgs: [lat, lon],
    );

    if (rows.isEmpty) return null;

    final row = rows.first;
    final data = jsonDecode(row['data'] as String) as Map<String, dynamic>;
    return WeatherModel.fromMap(data);
  }

  /// Caches forecast for a location
  Future<void> cacheForecast(
      double lat, double lon, List<WeatherModel> forecast) async {
    final data = forecast.map((e) => e.toMap()).toList();
    await _database.insert(
      'cached_forecast',
      {
        'lat': lat,
        'lon': lon,
        'data': jsonEncode(data),
        'timestamp': DateTime.now().toIso8601String(),
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  /// Gets cached forecast for a location
  Future<List<WeatherModel>?> getForecast(double lat, double lon) async {
    final rows = await _database.query(
      'cached_forecast',
      where: 'lat = ? AND lon = ?',
      whereArgs: [lat, lon],
    );

    if (rows.isEmpty) return null;

    final row = rows.first;
    final list = jsonDecode(row['data'] as String) as List<dynamic>;
    return list
        .map((e) => WeatherModel.fromMap(e as Map<String, dynamic>))
        .toList();
  }

  /// Caches weather snapshot
  Future<void> cacheWeatherSnapshot(WeatherSnapshotModel snapshot) async {
    await _database.insert(
      'cached_weather_snapshot',
      snapshot.toMap()..['id'] = 1,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  /// Gets cached weather snapshot
  Future<WeatherSnapshotModel?> getWeatherSnapshot() async {
    final rows = await _database.query('cached_weather_snapshot', limit: 1);
    if (rows.isEmpty) {
      return null;
    }
    return WeatherSnapshotModel.fromMap(rows.first);
  }
}
