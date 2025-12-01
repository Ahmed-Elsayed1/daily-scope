import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/city_model.dart';
import '../models/weather_model.dart';
import '../models/weather_snapshot_model.dart';

/// Service for interacting with OpenWeather API.
/// 
/// Provides methods for current weather, forecast, and city search.
class WeatherApiService {
  /// Creates a weather API service
  WeatherApiService({
    required this.client,
    required this.apiKey,
    this.baseUrl = 'https://api.openweathermap.org',
  });

  final http.Client client;
  final String apiKey;
  final String baseUrl;

  /// Fetches current weather for a location
  Future<WeatherModel> getWeather(double lat, double lon) async {
    final uri = Uri.parse('$baseUrl/data/3.0/onecall?lat=').replace(
      queryParameters: {
        'lat': '$lat',
        'lon': '$lon',
        'units': 'metric',
        'appid': apiKey,
      },
    );

    final response = await client.get(uri);
    
    if (response.statusCode != 200) {
      throw Exception('Failed to load weather: ${response.statusCode}');
    }

    final json = jsonDecode(response.body) as Map<String, dynamic>;
    return WeatherModel.fromJson(json);
  }

  /// Fetches 5-day forecast for a location
  Future<List<WeatherModel>> getForecast(double lat, double lon) async {
    final uri = Uri.parse('$baseUrl/data/2.5/forecast').replace(
      queryParameters: {
        'lat': '$lat',
        'lon': '$lon',
        'units': 'metric',
        'appid': apiKey,
      },
    );

    final response = await client.get(uri);
    
    if (response.statusCode != 200) {
      throw Exception('Failed to load forecast: ${response.statusCode}');
    }

    final json = jsonDecode(response.body) as Map<String, dynamic>;
    final list = json['list'] as List<dynamic>;
    
    return list
        .map((item) => WeatherModel.fromJson(item as Map<String, dynamic>))
        .toList();
  }

  /// Searches for cities by name
  Future<List<CityModel>> searchCity(String query) async {
    final uri = Uri.parse('$baseUrl/geo/1.0/direct').replace(
      queryParameters: {
        'q': query,
        'limit': '5',
        'appid': apiKey,
      },
    );

    final response = await client.get(uri);
    
    if (response.statusCode != 200) {
      throw Exception('Failed to search city: ${response.statusCode}');
    }

    final list = jsonDecode(response.body) as List<dynamic>;
    
    return list
        .map((item) => CityModel.fromJson(item as Map<String, dynamic>))
        .toList();
  }

  /// Fetches weather snapshot using OneCall API (includes current, hourly, and daily forecasts)
  Future<WeatherSnapshotModel> fetchSnapshot({
    required double latitude,
    required double longitude,
  }) async {
    // Use OneCall API 3.0 for comprehensive weather data
    final uri = Uri.parse('$baseUrl/data/3.0/onecall').replace(
      queryParameters: {
        'lat': '$latitude',
        'lon': '$longitude',
        'appid': apiKey,
        'units': 'metric',
        'exclude': 'minutely,alerts',
      },
    );

    final response = await client.get(uri);

    if (response.statusCode != 200) {
      throw Exception('Failed to fetch weather snapshot: ${response.statusCode} - ${response.body}');
    }

    final json = jsonDecode(response.body) as Map<String, dynamic>;
    return _mapToSnapshotModel(json);
  }

  WeatherSnapshotModel _mapToSnapshotModel(Map<String, dynamic> json) {
    final current = json['current'] as Map<String, dynamic>? ?? {};
    final hourly = (json['hourly'] as List<dynamic>? ?? []).cast<Map<String, dynamic>>();
    final daily = (json['daily'] as List<dynamic>? ?? []).cast<Map<String, dynamic>>();

    // Extract hourly temperatures (next 24 hours)
    final hourlyTemps = hourly
        .take(24)
        .map((entry) => (entry['temp'] as num?)?.toDouble() ?? 0.0)
        .toList();

    // Extract daily highs and lows (7 days)
    final dailyHighs = daily
        .take(7)
        .map((entry) {
          final temp = entry['temp'] as Map<String, dynamic>?;
          return (temp?['max'] as num?)?.toDouble() ?? 0.0;
        })
        .toList();

    final dailyLows = daily
        .take(7)
        .map((entry) {
          final temp = entry['temp'] as Map<String, dynamic>?;
          return (temp?['min'] as num?)?.toDouble() ?? 0.0;
        })
        .toList();

    final currentTemp = (current['temp'] as num?)?.toDouble() ?? 0.0;
    final weather = (current['weather'] as List<dynamic>?)?.first as Map<String, dynamic>?;
    final condition = weather?['description'] as String? ?? 'Unknown';

    // Use first day's high/low as current high/low
    final highTemp = dailyHighs.isNotEmpty ? dailyHighs.first : currentTemp;
    final lowTemp = dailyLows.isNotEmpty ? dailyLows.first : currentTemp;

    return WeatherSnapshotModel(
      currentTemp: currentTemp,
      highTemp: highTemp,
      lowTemp: lowTemp,
      condition: condition,
      hourlyTemps: hourlyTemps,
      dailyHighs: dailyHighs,
      dailyLows: dailyLows,
      updatedAt: DateTime.now(),
    );
  }
}
