import 'package:sqflite/sqflite.dart';

import '../models/auth_session_model.dart';

/// Local data source for authentication using SQLite.
///
/// Manages the users table and active session table for local-only authentication.
class AuthLocalDataSource {
  /// Creates an auth local data source
  AuthLocalDataSource(this._database);

  final Database _database;

  /// Initializes the database tables for authentication.
  ///
  /// Creates two tables:
  /// - `users`: stores registered user credentials
  /// - `auth_session`: stores the currently active session
  Future<void> init() async {
    // Users table - stores all registered users with hashed passwords
    await _database.execute('''
      CREATE TABLE IF NOT EXISTS users (
        email TEXT PRIMARY KEY,
        hashed_password TEXT NOT NULL,
        display_name TEXT,
        created_at TEXT NOT NULL
      )
    ''');

    // Session table - stores the currently logged-in user
    await _database.execute('''
      CREATE TABLE IF NOT EXISTS auth_session (
        user_id TEXT PRIMARY KEY,
        email TEXT NOT NULL,
        display_name TEXT,
        hashed_secret TEXT NOT NULL,
        created_at TEXT NOT NULL
      )
    ''');
  }

  /// Registers a new user in the database.
  ///
  /// Throws an exception if a user with the same email already exists.
  Future<void> registerUser({
    required String email,
    required String hashedPassword,
    required String displayName,
  }) async {
    // Check if user already exists
    final existingUser = await _database.query(
      'users',
      where: 'email = ?',
      whereArgs: [email],
    );

    if (existingUser.isNotEmpty) {
      throw Exception('User with email $email already exists');
    }

    // Insert new user
    await _database.insert(
      'users',
      {
        'email': email,
        'hashed_password': hashedPassword,
        'display_name': displayName,
        'created_at': DateTime.now().toIso8601String(),
      },
    );
  }

  /// Finds a user by email and verifies the password.
  ///
  /// Returns the user data if credentials are valid, null otherwise.
  Future<Map<String, dynamic>?> findUserByEmailAndPassword({
    required String email,
    required String hashedPassword,
  }) async {
    final results = await _database.query(
      'users',
      where: 'email = ? AND hashed_password = ?',
      whereArgs: [email, hashedPassword],
    );

    if (results.isEmpty) {
      return null;
    }

    return results.first;
  }

  /// Reads the current active session.
  ///
  /// Returns null if no user is logged in.
  Future<AuthSessionModel?> readSession() async {
    final rows = await _database.query('auth_session', limit: 1);
    if (rows.isEmpty) {
      return null;
    }
    return AuthSessionModel.fromMap(rows.first);
  }

  /// Creates or updates the active session for a logged-in user.
  Future<void> upsertSession(AuthSessionModel model) async {
    // Clear any existing session first
    await _database.delete('auth_session');

    // Insert new session
    await _database.insert(
      'auth_session',
      model.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  /// Clears the active session (logs out the user).
  Future<void> clearSession() async {
    await _database.delete('auth_session');
  }
}
