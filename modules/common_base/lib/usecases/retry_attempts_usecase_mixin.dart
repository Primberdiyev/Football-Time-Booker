import 'dart:async';

import 'package:common_base/common_base.dart';
import 'package:network/network.dart';

mixin RetryAttemptsUseCaseMixin<T, P> on UseCase<T, P> {
  int maxRetryAttemptsCount = 3;
  int _failedRetryAttemptsCount = 0;
  P? _storedParams;
  bool _isRetry = false;

  @override
  FutureOr<Result<Failure, T>> call(P params) {
    _storedParams = params;
    if (!_isRetry) _failedRetryAttemptsCount = 0;
    return super.call(params);
  }

  FutureOr<Result<Failure, T>> retry() async {
    final params = _storedParams;
    if (params != null) {
      _isRetry = true;
      final result = await call(params);
      _isRetry = false;
      return result.fold(
        onFailure: (failure) {
          if (failure is NetworkInfoFailure) {
            _failedRetryAttemptsCount++;
            if (_failedRetryAttemptsCount >= maxRetryAttemptsCount) {
              return const Result.failure(RetryMaxAttemptsFailure());
            }
          }
          return Result.failure(failure);
        },
        onSuccess: Result.success,
      );
    } else {
      return const Result.failure(
        CustomFailure(title: "retry cant be call first"),
      );
    }
  }
}
