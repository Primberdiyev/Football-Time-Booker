import 'package:auth/objectbox.g.dart';

class ObjectBoxStore {
  static Store? _store;

  static Future<Store> getInstance() async {
    if (_store != null) return _store!;

    _store = await openStore();
    return _store!;
  }

  static Future<void> close() async {
    _store?.close();
    _store = null;
  }
}
