
import 'package:common_base/di/base_di_module.dart';

@Deprecated("Временное решение для доступа к DI из проблемных мест")
class DiGetter {
  DiGetter._();

  static final _DiGetterImpl _module = _DiGetterImpl();

  static bool isRegistered<T extends Object>() => _module.isRegistered<T>();

  static T get<T extends Object>({
    String? instanceName,
    dynamic param1,
    dynamic param2,
  }) =>
      _module.get<T>(
        instanceName: instanceName,
        param1: param1,
        param2: param2,
      );

  static T? safeGet<T extends Object>({
    String? instanceName,
    dynamic param1,
    dynamic param2,
  }) =>
      isRegistered<T>()
          ? get<T>(
              instanceName: instanceName,
              param1: param1,
              param2: param2,
            )
          : null;
}

class _DiGetterImpl extends BaseDiModule {
  @override
  void initModule(GetIt getIt) {}
}
