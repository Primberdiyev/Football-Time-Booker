part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {
  const AuthEvent();
}

class SignInEvent extends AuthEvent {
  const SignInEvent({required this.login, required this.password});

  final String login;
  final String password;
}

class CheckIsRegisteredEvent extends AuthEvent {}
