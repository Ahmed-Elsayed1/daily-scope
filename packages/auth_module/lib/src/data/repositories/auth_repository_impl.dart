import 'dart:convert';

import 'package:crypto/crypto.dart';

import '../../domain/entities/auth_user.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_local_data_source.dart';
import '../models/auth_session_model.dart';

/// Implementation of [AuthRepository] using local SQLite storage.
/// 
/// Provides local-only authentication with password hashing using SHA-256.
/// This is a simplified implementation for demonstration purposes.
/// In a production app, you would integrate with a backend authentication service.
class AuthRepositoryImpl implements AuthRepository {
  /// Creates an auth repository implementation
  AuthRepositoryImpl(this._localDataSource);

  final AuthLocalDataSource _localDataSource;

  @override
  Future<AuthUser?> currentUser() async {
    final session = await _localDataSource.readSession();
    return session?.toEntity();
  }

  @override
  Future<AuthUser> registerWithEmailPassword({
    required String email,
    required String password,
  }) async {
    // Validate input
    if (email.isEmpty || password.isEmpty) {
      throw ArgumentError('Email and password are required');
    }

    if (!_isValidEmail(email)) {
      throw ArgumentError('Invalid email format');
    }

    if (password.length < 6) {
      throw ArgumentError('Password must be at least 6 characters long');
    }

    // Normalize email and hash password
    final normalizedEmail = email.trim().toLowerCase();
    final hashedPassword = _hashPassword(password);

    // Extract display name from email (part before @)
    final displayName = normalizedEmail.split('@').first;

    try {
      // Register user in database
      await _localDataSource.registerUser(
        email: normalizedEmail,
        hashedPassword: hashedPassword,
        displayName: displayName,
      );

      // Create session for the newly registered user
      final session = AuthSessionModel(
        userId: normalizedEmail,
        email: normalizedEmail,
        displayName: displayName,
        hashedSecret: hashedPassword,
        createdAt: DateTime.now(),
      );

      await _localDataSource.upsertSession(session);
      return session.toEntity();
    } catch (e) {
      // Re-throw with more context
      if (e.toString().contains('already exists')) {
        throw Exception('An account with this email already exists');
      }
      rethrow;
    }
  }

  @override
  Future<AuthUser> loginWithEmailPassword({
    required String email,
    required String password,
  }) async {
    // Validate input
    if (email.isEmpty || password.isEmpty) {
      throw ArgumentError('Email and password are required');
    }

    // Normalize email and hash password
    final normalizedEmail = email.trim().toLowerCase();
    final hashedPassword = _hashPassword(password);

    // Find user by credentials
    final userData = await _localDataSource.findUserByEmailAndPassword(
      email: normalizedEmail,
      hashedPassword: hashedPassword,
    );

    if (userData == null) {
      throw Exception('Invalid email or password');
    }

    // Create session for the logged-in user
    final session = AuthSessionModel(
      userId: userData['email'] as String,
      email: userData['email'] as String,
      displayName: userData['display_name'] as String? ?? 
                   (userData['email'] as String).split('@').first,
      hashedSecret: hashedPassword,
      createdAt: DateTime.now(),
    );

    await _localDataSource.upsertSession(session);
    return session.toEntity();
  }

  @override
  Future<void> logout() => _localDataSource.clearSession();

  /// Hashes a password using SHA-256
  String _hashPassword(String password) {
    return sha256.convert(utf8.encode(password)).toString();
  }

  /// Validates email format using a simple regex
  bool _isValidEmail(String email) {
    final emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
    return emailRegex.hasMatch(email);
  }
}
