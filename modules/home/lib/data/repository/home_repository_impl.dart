import 'package:home/home.dart';

class HomeRepositoryImpl implements HomeRepository {
  const HomeRepositoryImpl({required HomeRemoteDataSource remoteDataSource})
      : _remoteDataSource = remoteDataSource;

  final HomeRemoteDataSource _remoteDataSource;
  @override
  Future<void> saveBook(BookingModel model) async {
    await _remoteDataSource.saveBook(model);
  }
}
