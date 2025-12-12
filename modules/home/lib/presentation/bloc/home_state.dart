part of 'home_bloc.dart';

@freezed
abstract class HomeState with _$HomeState {
  const factory HomeState({
    @Default(Statuses.initial) Statuses saveBookStatus,
  }) = _HomeState;

  const HomeState._();
}
