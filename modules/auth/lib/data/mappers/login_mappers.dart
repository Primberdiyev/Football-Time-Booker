import 'package:auth/auth.dart';
import 'package:common_base/common_base.dart';

extension LoginResponseMapper on LoginResponse {
  UserModel toEntity({required String password}) => UserModel(
        login: email?.getLoginFromDummyEmail() ?? '',
        password: password,
        uid: id ?? '',
      );
}
