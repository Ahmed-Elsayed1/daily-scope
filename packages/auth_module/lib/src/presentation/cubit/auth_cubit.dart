import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/auth_user.dart';
import '../../domain/repositories/auth_repository.dart';
import '../../domain/usecases/login_with_email_password.dart';
import '../../domain/usecases/logout.dart';

part 'auth_cubit.freezed.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit({
    required this.repository,
    required this.loginUseCase,
    required this.logoutUseCase,
  }) : super(const AuthState()) {
    _hydrate();
  }

  final AuthRepository repository;
  final LoginWithEmailPasswordUseCase loginUseCase;
  final LogoutUseCase logoutUseCase;

  Future<void> _hydrate() async {
    final user = await repository.currentUser();
    if (user == null) {
      emit(state.copyWith(status: AuthStatus.unauthenticated, user: null));
    } else {
      emit(state.copyWith(status: AuthStatus.authenticated, user: user));
    }
  }

  Future<void> login(String email, String password) async {
    emit(state.copyWith(status: AuthStatus.authenticating, errorMessage: null));
    try {
      final user = await loginUseCase(email: email, password: password);
      emit(state.copyWith(status: AuthStatus.authenticated, user: user));
    } catch (error) {
      emit(state.copyWith(
        status: AuthStatus.failure,
        errorMessage: error.toString(),
      ));
    }
  }

  Future<void> logout() async {
    await logoutUseCase();
    emit(state.copyWith(status: AuthStatus.unauthenticated, user: null));
  }
}

@freezed
class AuthState with _$AuthState {
  const factory AuthState({
    @Default(AuthStatus.unknown) AuthStatus status,
    AuthUser? user,
    String? errorMessage,
  }) = _AuthState;
}
