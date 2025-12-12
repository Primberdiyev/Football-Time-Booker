import 'package:auth/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:common_base/common_base.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:navigation/navigation.dart';
import 'package:network/network.dart';
import 'package:talker/talker.dart';

class CoreDiModule extends BaseDiModule {
  const CoreDiModule();
  @override
  void initModule(GetIt getIt) {
    getIt.registerLazySingleton<AppRouter>(
      () => AppRouter(),
    );
    getIt.registerLazySingleton<FirebaseAuth>(
      () => FirebaseAuth.instance,
    );

    getIt.registerLazySingleton<FirebaseFirestore>(
      () => FirebaseFirestore.instance,
    );

    getIt.registerLazySingleton<LocalStorage>(
      () => LocalStorageImpl(),
    );

    getIt.registerLazySingleton<AuthLocalDataSource>(
      () => AuthLocalDataSourceImpl(
        localStorage: getIt<LocalStorage>(),
      ),
    );

    getIt.registerLazySingleton<Talker>(
      () => Talker(),
    );

    getIt.registerLazySingleton<FirebaseService>(
      () => FirebaseServiceImpl(
        firestore: getIt<FirebaseFirestore>(),
        firebaseAuth: getIt<FirebaseAuth>(),
        talker: getIt<Talker>(),
      ),
    );
  }
}
