import '../../domain/entities/weather_snapshot.dart';
import '../../domain/repositories/weather_repository.dart';
import '../datasources/weather_api_service.dart';
import '../datasources/weather_cache_data_source.dart';
import '../models/weather_snapshot_model.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  WeatherRepositoryImpl({
    required this.apiService,
    required this.cacheDataSource,
  });

  final WeatherApiService apiService;
  final WeatherCacheDataSource cacheDataSource;

  @override
  Future<void> cacheSnapshot(WeatherSnapshot snapshot) async {
    final model = WeatherSnapshotModel.fromEntity(snapshot);
    await cacheDataSource.upsert(model);
  }

  @override
  Future<WeatherSnapshot?> loadCached() async {
    final model = await cacheDataSource.read();
    return model?.toEntity();
  }

  @override
  Future<WeatherSnapshot> loadByLocation({
    required double latitude,
    required double longitude,
  }) async {
    final model = await apiService.fetchSnapshot(
      latitude: latitude,
      longitude: longitude,
    );
    await cacheDataSource.upsert(model);
    return model.toEntity();
  }
}
