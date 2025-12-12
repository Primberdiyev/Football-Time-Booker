import 'dart:async';
import 'package:auth/auth.dart';
import 'package:common_base/common_base.dart';

class SignInUseCase extends UseCase<UserModel?, SignInParams> {
  SignInUseCase({
    required AuthRepository repository,
  }) : _repository = repository;

  final AuthRepository _repository;

  @override
  FutureOr<UserModel?> makeRequest(params) => _repository.signIn(params);
}

class SignInParams {
  const SignInParams({
    required this.login,
    required this.password,
  });

  final String login;
  final String password;
}
