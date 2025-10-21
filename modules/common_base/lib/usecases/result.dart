// ignore_for_file: non_nullable_equals_parameter, dangling_library_doc_comments

/// Class for wrapping result of a function so it can return 2 values.
///
/// Commonly used to get rid of try..catch clauses and return either failure
/// object or success object (or void if no object return needed)
///
/// In functions/methods where you need to return Result object use:
///
/// [Result.success] factory if function/method was successfully completed and
/// return value inside this constructor.
///
/// [Result.failure] factory if function/method has ended with failure. You can
/// pass failure object into this constructor to distinct error type in
/// outer functions/methods.
///
/// In functions/methods where you receive [Result] object use [fold] method
/// to define behaviours depending on the outcome
///

abstract interface class Result<F, V> {
  const factory Result.success(V value) = _SuccessResult;
  const factory Result.failure(F failure) = _FailureResult;

  TResult fold<TResult>({
    required TResult Function(F failure) onFailure,
    required TResult Function(V value) onSuccess,
  });
}

class _SuccessResult<F, V> implements Result<F, V> {
  const _SuccessResult(this._value);

  final V _value;

  @override
  TResult fold<TResult>({
    required TResult Function(F failure) onFailure,
    required TResult Function(V value) onSuccess,
  }) {
    return onSuccess(_value);
  }

  @override
  bool operator ==(Object? other) {
    return other is _SuccessResult && _value == other._value;
  }

  @override
  int get hashCode => _value.hashCode;
}

class _FailureResult<F, V> implements Result<F, V> {
  const _FailureResult(this._failure);

  final F _failure;

  @override
  TResult fold<TResult>({
    required TResult Function(F failure) onFailure,
    required TResult Function(V value) onSuccess,
  }) {
    return onFailure(_failure);
  }

  @override
  bool operator ==(Object? other) {
    return other is _FailureResult && _failure == other._failure;
  }

  @override
  int get hashCode => _failure.hashCode;
}
