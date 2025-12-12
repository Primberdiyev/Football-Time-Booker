import 'package:auth/auth.dart';
import 'package:common_base/common_base.dart';

abstract class AuthLocalDataSource {
  void saveUser(UserModel userModel);

  void deleteUser();

  UserModel? getUser();
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  AuthLocalDataSourceImpl({required LocalStorage localStorage})
      : _localStorage = localStorage;

  final LocalStorage _localStorage;
  @override
  void deleteUser() {
    _localStorage.clearBox();
  }

  @override
  UserModel? getUser() {
    final user = _localStorage.getUser();
    return user;
  }

  @override
  void saveUser(UserModel userModel) {
    _localStorage.saveUser(userModel);
  }
}
