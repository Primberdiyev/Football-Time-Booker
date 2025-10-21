import 'package:auth/auth.dart';
import 'package:common_base/common_base.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';
import 'package:network/network.dart';
part 'auth_bloc.freezed.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends BaseBloc<AuthEvent, AuthState> {
  AuthBloc({required SignInUseCase signInUseCase})
      : _signInUseCase = signInUseCase,
        super(AuthState()) {
    on<SignInEvent>(_signin);
  }
  final SignInUseCase _signInUseCase;

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
}
