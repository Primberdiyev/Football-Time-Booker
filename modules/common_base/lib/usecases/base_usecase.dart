import 'dart:async';

import 'package:common_base/common_base.dart';
import 'package:flutter/foundation.dart';

abstract class BaseUseCase<T, P, F> {
  const BaseUseCase();

  FutureOr<Result<F, T>> call(P params) async {
    try {
      final result = await makeRequest(params);
      return result is Result
          ? result.fold(
              onFailure: (e) => Result.failure(e),
              onSuccess: (s) => Result.success(s),
            )
          : Result.success(result);
    } catch (e, stackTrace) {
      final error = convertError(e, stackTrace);

      return Result.failure(error);
    }
  }

  @protected
  F convertError(Object error, StackTrace stackTrace);

  @protected
  FutureOr<T> makeRequest(P params);
}
