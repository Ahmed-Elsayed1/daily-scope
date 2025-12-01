import 'package:sqflite/sqflite.dart';

import '../models/auth_session_model.dart';

class AuthLocalDataSource {
  AuthLocalDataSource(this._database);

  final Database _database;

  Future<void> init() async {
    await _database.execute('''
      CREATE TABLE IF NOT EXISTS auth_session (
        user_id TEXT PRIMARY KEY,
        email TEXT,
        display_name TEXT,
        hashed_secret TEXT,
        created_at TEXT
      )
    ''');
  }

  Future<AuthSessionModel?> readSession() async {
    final rows = await _database.query('auth_session', limit: 1);
    if (rows.isEmpty) {
      return null;
    }
    return AuthSessionModel.fromMap(rows.first);
  }

  Future<void> upsertSession(AuthSessionModel model) async {
    await _database.insert(
      'auth_session',
      model.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> clearSession() async {
    await _database.delete('auth_session');
  }
}
