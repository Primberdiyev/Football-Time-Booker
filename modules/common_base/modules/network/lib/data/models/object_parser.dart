import 'package:network/network.dart';

class ObjectParser<T> implements DataParser<T> {
  ObjectParser(this._converter);

  final T Function(Map<String, dynamic> data) _converter;

  @override
  T parse(data) {
    try {
      return _converter(data as Map<String, dynamic>);
    } catch (e, s) {
      throw ParseError(
        e,
        s,
      );
    }
  }
}
