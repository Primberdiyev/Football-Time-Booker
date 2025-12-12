import 'dart:async';

import 'package:auth/auth.dart';
import 'package:common_base/common_base.dart';
import 'package:network/network.dart';

abstract interface class AuthRemoteDataSource {
  FutureOr<LoginResponse?> signIn(SignInParams params);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  AuthRemoteDataSourceImpl({required FirebaseService firebaseService})
      : _firebaseService = firebaseService;

  final FirebaseService _firebaseService;
  @override
  FutureOr<LoginResponse?> signIn(SignInParams params) async {
  
      final request = await _firebaseService.login(
        email: params.login.toDummyEmail(),
        password: params.password,
      );

      final user = request.user;
      return LoginResponse(
        id: user?.uid,
        email: user?.email,
      );
    
  }
}
