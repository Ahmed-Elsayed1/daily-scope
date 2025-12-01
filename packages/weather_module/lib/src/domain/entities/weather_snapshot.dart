import 'package:freezed_annotation/freezed_annotation.dart';

part 'weather_snapshot.freezed.dart';

@freezed
class WeatherSnapshot with _$WeatherSnapshot {
  const factory WeatherSnapshot({
    required double currentTemp,
    required double highTemp,
    required double lowTemp,
    required String condition,
    required List<double> hourlyTemps,
    required List<double> dailyHighs,
    required List<double> dailyLows,
    required DateTime updatedAt,
  }) = _WeatherSnapshot;
}
