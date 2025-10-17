import 'package:common_base/common_base.dart';
import 'package:flutter/cupertino.dart';

/// Вспомогательный класс для создания и закрытия bloc аналогично BlocProvider,
/// но без распространения по дереву
class BlocDisposer<T extends BaseBloc> extends StatefulWidget {
  const BlocDisposer({
    super.key,
    required this.create,
    required this.builder,
  });

  final BlocCreator<T> create;
  final Builder<T> builder;

  @override
  State<BlocDisposer<T>> createState() => _BlocDisposerState<T>();
}

class _BlocDisposerState<T extends BaseBloc> extends State<BlocDisposer<T>> {
  late final T bloc;

  @override
  void initState() {
    bloc = widget.create(context);
    super.initState();
  }

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => bloc,
      child: widget.builder(context, bloc),
    );
  }
}

typedef BlocCreator<T extends BaseBloc> = T Function(BuildContext context);
typedef Builder<T extends BaseBloc> = Widget Function(
  BuildContext context,
  T bloc,
);
