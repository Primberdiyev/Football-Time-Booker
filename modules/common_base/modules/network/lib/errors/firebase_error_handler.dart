abstract class FirebaseErrorHandler {
  const FirebaseErrorHandler();

  Future<T> tryCall<T>(Future<T> Function() call);
}
