import 'dart:async';
import 'package:auth/auth.dart';

abstract class AuthRepository {
  FutureOr<UserModel?> signIn(SignInParams params);

  bool isRegistered();
}
