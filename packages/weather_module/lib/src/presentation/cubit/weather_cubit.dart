import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/weather_snapshot.dart';
import '../../domain/usecases/load_weather_overview.dart';

part 'weather_cubit.freezed.dart';

enum WeatherStatus { initial, loading, success, failure }

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit({
    required this.loadWeather,
    double latitude = 30.0444,
    double longitude = 31.2357,
  })  : _latitude = latitude,
        _longitude = longitude,
        super(const WeatherState()) {
    load();
  }

  final LoadWeatherOverviewUseCase loadWeather;
  double _latitude;
  double _longitude;

  Future<void> load({bool forceRefresh = false}) async {
    emit(state.copyWith(status: WeatherStatus.loading, errorMessage: null));
    try {
      final snapshot = await loadWeather(
        latitude: _latitude,
        longitude: _longitude,
        forceRefresh: forceRefresh,
      );
      emit(state.copyWith(
        status: WeatherStatus.success,
        snapshot: snapshot,
        lastUpdated: snapshot.updatedAt,
      ));
    } catch (error) {
      emit(state.copyWith(
        status: WeatherStatus.failure,
        errorMessage: error.toString(),
      ));
    }
  }

  Future<void> refresh() => load(forceRefresh: true);

  void updateLocation({required double latitude, required double longitude}) {
    _latitude = latitude;
    _longitude = longitude;
    refresh();
  }
}

@freezed
class WeatherState with _$WeatherState {
  const factory WeatherState({
    @Default(WeatherStatus.initial) WeatherStatus status,
    WeatherSnapshot? snapshot,
    String? errorMessage,
    DateTime? lastUpdated,
  }) = _WeatherState;
}
