import 'package:sqflite/sqflite.dart';

import '../models/weather_snapshot_model.dart';

class WeatherCacheDataSource {
  WeatherCacheDataSource(this._database);

  final Database _database;

  Future<void> init() async {
    await _database.execute('''
      CREATE TABLE IF NOT EXISTS weather_snapshot (
        id INTEGER PRIMARY KEY,
        current_temp REAL,
        high_temp REAL,
        low_temp REAL,
        condition TEXT,
        hourly_temps TEXT,
        daily_highs TEXT,
        daily_lows TEXT,
        updated_at TEXT
      )
    ''');
  }

  Future<WeatherSnapshotModel?> read() async {
    final rows = await _database.query('weather_snapshot', limit: 1);
    if (rows.isEmpty) {
      return null;
    }
    return WeatherSnapshotModel.fromMap(rows.first);
  }

  Future<void> upsert(WeatherSnapshotModel model) async {
    await _database.insert(
      'weather_snapshot',
      model.toMap()..['id'] = 1,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> clear() => _database.delete('weather_snapshot');
}
