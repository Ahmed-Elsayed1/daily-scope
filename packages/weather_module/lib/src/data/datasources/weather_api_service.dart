import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/weather_snapshot_model.dart';

class WeatherApiService {
  WeatherApiService({
    required this.client,
    required this.apiKey,
    this.baseUrl = 'https://api.openweathermap.org',
  });

  final http.Client client;
  final String apiKey;
  final String baseUrl;

  Future<WeatherSnapshotModel> fetchSnapshot({
    required double latitude,
    required double longitude,
  }) async {
    final uri = Uri.parse('$baseUrl/data/3.0/onecall').replace(
      queryParameters: {
        'lat': '$latitude',
        'lon': '$longitude',
        'appid': apiKey,
        'units': 'metric',
      },
    );
    final response = await client.get(uri);
    if (response.statusCode != 200) {
      // TODO: Provide richer error types for downstream retry logic.
      throw Exception('Failed to fetch weather: ${response.body}');
    }
    final payload = jsonDecode(response.body) as Map<String, dynamic>;
    return _mapToModel(payload);
  }

  WeatherSnapshotModel _mapToModel(Map<String, dynamic> json) {
    final current = json['current'] as Map<String, dynamic>? ?? {};
    final daily =
        (json['daily'] as List<dynamic>? ?? []).cast<Map<String, dynamic>>();
    final hourly =
        (json['hourly'] as List<dynamic>? ?? []).cast<Map<String, dynamic>>();

    List<double> mapHourly() => hourly
        .map((entry) => (entry['temp'] as num?)?.toDouble())
        .whereType<double>()
        .take(12)
        .toList();

    List<double> mapDaily(String key) => daily
        .map((entry) => (entry['temp'] as Map<String, dynamic>?)?[key])
        .whereType<num>()
        .map((value) => value.toDouble())
        .take(7)
        .toList();

    final hourlyTemps = mapHourly();
    final dailyHighValues = mapDaily('max');
    final dailyLowValues = mapDaily('min');

    return WeatherSnapshotModel(
      currentTemp: (current['temp'] as num?)?.toDouble() ?? 0,
      highTemp: dailyHighValues.isNotEmpty
          ? dailyHighValues.first
          : (current['temp'] as num?)?.toDouble() ?? 0,
      lowTemp: dailyLowValues.isNotEmpty
          ? dailyLowValues.first
          : (current['temp'] as num?)?.toDouble() ?? 0,
      condition: ((current['weather'] as List?)?.first
              as Map<String, dynamic>?)?['description'] as String? ??
          'Unknown',
      hourlyTemps: hourlyTemps,
      dailyHighs: dailyHighValues,
      dailyLows: dailyLowValues,
      updatedAt: DateTime.now(),
    );
  }
}
