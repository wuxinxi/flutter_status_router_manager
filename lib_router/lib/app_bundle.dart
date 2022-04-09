///
/// @date: 2022/4/7 15:59
/// @author: TangRen
/// @remark:
///
class Bundle {
  final Map<String, dynamic> _map = {};

  putInt(String k, int v) => _map[k] = v;

  int getInt(String k) => _map[k] ?? 0;

  putString(String k, String v) => _map[k] = v;

  String getString(String k) => _map[k] ?? '';

  putBool(String k, bool v) => _map[k] = v;

  bool getBool(String k) => _map[k] ?? false;

  putList(String k, List v) => _map[k] = v;

  List getList(String k) => _map[k] ?? [];

  putMap(String k, Map v) => _map[k] = v;

  Map getMap(String k) => _map[k] ?? {};

  put<T>(String k, T t) => _map[k] = t;

  T? get<T>(String k) => _map[k];

  @override
  String toString() {
    return _map.toString();
  }
}
