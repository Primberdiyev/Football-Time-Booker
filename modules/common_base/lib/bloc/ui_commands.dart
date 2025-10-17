import 'dart:async';

import 'package:common_base/common_base.dart';
import 'package:flutter/foundation.dart';

/// Расширяет блок для работы с одноразовыми событиями view слоя без участия state,
/// например показ диалога, тоста или навигация
mixin UiCommands<T extends UiCommand> on Closable {
  final StreamController<T> _uiCommandsController =
      StreamController.broadcast();

  late Stream<T> uiCommandsStream = _uiCommandsController.stream;

  @protected
  void addUiCommand(T command) {
    _uiCommandsController.add(command);
  }

  void _closeStream() {
    if (!_uiCommandsController.isClosed) _uiCommandsController.close();
  }

  @mustCallSuper
  @override
  Future<void> close() {
    _closeStream();
    return super.close();
  }
}

abstract class UiCommand {}
