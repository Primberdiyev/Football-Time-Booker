sealed class ExtendedError {
  const ExtendedError();
}

class NoConnectionError extends ExtendedError {
  const NoConnectionError();
}

class ParseError extends ExtendedError {
  const ParseError(this.error, this.st);

  final Object error;
  final StackTrace st;
}
