import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:network/network.dart';
import 'package:talker/talker.dart';

class FirebaseErrorHandlerImpl implements FirebaseErrorHandler {
  const FirebaseErrorHandlerImpl(this._talker);

  final Talker _talker;

  @override
  Future<T> tryCall<T>(Future<T> Function() call) async {
    try {
      return await call();
    } on FirebaseAuthException catch (e, s) {
      _talker.error('FirebaseAuthException: ${e.code}', s);
      return switch (e.code) {
        'user-not-found' ||
        'wrong-password' ||
        'invalid-credential' =>
          throw AuthFailure(
            message: 'login yoki parol xato. Iltimos, qayta urinib koʻring.',
          ),
        'email-already-in-use' => throw AuthFailure(
            message: 'Bu login allaqachon roʻyxatdan oʻtgan.',
          ),
        'network-request-failed' => throw const NoConnectionFailure(),
        _ => throw AuthFailure(
            message: e.message ?? 'Nomaʼlum avtorizatsiya xatosi',
          ),
      };
    } on FirebaseException catch (e, s) {
      _talker.error('FirebaseException: ${e.code}', s);
      return switch (e.code) {
        'permission-denied' => throw const FirebaseFailure(
            message: 'Sizda ushbu operatsiyani bajarish uchun ruxsat yo\'q.',
          ),
        'unavailable' => throw const NoConnectionFailure(),
        _ => throw FirebaseFailure(
            message: e.message ?? 'Nomaʼlum Firebase xatosi',
          ),
      };
    } on ExtendedError catch (e, s) {
      _talker.error('Custom ExtendedError', s);
      rethrow;
    } catch (e, s) {
      _talker.error('Unhandled Error in Firebase: $e', s);
      if (kDebugMode) {
        rethrow;
      }
      throw UnhandledFailure(e, s);
    }
  }
}
