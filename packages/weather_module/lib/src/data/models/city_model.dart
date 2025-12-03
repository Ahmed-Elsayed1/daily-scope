import '../../domain/entities/city.dart';

class CityModel {
  const CityModel({
    required this.name,
    required this.lat,
    required this.lon,
    this.country,
    this.state,
  });

  final String name;
  final double lat;
  final double lon;
  final String? country;
  final String? state;

  City toEntity() => City(
        name: name,
        lat: lat,
        lon: lon,
        country: country,
        state: state,
      );

  factory CityModel.fromJson(Map<String, dynamic> json) {
    return CityModel(
      name: json['name'] as String,
      lat: (json['lat'] as num).toDouble(),
      lon: (json['lon'] as num).toDouble(),
      country: json['country'] as String?,
      state: json['state'] as String?,
    );
  }

  Map<String, dynamic> toMap() => {
        'name': name,
        'lat': lat,
        'lon': lon,
        'country': country,
        'state': state,
      };

  factory CityModel.fromMap(Map<String, dynamic> map) {
    return CityModel(
      name: map['name'] as String,
      lat: map['lat'] as double,
      lon: map['lon'] as double,
      country: map['country'] as String?,
      state: map['state'] as String?,
    );
  }

  factory CityModel.fromEntity(City city) {
    return CityModel(
      name: city.name,
      lat: city.lat,
      lon: city.lon,
      country: city.country,
      state: city.state,
    );
  }
}
