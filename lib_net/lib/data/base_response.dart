///
/// @date: 2022/4/5 17:43
/// @author: Sensi
/// @remark:
///
class BaseResponse<T> {
  int code = -1;
  String message = '';
  T? data;

  BaseResponse parse(Map json) {
    code = json['errorCode'];
    message = json['errorMsg'];
    if (json.containsKey('data')) {
      data = fromJsonAsT(json['data']);
    }
    return this;
  }

  T? fromJsonAsT(dynamic json) => null;
}
