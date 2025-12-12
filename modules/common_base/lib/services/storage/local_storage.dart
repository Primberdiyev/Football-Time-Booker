import 'package:auth/auth.dart';

abstract class LocalStorage {
  Future<void> initObjectBox();

  void saveUser(UserModel userModel);

  void clearBox();

  void deleteUser();

  UserModel? getUser();
}
