import 'package:lib_net/core/network_dio.dart';

import '../../model/article/article_index_list.dart';

///
/// @date: 2022/4/14 17:01
/// @author: Sensi
/// @remark:
///
class ArticleRepository {
  Future<bool> refresh(Function(List<Datas> t) onSuccess,
      [Function(int code, String msg)? onFailed]) async {
    return _request(0, onSuccess, onFailed);
  }

  Future<bool> onLoad(int page, Function(List<Datas> t) onSuccess,
      [Function(int code, String msg)? onFailed]) async {
    return _request(page, onSuccess, onFailed);
  }

  Future<bool> _request(int page, Function(List<Datas> t) onSuccess,
      Function(int code, String msg)? onFailed) async {
    ArticleIndexList res = await Network.request(
        ArticleIndexList(), '/article/list/$page/json', onSuccess: (indexList) {
      onSuccess.call(indexList.datas ?? []);
    }, onFailed: onFailed);
    return res.code == 0;
  }
}
