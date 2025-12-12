import 'package:common_base/common_base.dart';
import 'package:home/home.dart';
import 'package:network/network.dart';

class HomeDiModule extends BaseDiModule {
  const HomeDiModule();
  @override
  void initModule(GetIt getIt) {
    getIt.registerLazySingleton<HomeRemoteDataSource>(
      () => HomeRemoteDataSourceImpl(
        firebaseService: getIt<FirebaseService>(),
      ),
    );

    getIt.registerLazySingleton<HomeRepository>(
      () => HomeRepositoryImpl(
        remoteDataSource: getIt<HomeRemoteDataSource>(),
      ),
    );

    getIt.registerLazySingleton<SaveBookUseCase>(
      () => SaveBookUseCase(
        repository: getIt<HomeRepository>(),
      ),
    );

    getIt.registerFactory(
      () => HomeBloc(
        saveBookUseCase: getIt<SaveBookUseCase>(),
      ),
    );
  }
}
