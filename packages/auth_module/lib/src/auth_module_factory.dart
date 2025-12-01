import 'package:sqflite/sqflite.dart';

import 'data/datasources/auth_local_data_source.dart';
import 'data/repositories/auth_repository_impl.dart';
import 'domain/repositories/auth_repository.dart';
import 'domain/usecases/login_with_email_password.dart';
import 'domain/usecases/logout.dart';
import 'presentation/cubit/auth_cubit.dart';

class AuthModuleFactory {
  const AuthModuleFactory();

  Future<AuthRepository> createRepository(Database database) async {
    final localDataSource = AuthLocalDataSource(database);
    await localDataSource.init();
    return AuthRepositoryImpl(localDataSource);
  }

  AuthCubit createCubit(AuthRepository repository) {
    return AuthCubit(
      repository: repository,
      loginUseCase: LoginWithEmailPasswordUseCase(repository: repository),
      logoutUseCase: LogoutUseCase(repository: repository),
    );
  }
}
