import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:network/network.dart';
import 'package:talker/talker.dart';

class FirebaseServiceImpl implements FirebaseService {
  FirebaseServiceImpl({
    required FirebaseFirestore firestore,
    required FirebaseAuth firebaseAuth,
    required Talker talker,
  })  : _firestore = firestore,
        _firebaseAuth = firebaseAuth,
        _errorHandler = FirebaseErrorHandlerImpl(talker);

  final FirebaseFirestore _firestore;
  final FirebaseAuth _firebaseAuth;
  final FirebaseErrorHandlerImpl _errorHandler;

  @override
  Future<String> addDocument({
    required String collectionPath,
    required Map<String, dynamic> data,
  }) =>
      _errorHandler.tryCall(
        () async {
          final docRef = await _firestore.collection(collectionPath).add(data);
          return docRef.id;
        },
      );

  @override
  Future<void> deleteDocument({
    required String collectionPath,
    required String documentId,
  }) =>
      _errorHandler.tryCall(
        () => _firestore.collection(collectionPath).doc(documentId).delete(),
      );

  @override
  Future<List<T>> getCollection<T>(
    String collectionPath, {
    required DataParser<T> parser,
    String? orderBy,
    bool descending = false,
    int? limit,
  }) =>
      _errorHandler.tryCall(
        () async {
          Query query = _firestore.collection(collectionPath);
          if (orderBy != null) {
            query = query.orderBy(orderBy, descending: descending);
          }
          if (limit != null) {
            query = query.limit(limit);
          }
          final snapshot = await query.get();
          if (snapshot.docs.isEmpty) {
            // throw const DocumentNotFoundFailure();
          }

          return snapshot.docs.map((doc) {
            final rawData = doc.data();
            if (rawData == null || rawData is! Map<String, dynamic>) {}

            return parser.parse(rawData);
          }).toList();
        },
      );

  @override
  Future<T?> getDocument<T>(
    String collectionPath,
    String documentId, {
    required DataParser<T> parser,
  }) =>
      _errorHandler.tryCall(
        () async {
          final docSnapshot =
              await _firestore.collection(collectionPath).doc(documentId).get();
          if (docSnapshot.exists && docSnapshot.data() != null) {
            return parser.parse(
              docSnapshot.data(),
            );
          }
          return null;
        },
      );

  @override
  Future<void> updateDocument({
    required String collectionPath,
    required String documentId,
    required Map<String, dynamic> data,
  }) =>
      _errorHandler.tryCall(
        () =>
            _firestore.collection(collectionPath).doc(documentId).update(data),
      );

  @override
  Future<UserCredential> login({
    required String email,
    required String password,
  }) =>
      _errorHandler.tryCall(
        () => _firebaseAuth.signInWithEmailAndPassword(
          email: email,
          password: password,
        ),
      );
}
