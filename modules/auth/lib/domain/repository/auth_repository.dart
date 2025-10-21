import 'dart:async';
import 'package:auth/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRepository {
  FutureOr<User?> signIn(SignInParams params);
}
