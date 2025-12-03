import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/auth_user.dart';
import '../../domain/repositories/auth_repository.dart';
import '../../domain/usecases/login_with_email_password.dart';
import '../../domain/usecases/logout.dart';

part 'auth_cubit.freezed.dart';

/// Cubit for managing authentication state.
///
/// Handles user authentication operations including login, registration,
/// logout, and session restoration. Uses [AuthRepository] for data operations.
class AuthCubit extends Cubit<AuthState> {
  /// Creates an auth cubit
  AuthCubit({
    required this.repository,
    required this.loginUseCase,
    required this.logoutUseCase,
  }) : super(const AuthState.initial()) {
    _hydrate();
  }

  /// The authentication repository
  final AuthRepository repository;

  /// Use case for login
  final LoginWithEmailPasswordUseCase loginUseCase;

  /// Use case for logout
  final LogoutUseCase logoutUseCase;

  /// Restores authentication state on app startup
  Future<void> _hydrate() async {
    final user = await repository.currentUser();
    if (user == null) {
      emit(const AuthState.unauthenticated());
    } else {
      emit(AuthState.authenticated(user: user));
    }
  }

  /// Registers a new user with email and password
  Future<void> register(String email, String password) async {
    emit(const AuthState.authenticating());
    try {
      final user = await repository.registerWithEmailPassword(
        email: email,
        password: password,
      );
      emit(AuthState.authenticated(user: user));
    } catch (error) {
      emit(AuthState.failure(
        message: error.toString().replaceAll('Exception: ', ''),
      ));
    }
  }

  /// Logs in a user with email and password
  Future<void> login(String email, String password) async {
    emit(const AuthState.authenticating());
    try {
      final user = await loginUseCase(email: email, password: password);
      emit(AuthState.authenticated(user: user));
    } catch (error) {
      emit(AuthState.failure(
        message: error.toString().replaceAll('Exception: ', ''),
      ));
    }
  }

  /// Logs out the current user
  Future<void> logout() async {
    await logoutUseCase();
    emit(const AuthState.unauthenticated());
  }
}

/// State for authentication using Freezed union types
@freezed
class AuthState with _$AuthState {
  const factory AuthState.initial() = _Initial;
  const factory AuthState.authenticating() = _Authenticating;
  const factory AuthState.authenticated({required AuthUser user}) =
      _Authenticated;
  const factory AuthState.unauthenticated() = _Unauthenticated;
  const factory AuthState.failure({required String message}) = _Failure;
}
