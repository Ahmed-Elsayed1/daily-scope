import 'dart:convert';

import '../../domain/entities/weather_snapshot.dart';

class WeatherSnapshotModel {
  const WeatherSnapshotModel({
    required this.currentTemp,
    required this.highTemp,
    required this.lowTemp,
    required this.condition,
    required this.hourlyTemps,
    required this.dailyHighs,
    required this.dailyLows,
    required this.updatedAt,
  });

  final double currentTemp;
  final double highTemp;
  final double lowTemp;
  final String condition;
  final List<double> hourlyTemps;
  final List<double> dailyHighs;
  final List<double> dailyLows;
  final DateTime updatedAt;

  WeatherSnapshot toEntity() => WeatherSnapshot(
        currentTemp: currentTemp,
        highTemp: highTemp,
        lowTemp: lowTemp,
        condition: condition,
        hourlyTemps: hourlyTemps,
        dailyHighs: dailyHighs,
        dailyLows: dailyLows,
        updatedAt: updatedAt,
      );

  Map<String, dynamic> toMap() => {
        'current_temp': currentTemp,
        'high_temp': highTemp,
        'low_temp': lowTemp,
        'condition': condition,
        'hourly_temps': jsonEncode(hourlyTemps),
        'daily_highs': jsonEncode(dailyHighs),
        'daily_lows': jsonEncode(dailyLows),
        'updated_at': updatedAt.toIso8601String(),
      };

  factory WeatherSnapshotModel.fromEntity(WeatherSnapshot snapshot) {
    return WeatherSnapshotModel(
      currentTemp: snapshot.currentTemp,
      highTemp: snapshot.highTemp,
      lowTemp: snapshot.lowTemp,
      condition: snapshot.condition,
      hourlyTemps: snapshot.hourlyTemps,
      dailyHighs: snapshot.dailyHighs,
      dailyLows: snapshot.dailyLows,
      updatedAt: snapshot.updatedAt,
    );
  }

  factory WeatherSnapshotModel.fromMap(Map<String, dynamic> map) {
    List<double> decodeNumeric(String key) {
      final raw = map[key] as String?;
      if (raw == null) {
        return const [];
      }
      final parsed = (jsonDecode(raw) as List).cast<num>();
      return parsed.map((value) => value.toDouble()).toList();
    }

    return WeatherSnapshotModel(
      currentTemp: (map['current_temp'] as num).toDouble(),
      highTemp: (map['high_temp'] as num).toDouble(),
      lowTemp: (map['low_temp'] as num).toDouble(),
      condition: map['condition'] as String,
      hourlyTemps: decodeNumeric('hourly_temps'),
      dailyHighs: decodeNumeric('daily_highs'),
      dailyLows: decodeNumeric('daily_lows'),
      updatedAt: DateTime.parse(map['updated_at'] as String),
    );
  }
}
