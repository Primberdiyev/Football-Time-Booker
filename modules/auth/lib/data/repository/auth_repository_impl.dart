import 'dart:async';
import 'package:auth/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepositoryImpl implements AuthRepository {
  const AuthRepositoryImpl({
    required AuthRemoteDataSource remoteDataSource,
    required AuthLocalDataSource localDataSource,
  })  : _remoteDataSource = remoteDataSource,
        _localDataSource = localDataSource;

  final AuthRemoteDataSource _remoteDataSource;
  final AuthLocalDataSource _localDataSource;
  @override
  FutureOr<User?> signIn(SignInParams params) async {
    final user = await _remoteDataSource.signIn(params);
    if (user != null) {
      _localDataSource.saveUser(
        UserModel(
          email: params.email,
          password: params.password,
        ),
      );
    }
    return user;
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
