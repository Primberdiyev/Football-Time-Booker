import 'package:common_base/common_base.dart';
import 'package:network/network.dart';

abstract class UseCase<T, P> extends BaseUseCase<T, P, Failure> {
  const UseCase();

  @override
  Failure convertError(Object error, StackTrace stackTrace) {
    if (error is Failure) {
      return error;
    }

    throw error;
  }
}
