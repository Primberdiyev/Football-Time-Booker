import 'dart:async';
import 'package:auth/auth.dart';
import 'package:common_base/common_base.dart';

class AuthRepositoryImpl implements AuthRepository {
  const AuthRepositoryImpl({
    required AuthRemoteDataSource remoteDataSource,
    required AuthLocalDataSource localDataSource,
  })  : _remoteDataSource = remoteDataSource,
        _localDataSource = localDataSource;

  final AuthRemoteDataSource _remoteDataSource;
  final AuthLocalDataSource _localDataSource;
  @override
  Future<UserModel?> signIn(SignInParams params) async {
    final user = await _remoteDataSource.signIn(params);
    _localDataSource.saveUser(
      UserModel(
        login: user?.email?.getLoginFromDummyEmail() ?? '',
        password: params.password,
        uid: user?.id ?? '',
      ),
    );

    return user?.toEntity(password: params.password);
  }

  @override
  bool isRegistered() {
    final userData = _localDataSource.getUser();
    if (userData != null) {
      return true;
    }
    return false;
  }
}
