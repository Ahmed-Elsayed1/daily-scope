import '../../domain/entities/weather.dart';

class WeatherModel {
  const WeatherModel({
    required this.temperature,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
    required this.humidity,
    required this.windSpeed,
    required this.description,
    required this.iconCode,
    required this.timestamp,
    this.cityName,
  });

  final double temperature;
  final double feelsLike;
  final double tempMin;
  final double tempMax;
  final int humidity;
  final double windSpeed;
  final String description;
  final String iconCode;
  final DateTime timestamp;
  final String? cityName;

  Weather toEntity() => Weather(
        temperature: temperature,
        feelsLike: feelsLike,
        tempMin: tempMin,
        tempMax: tempMax,
        humidity: humidity,
        windSpeed: windSpeed,
        description: description,
        iconCode: iconCode,
        timestamp: timestamp,
        cityName: cityName,
      );

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    final main = json['main'] as Map<String, dynamic>;
    final weather = (json['weather'] as List).first as Map<String, dynamic>;
    final wind = json['wind'] as Map<String, dynamic>;

    return WeatherModel(
      temperature: (main['temp'] as num).toDouble(),
      feelsLike: (main['feels_like'] as num).toDouble(),
      tempMin: (main['temp_min'] as num).toDouble(),
      tempMax: (main['temp_max'] as num).toDouble(),
      humidity: (main['humidity'] as num).toInt(),
      windSpeed: (wind['speed'] as num).toDouble(),
      description: weather['description'] as String,
      iconCode: weather['icon'] as String,
      timestamp: DateTime.fromMillisecondsSinceEpoch((json['dt'] as int) * 1000),
      cityName: json['name'] as String?,
    );
  }
  
  Map<String, dynamic> toMap() => {
    'temperature': temperature,
    'feels_like': feelsLike,
    'temp_min': tempMin,
    'temp_max': tempMax,
    'humidity': humidity,
    'wind_speed': windSpeed,
    'description': description,
    'icon_code': iconCode,
    'timestamp': timestamp.toIso8601String(),
    'city_name': cityName,
  };

  factory WeatherModel.fromMap(Map<String, dynamic> map) {
    return WeatherModel(
      temperature: map['temperature'] as double,
      feelsLike: map['feels_like'] as double,
      tempMin: map['temp_min'] as double,
      tempMax: map['temp_max'] as double,
      humidity: map['humidity'] as int,
      windSpeed: map['wind_speed'] as double,
      description: map['description'] as String,
      iconCode: map['icon_code'] as String,
      timestamp: DateTime.parse(map['timestamp'] as String),
      cityName: map['city_name'] as String?,
    );
  }
}
