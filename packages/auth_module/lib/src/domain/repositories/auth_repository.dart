import '../entities/auth_user.dart';

enum AuthStatus {
  unknown,
  unauthenticated,
  authenticating,
  authenticated,
  failure
}

abstract class AuthRepository {
  Future<AuthUser?> currentUser();
  Future<AuthUser> loginWithEmailPassword({
    required String email,
    required String password,
  });
  Future<void> logout();
}
