import 'dart:developer';

import 'package:fluroDemo/model/article/article_index_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:lib_net/core/network_dio.dart';

import 'component/lottie_loading.dart';

///
/// @date: 2022/4/13 15:24
/// @author: Sensi
/// @remark:
///
class ArticleScreen extends StatefulWidget {
  const ArticleScreen({Key? key}) : super(key: key);

  @override
  State<ArticleScreen> createState() => _ArticleScreenState();
}

class _ArticleScreenState extends State<ArticleScreen> {
  late EasyRefreshController _easyRefreshController;
  final List<Datas> _items = [];
  int page = 0;
  bool loadFinished = false;

  Future<bool> refresh() async {
    page = 0;
    return onRequest(
        page,
        (dataList) => _items
          ..clear()
          ..addAll(dataList));
  }

  Future<bool> onLoad(int page) async {
    return onRequest(page, (dataList) => _items.addAll(dataList));
  }

  Future<bool> onRequest(int page, Function(List<Datas> t) onSuccess) async {
    ArticleIndexList res = await FHttp.getInstance().request(
        ArticleIndexList(), '/article/list/$page/json', onSuccess: (indexList) {
      onSuccess.call(indexList.datas ?? []);
    });
    loadFinished = true;
    setState(() {});
    return res.code == 0;
  }

  @override
  void initState() {
    super.initState();
    // refresh();
    _easyRefreshController = EasyRefreshController();
  }

  @override
  void dispose() {
    _easyRefreshController.dispose();
    super.dispose();
  }

  placeholderWidget() {
    return loadFinished && _items.isEmpty
        ? Center(
            child: TextButton(
                child: const Text('Retry'),
                onPressed: () => _easyRefreshController.callRefresh()))
        : null;
  }

  @override
  Widget build(BuildContext context) {
    log('build~');
    return Scaffold(
        body: SafeArea(
      child: EasyRefresh.custom(
        controller: _easyRefreshController,
        enableControlFinishLoad: true,
        enableControlFinishRefresh: true,
        firstRefresh: true,
        //刷新时也可以加载更多
        taskIndependence: true,
        header: LottieHeader(),
        footer: LottieFooter(),
        firstRefreshWidget: const Center(
          child: CircularProgressIndicator(),
        ),
        emptyWidget: placeholderWidget(),
        slivers: [
          SliverList(
              delegate: SliverChildBuilderDelegate(
                  (context, index) => Card(
                      child: ListTile(title: Text(_items[index].title ?? ''))),
                  childCount: _items.length)),
        ],
        onRefresh: () async {
          bool res = await refresh();
          _easyRefreshController.finishRefresh(success: res);
        },
        onLoad: () async {
          bool res = await onLoad(page = page + 1);
          _easyRefreshController.finishLoad(success: res);
        },
      ),
    ));
  }
}
