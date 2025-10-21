part of 'auth_bloc.dart';

@freezed
abstract class AuthState with _$AuthState {
  const factory AuthState({
    @Default(Statuses.initial) Statuses signInStatus,
    Failure? error,
    AuthStatuses? authStatus,
  }) = _AuthState;

  const AuthState._();
}
