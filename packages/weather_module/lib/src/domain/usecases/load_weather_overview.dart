import '../entities/weather_snapshot.dart';
import '../repositories/weather_repository.dart';

class LoadWeatherOverviewUseCase {
  const LoadWeatherOverviewUseCase({required this.repository});

  final WeatherRepository repository;

  Future<WeatherSnapshot> call({
    required double latitude,
    required double longitude,
    bool forceRefresh = false,
  }) async {
    if (!forceRefresh) {
      final cached = await repository.loadCached();
      if (cached != null) {
        return cached;
      }
    }
    final snapshot = await repository.loadByLocation(
      latitude: latitude,
      longitude: longitude,
    );
    await repository.cacheSnapshot(snapshot);
    return snapshot;
  }
}
