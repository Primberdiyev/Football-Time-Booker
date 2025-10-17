import 'package:common_base/common_base.dart';
import 'package:navigation/navigation.dart';

class CoreDiModule extends BaseDiModule {
  const CoreDiModule();
  @override
  void initModule(GetIt getIt) {
    getIt.registerLazySingleton<AppRouter>(
      () => AppRouter(),
    );
  }
}
