import 'package:network/network.dart';

class ListParser<T> implements DataParser<List<T>> {
  ListParser(
    this._converter, {
    this.forKey,
  });

  final T Function(Map<String, dynamic> data) _converter;
  final String? forKey;

  @override
  List<T> parse(dynamic data) {
    try {
      if (data is List) {
        return data
            .map((json) => _converter(json as Map<String, dynamic>))
            .toList();
      }

      if (data is Map && forKey != null && data[forKey] is List) {
        return (data[forKey] as List)
            .map((json) => _converter(json as Map<String, dynamic>))
            .toList();
      }

      return <T>[];
    } catch (e, s) {
      throw ParseError(e, s);
    }
  }
}
