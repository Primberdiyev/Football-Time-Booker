import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:network/network.dart';

export 'package:flutter_bloc/flutter_bloc.dart';

abstract class BaseBloc<E, S> extends Bloc<E, S> implements Closable {
  BaseBloc(super.state);

  @protected
  List<StreamSubscription?> subs = [];

  @protected
  List<StreamController?> streamControllers = [];

  void addAll(List<E> eventList) {
    for (final e in eventList) {
      add(e);
    }
  }

  @mustCallSuper
  @override
  Future<void> close() {
    for (final e in subs) {
      e?.cancel();
    }

    for (var e in streamControllers) {
      e?.close();
    }

    return super.close();
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
    debugPrint("bloc onError $error");

    // throw ((error is Failure) ? error : UnhandledFailure(error, stackTrace));
  }

  @mustCallSuper
  Never onFailure(Failure failure) {
    debugPrint("bloc onFailure $failure");
    throw failure;
  }
}

abstract interface class Closable {
  @mustCallSuper
  Future<void> close();
}
