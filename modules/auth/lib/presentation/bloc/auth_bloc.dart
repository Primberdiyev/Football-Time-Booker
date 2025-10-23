import 'package:auth/auth.dart';
import 'package:common_base/common_base.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';
import 'package:network/network.dart';
part 'auth_bloc.freezed.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends BaseBloc<AuthEvent, AuthState> {
  AuthBloc(
      {required SignInUseCase signInUseCase,
      required CheckIsRegisteredUseCase checkIsRegisteredUseCase})
      : _signInUseCase = signInUseCase,
        _checkIsRegisteredUseCase = checkIsRegisteredUseCase,
        super(AuthState()) {
    on<SignInEvent>(_signin);
    on<CheckIsRegisteredEvent>(_checkIsRegistered);
  }
  final SignInUseCase _signInUseCase;
  final CheckIsRegisteredUseCase _checkIsRegisteredUseCase;

  void _signin(SignInEvent event, Emitter<AuthState> emit) async {
    emit(
      state.copyWith(
        signInStatus: Statuses.loading,
      ),
    );
    final email = "${event.login}@gmail.com";
    final result = await _signInUseCase(
      SignInParams(
        email: email,
        password: event.password,
      ),
    );
    result.fold(
        onFailure: (e) => emit(
              state.copyWith(
                error: e,
                signInStatus: Statuses.error,
              ),
            ),
        onSuccess: (user) {
          if (user != null) {
            emit(
              state.copyWith(
                signInStatus: Statuses.success,
              ),
            );
          } else {
            emit(
              state.copyWith(
                signInStatus: Statuses.error,
              ),
            );
          }
        });
  }

  void _checkIsRegistered(
      CheckIsRegisteredEvent event, Emitter<AuthState> emit) async {
    await Future.delayed(Duration(milliseconds: 1500));
    final result = await _checkIsRegisteredUseCase(EmptyUseCaseParams());
    result.fold(
        onFailure: (e) => emit(
              state.copyWith(
                error: e,
                authStatus: AuthStatuses.notRegistered,
              ),
            ),
        onSuccess: (isRegistered) {
          if (isRegistered) {
            emit(state.copyWith(
              authStatus: AuthStatuses.registered,
            ));
          } else {
            emit(
              state.copyWith(
                authStatus: AuthStatuses.notRegistered,
              ),
            );
          }
        });
  }
}
