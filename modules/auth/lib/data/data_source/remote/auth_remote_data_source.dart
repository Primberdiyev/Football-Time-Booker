import 'dart:async';

import 'package:auth/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract interface class AuthRemoteDataSource {
  FutureOr<User?> signIn(SignInParams params);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  AuthRemoteDataSourceImpl({required FirebaseAuth firebaseAuth})
      : _firebaseAuth = firebaseAuth;

  final FirebaseAuth _firebaseAuth;
  @override
  FutureOr<User?> signIn(SignInParams params) async {
    try {
      final request = await _firebaseAuth.signInWithEmailAndPassword(
        email: params.email,
        password: params.password,
      );
      return request.user;
    } catch (e) {
      return null;
    }
  }
}
