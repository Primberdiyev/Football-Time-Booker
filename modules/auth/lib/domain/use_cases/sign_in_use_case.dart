import 'dart:async';

import 'package:auth/auth.dart';
import 'package:common_base/common_base.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignInUseCase extends UseCase<User?, SignInParams> {
  const SignInUseCase({
    required AuthRepository repository,
  }) : _repository = repository;

  final AuthRepository _repository;
  @override
  FutureOr<User?> makeRequest(params) => _repository.signIn(params);
}
