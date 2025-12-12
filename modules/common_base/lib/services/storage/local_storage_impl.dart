import 'package:auth/auth.dart';
import 'package:auth/objectbox.g.dart';
import 'package:common_base/common_base.dart';

class LocalStorageImpl implements LocalStorage {
  late Store store;

  @override
  Future<void> initObjectBox() async {
    store = await ObjectBoxStore.getInstance();
  }

  @override
  void clearBox() {
    store.box<UserModel>().removeAll();
  }

  @override
  void deleteUser() {
    store.box<UserModel>().removeAll();
  }

  @override
  UserModel? getUser() {
    final users = store.box<UserModel>().getAll();
    if (users.isNotEmpty) {
      return users.last;
    }
    return null;
  }

  @override
  void saveUser(UserModel userModel) {
    store.box<UserModel>().put(userModel);
  }
}
