import 'package:fluroDemo/model/article/article_index_list.dart';
import 'package:fluroDemo/screen/article/article_repo.dart';
import 'package:flutter/material.dart';

///
/// @date: 2022/4/14 16:57
/// @author: Sensi
/// @remark:
///
class ArticleViewModel extends ChangeNotifier {
  int page = 0;
  String _errorMessage = '';
  final List<Datas> _articleList = [];
  final ArticleRepository repository = ArticleRepository();

  List<Datas> get articleList => _articleList;

  void refresh() {
    page = 0;
    repository.refresh(
        (t) => refreshFinish(t), (code, msg) => errorMessage = msg);
  }

  void onLoad() {
    page++;
    repository.onLoad(page, (t) => onLoadFinish(t), (code, message) {
      page--;
      errorMessage = message;
    });
  }

  void refreshFinish(List<Datas> newData) {
    _articleList
      ..clear()
      ..addAll(newData);
    notifyListeners();
  }

  void onLoadFinish(List<Datas> newData) {
    _articleList.addAll(newData);
    notifyListeners();
  }

  String get errorMessage => _errorMessage;

  set errorMessage(String value) {
    _errorMessage = value;
    notifyListeners();
  }
}
