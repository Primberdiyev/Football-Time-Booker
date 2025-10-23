import 'package:auth/auth.dart';
import 'package:objectbox/objectbox.dart';
import 'package:auth/objectbox.g.dart';

abstract class AuthLocalDataSource {
  Future<void> initObjectBox();

  void saveUser(UserModel userModel);

  void clearBox();

  void deleteUser();
  

  UserModel? getUser();
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
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
