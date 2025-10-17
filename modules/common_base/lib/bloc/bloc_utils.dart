import 'package:common_base/common_base.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';


mixin AddEvent<BlocT extends Bloc<EventT, Object>, EventT> on StatelessWidget {
  void add(BuildContext context, EventT event) =>
      context.read<BlocT>().add(event);
}

mixin AddEventStateful<
    WidgetT extends StatefulWidget,
    BlocT extends Bloc<EventT, Object>,
    EventT extends Equatable> on State<WidgetT> {
  void add(EventT event) => context.read<BlocT>().add(event);
}


WhenChangedCompanion<T> whenParamsChanged<T>(WhenParamsWrapper<T> wrapper) {
  return (T previous, T current) =>
      EquatableArray(wrapper(previous)) != EquatableArray(wrapper(current));
}

WhenChangedCompanion<T> whenParamChanged<T>(WhenParamWrapper<T> wrapper) {
  return (T previous, T current) => wrapper(previous) != wrapper(current);
}

typedef WhenChangedCompanion<T> = bool Function(T previous, T current);
typedef WhenParamsWrapper<T> = List<Object?> Function(T state);
typedef WhenParamWrapper<T> = Object? Function(T state);
