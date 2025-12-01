import 'package:freezed_annotation/freezed_annotation.dart';

part 'weather.freezed.dart';

@freezed
class Weather with _$Weather {
  const factory Weather({
    required double temperature,
    required double feelsLike,
    required double tempMin,
    required double tempMax,
    required int humidity,
    required double windSpeed,
    required String description,
    required String iconCode,
    required DateTime timestamp,
    String? cityName,
  }) = _Weather;
}
