import '../entities/auth_user.dart';
import '../repositories/auth_repository.dart';

class LoginWithEmailPasswordUseCase {
  const LoginWithEmailPasswordUseCase({required this.repository});

  final AuthRepository repository;

  Future<AuthUser> call({required String email, required String password}) {
    return repository.loginWithEmailPassword(email: email, password: password);
  }
}
