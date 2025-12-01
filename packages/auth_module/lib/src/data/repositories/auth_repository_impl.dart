import 'dart:convert';

import 'package:crypto/crypto.dart';

import '../../domain/entities/auth_user.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_local_data_source.dart';
import '../models/auth_session_model.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl(this._localDataSource);

  final AuthLocalDataSource _localDataSource;

  @override
  Future<AuthUser?> currentUser() async {
    final session = await _localDataSource.readSession();
    return session?.toEntity();
  }

  @override
  Future<AuthUser> loginWithEmailPassword({
    required String email,
    required String password,
  }) async {
    if (email.isEmpty || password.isEmpty) {
      throw ArgumentError('Email and password are required');
    }
    final normalizedEmail = email.trim().toLowerCase();
    final hashedSecret = sha256.convert(utf8.encode(password)).toString();

    // TODO: Replace this local-only authentication with a secure backend integration.
    final session = AuthSessionModel(
      userId: normalizedEmail,
      email: normalizedEmail,
      displayName: normalizedEmail.split('@').first,
      hashedSecret: hashedSecret,
      createdAt: DateTime.now(),
    );
    await _localDataSource.upsertSession(session);
    return session.toEntity();
  }

  @override
  Future<void> logout() => _localDataSource.clearSession();
}
