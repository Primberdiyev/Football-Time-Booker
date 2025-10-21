import 'package:auth/auth.dart';
import 'package:common_base/common_base.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthDiModule extends BaseDiModule {
  const AuthDiModule();
  @override
  void initModule(GetIt getIt) {
    getIt.registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(
        firebaseAuth: getIt<FirebaseAuth>(),
      ),
    );

    getIt.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(
        remoteDataSource: getIt<AuthRemoteDataSource>(),
      ),
    );

    getIt.registerLazySingleton<SignInUseCase>(
      () => SignInUseCase(
        repository: getIt<AuthRepository>(),
      ),
    );

    getIt.registerFactory<AuthBloc>(
      () => AuthBloc(
        signInUseCase: getIt<SignInUseCase>(),
      ),
    );
  }
}
