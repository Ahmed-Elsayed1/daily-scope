import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/city.dart';
import '../../domain/entities/weather.dart';
import '../../domain/repositories/weather_repository.dart';

part 'weather_cubit.freezed.dart';

enum WeatherStatus { initial, loading, success, failure }

@freezed
class WeatherState with _$WeatherState {
  const factory WeatherState({
    @Default(WeatherStatus.initial) WeatherStatus status,
    Weather? currentWeather,
    @Default([]) List<Weather> forecast,
    @Default([]) List<City> savedCities,
    @Default([]) List<City> searchResults,
    City? currentCity,
    String? errorMessage,
  }) = _WeatherState;
}

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit(this._repository) : super(const WeatherState()) {
    _init();
  }

  final WeatherRepository _repository;

  Future<void> _init() async {
    await loadSavedCities();
    if (state.savedCities.isNotEmpty) {
      selectCity(state.savedCities.first);
    } else {
      // Default to Cairo if no saved cities
      // Or wait for user to search
      // Let's try to fetch for a default location (e.g. Cairo)
      // Cairo: 30.0444, 31.2357
      fetchWeatherForLocation(30.0444, 31.2357, 'Cairo');
    }
  }

  Future<void> loadSavedCities() async {
    try {
      final cities = await _repository.getSavedCities();
      emit(state.copyWith(savedCities: cities));
    } catch (e) {
      // Ignore error for saved cities
    }
  }

  Future<void> selectCity(City city) async {
    emit(state.copyWith(currentCity: city));
    await fetchWeatherForLocation(city.lat, city.lon, city.name);
  }

  Future<void> fetchWeatherForLocation(double lat, double lon, String? cityName) async {
    emit(state.copyWith(status: WeatherStatus.loading, errorMessage: null));
    try {
      final weather = await _repository.getWeather(lat, lon);
      final forecast = await _repository.getForecast(lat, lon);
      
      // If city name is provided, ensure it's in the weather object
      final weatherWithCity = cityName != null 
          ? weather.copyWith(cityName: cityName) 
          : weather;

      emit(state.copyWith(
        status: WeatherStatus.success,
        currentWeather: weatherWithCity,
        forecast: forecast,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: WeatherStatus.failure,
        errorMessage: e.toString().replaceAll('Exception: ', ''),
      ));
    }
  }

  Future<void> searchCities(String query) async {
    if (query.isEmpty) {
      emit(state.copyWith(searchResults: []));
      return;
    }
    try {
      final results = await _repository.searchCities(query);
      emit(state.copyWith(searchResults: results));
    } catch (e) {
      emit(state.copyWith(searchResults: []));
    }
  }

  Future<void> saveCity(City city) async {
    try {
      await _repository.saveCity(city);
      await loadSavedCities();
    } catch (e) {
      emit(state.copyWith(errorMessage: 'Failed to save city'));
    }
  }

  Future<void> deleteCity(City city) async {
    try {
      await _repository.deleteCity(city);
      await loadSavedCities();
      if (state.currentCity == city && state.savedCities.isNotEmpty) {
        selectCity(state.savedCities.first);
      }
    } catch (e) {
      emit(state.copyWith(errorMessage: 'Failed to delete city'));
    }
  }
  
  void clearSearch() {
    emit(state.copyWith(searchResults: []));
  }

  Future<void> loadByLocation(double lat, double lon) async {
    await fetchWeatherForLocation(lat, lon, null);
  }

  Future<void> loadCached(double lat, double lon) async {
    // For now, we rely on the repository's fallback mechanism
    // But we could expose a direct cache method if needed
    await fetchWeatherForLocation(lat, lon, null);
  }
  
  Future<void> cacheSnapshot() async {
    // This might be intended to force a save of the current state
    // Since we cache on fetch, this might be a no-op or re-save
    if (state.currentWeather != null) {
      // We could re-save if needed, but for now let's just log or no-op
      // to satisfy the interface requirement
    }
  }
}
