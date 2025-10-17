import 'package:get_it/get_it.dart';

export 'package:get_it/get_it.dart';

final _getIt = GetIt.instance;

abstract class BaseDiModule implements DiGetterInterface {
  const BaseDiModule({
    this.dependencies = const [],
  });

  final List<BaseDiModule> dependencies;

  String get scopeName => toString();

  static final Map<String, int> _launchedScopes = {};

  void init() {
    for (final dependency in dependencies) {
      dependency.init();
    }
    initModule(_getIt);
  }

  @override
  bool isRegistered<T extends Object>() => _getIt.isRegistered<T>();

  @override
  T get<T extends Object>({
    String? instanceName,
    dynamic param1,
    dynamic param2,
  }) {
    return _getIt.get(
      instanceName: instanceName,
      param1: param1,
      param2: param2,
    );
  }

  void onPopScope(GetIt getIt) {
    return;
  }

  void initModule(GetIt getIt);

  Future<void> initAsync() async {
    init();
    await _getIt.allReady();
  }

  void pushScope() {
    final count = _launchedScopes[scopeName];
    if (count == null) {
      _getIt.pushNewScope(scopeName: scopeName);
      _launchedScopes[scopeName] = 1;
      init();
    } else {
      _launchedScopes[scopeName] = count + 1;
    }
  }

  Future<void> popScope() async {
    onPopScope.call(_getIt);

    final count = _launchedScopes[scopeName];
    if (count == 1) {
      await _getIt.dropScope(scopeName);
      _launchedScopes.remove(scopeName);
    } else if (count == null || count == 0) {
      throw Exception("Cannot call popScope because it is not launched");
    } else {
      _launchedScopes[scopeName] = count - 1;
    }
  }

  Future<BaseDiModule> popScopeAsync() async {
    pushScope();
    await _getIt.allReady();
    return this;
  }

  static Future<void> initDi(BaseDiModule coreDiModule) async {
    coreDiModule.init();
    await _getIt.allReady();
  }
}

abstract interface class DiGetterInterface {
  bool isRegistered<T extends Object>();

  T get<T extends Object>({
    String? instanceName,
    dynamic param1,
    dynamic param2,
  });
}
