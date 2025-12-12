import 'package:common_base/endpoints.dart';
import 'package:home/home.dart';
import 'package:network/network.dart';

abstract class HomeRemoteDataSource {
  Future<String> saveBook(BookingModel model);

  Future<List<BookingDto>> getAllBooks();

  Future<void> deleteBook();
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  const HomeRemoteDataSourceImpl({required FirebaseService firebaseService})
      : _firebaseService = firebaseService;

  final FirebaseService _firebaseService;
  @override
  Future<String> saveBook(BookingModel model) async {
    final id = await _firebaseService.addDocument(
      collectionPath: Endpoints.stadiums,
      data: model.toJson(),
    );
    return id;
  }

  @override
  Future<List<BookingDto>> getAllBooks() async {
    return await _firebaseService.getCollection(
      Endpoints.stadiums,
      parser: ObjectParser(BookingDto.fromJson),
    );
  }

  @override
  Future<void> deleteBook() async {}
}
