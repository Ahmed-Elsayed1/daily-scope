import 'package:freezed_annotation/freezed_annotation.dart';

part 'city.freezed.dart';

@freezed
class City with _$City {
  const factory City({
    required String name,
    required double lat,
    required double lon,
    String? country,
    String? state,
  }) = _City;
}
