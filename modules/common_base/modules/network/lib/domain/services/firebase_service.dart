import 'package:firebase_auth/firebase_auth.dart';
import 'package:network/domain/domain.dart';

abstract interface class FirebaseService {
  Future<List<T>> getCollection<T>(
    String collectionPath, {
    required DataParser<T> parser,
    String? orderBy,
    bool descending = false,
    int? limit,
  });

  Future<T?> getDocument<T>(
    String collectionPath,
    String documentId, {
    required DataParser<T> parser,
  });

  Future<String> addDocument({
    required String collectionPath,
    required Map<String, dynamic> data,
  });

  Future<void> updateDocument({
    required String collectionPath,
    required String documentId,
    required Map<String, dynamic> data,
  });

  Future<void> deleteDocument({
    required String collectionPath,
    required String documentId,
  });

  Future<UserCredential> login({
    required String email,
    required String password,
  });
}
