import 'dart:async';

import 'package:common_base/common_base.dart';
import 'package:home/home.dart';

class SaveBookUseCase extends UseCase<void, BookingModel> {
  SaveBookUseCase({required HomeRepository repository})
      : _repository = repository;

  final HomeRepository _repository;
  @override
  FutureOr<void> makeRequest(BookingModel params) =>
      _repository.saveBook(params);
}
