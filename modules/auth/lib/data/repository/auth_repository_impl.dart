import 'dart:async';

import 'package:auth/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepositoryImpl implements AuthRepository {
  const AuthRepositoryImpl({required AuthRemoteDataSource remoteDataSource})
      : _remoteDataSource = remoteDataSource;

  final AuthRemoteDataSource _remoteDataSource;
  @override
  FutureOr<User?> signIn(SignInParams params) async {
    final user = await _remoteDataSource.signIn(params);
    return user;
  }
}
