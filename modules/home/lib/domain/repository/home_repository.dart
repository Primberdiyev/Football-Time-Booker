import 'package:home/home.dart';

abstract class HomeRepository {
  Future<void> saveBook(BookingModel model);
}
