import 'package:common_base/common_base.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:home/home.dart';

part 'home_bloc.freezed.dart';
part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends BaseBloc<HomeEvent, HomeState> {
  HomeBloc({required SaveBookUseCase saveBookUseCase})
      : _saveBookUseCase = saveBookUseCase,
        super(HomeState()) {
    on<SaveBookEvent>(_saveBook);
  }
  final SaveBookUseCase _saveBookUseCase;

  void _saveBook(SaveBookEvent event, Emitter<HomeState> emit) async {
    emit(
      state.copyWith(
        saveBookStatus: Statuses.loading,
      ),
    );
    final result = await _saveBookUseCase(event.model);
    result.fold(
      onFailure: (e) => emit(
        state.copyWith(
          saveBookStatus: Statuses.error,
        ),
      ),
      onSuccess: (_) => emit(
        state.copyWith(saveBookStatus: Statuses.success),
      ),
    );
  }
}
