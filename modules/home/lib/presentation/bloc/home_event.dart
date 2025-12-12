part of 'home_bloc.dart';

abstract class HomeEvent {
  const HomeEvent();
}

class SaveBookEvent extends HomeEvent {
  const SaveBookEvent({required this.model});

  final BookingModel model;
}
